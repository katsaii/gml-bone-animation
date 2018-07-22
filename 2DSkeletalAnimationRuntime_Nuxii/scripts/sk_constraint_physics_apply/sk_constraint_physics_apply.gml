gml_pragma("global",@'
	global.sk_globalVar_physicsConstraint_physicsState = noone;
	global.sk_globalVar_physicsConstraint_xDisplacement = 0; // adding the displacement to the world coordinate can simulate external movement
	global.sk_globalVar_physicsConstraint_yDisplacement = 0;
	global.sk_globalVar_physicsConstraint_xGrav = 0;
	global.sk_globalVar_physicsConstraint_yGrav = 0.25;
	global.sk_globalVar_physicsConstraint_drive = 0.9;
');
#macro sk_physics_boneState global.sk_globalVar_physicsConstraint_physicsState
#macro sk_physics_external_xDisplacement global.sk_globalVar_physicsConstraint_xDisplacement
#macro sk_physics_external_yDisplacement global.sk_globalVar_physicsConstraint_yDisplacement
#macro sk_physics_global_xGravity global.sk_globalVar_physicsConstraint_xGrav
#macro sk_physics_global_yGravity global.sk_globalVar_physicsConstraint_yGrav
#macro sk_physics_global_drivingRatio global.sk_globalVar_physicsConstraint_drive
/// @desc applys the constraint
/// @param constraint
var sk_phys_boneState = sk_physics_boneState;
if(ds_exists(sk_phys_boneState,ds_type_map)){
	// get effectors
	var sk_phys_bone_anchor = argument0[SK_CONSTRAINT_PHYSICS.boneAnchor];
	var sk_phys_bone_effector = argument0[SK_CONSTRAINT_PHYSICS.boneEffector];
	if(sk_struct_exists(sk_phys_bone_anchor,sk_type_bone)){
		// use the current physics state to update the bones
		var sk_phys_rigidBody = argument0[SK_CONSTRAINT_PHYSICS.rigid];
		var sk_phys_xdisplacement = sk_physics_external_xDisplacement;
		var sk_phys_ydisplacement = sk_physics_external_yDisplacement;
		var sk_phys_xgrav = argument0[SK_CONSTRAINT_PHYSICS.XGravFinal]+sk_physics_global_xGravity;
		var sk_phys_ygrav = argument0[SK_CONSTRAINT_PHYSICS.YGravFinal]+sk_physics_global_yGravity;
		var sk_phys_damping = clamp(argument0[SK_CONSTRAINT_PHYSICS.driveFinal]*sk_physics_global_drivingRatio,0,1);
		// get bone system
		var sk_phys_bones = argument0[SK_CONSTRAINT_PHYSICS.boneSystem];
		var sk_phys_bone_count = ds_list_size(sk_phys_bones);
		// iterate through the system to constrain the system to the effector
		if(sk_struct_exists(sk_phys_bone_effector,sk_type_bone)){
			var sk_phys_target_x = sk_phys_bone_effector[SK_BONE.XWorld];
			var sk_phys_target_y = sk_phys_bone_effector[SK_BONE.YWorld];
			var sk_phys_target_length = 0;
			for(var sk_phys_bone_id = sk_phys_bone_count-1; sk_phys_bone_id >= 0; sk_phys_bone_id--){
				var sk_bone = sk_phys_bones[| sk_phys_bone_id];
				if(sk_struct_exists(sk_bone,sk_type_bone)){
					// get current bone's physics state
					var sk_bone_state = sk_phys_boneState[? sk_bone];
					if(!is_array(sk_bone_state)){
						// create new physics state record for this bone
						sk_bone_state = [0,0,0,0]; // x,y,xprevious,yprevious
						sk_phys_boneState[? sk_bone] = sk_bone_state;
					}
					// apply FABRIK to the physics state
					var sk_phys_dx = sk_bone_state[0]-sk_phys_target_x;
					var sk_phys_dy = sk_bone_state[1]-sk_phys_target_y;
					var sk_phys_du = max(point_distance(0,0,sk_phys_dx,sk_phys_dy),0.01);
					if(sk_phys_rigidBody||(sk_phys_du>sk_phys_target_length)){
						// constrain length
						sk_phys_du = sk_phys_target_length/sk_phys_du;
						sk_phys_dx *= sk_phys_du;
						sk_phys_dy *= sk_phys_du;
						sk_phys_du = sk_phys_target_length;
					}
					var sk_phys_px = sk_phys_target_x+sk_phys_dx; // set current position
					var sk_phys_py = sk_phys_target_y+sk_phys_dy;
					sk_bone_state[@ 0] = sk_phys_px;
					sk_bone_state[@ 1] = sk_phys_py;
					// update new pivot
					sk_phys_target_x = sk_phys_px;
					sk_phys_target_y = sk_phys_py;
					// update joint length for next bone
					sk_phys_target_length = sk_bone[SK_BONE.length]*abs(point_distance(0,0,sk_bone[SK_BONE.m00],sk_bone[SK_BONE.m01]));
				}
			}
		}
		// iterate through the system to constrain the system to the anchor, apply physics, and update bone transforms
		var sk_phys_pivot_x = sk_phys_bone_anchor[SK_BONE.XWorld];
		var sk_phys_pivot_y = sk_phys_bone_anchor[SK_BONE.YWorld];
		for(var sk_phys_bone_id = 0; sk_phys_bone_id < sk_phys_bone_count; sk_phys_bone_id++){
			var sk_bone = sk_phys_bones[| sk_phys_bone_id];
			if(sk_struct_exists(sk_bone,sk_type_bone)){
				// get current bone's physics state
				var sk_bone_state = sk_phys_boneState[? sk_bone];
				if(!is_array(sk_bone_state)){
					// create new physics state record for this bone
					sk_bone_state = [0,0,0,0]; // x,y,xprevious,yprevious
					sk_phys_boneState[? sk_bone] = sk_bone_state;
				}
				// get the current bones joint length
				var sk_bone_m00 = sk_bone[SK_BONE.m00];
				var sk_bone_m01 = sk_bone[SK_BONE.m01];
				var sk_bone_m10 = sk_bone[SK_BONE.m10];
				var sk_bone_m11 = sk_bone[SK_BONE.m11];
				var sk_bone_determinant = (sk_bone_m00*sk_bone_m11)-(sk_bone_m01*sk_bone_m10);
				var sk_bone_xsc = abs(point_distance(0,0,sk_bone_m00,sk_bone_m01));
				var sk_bone_ysc = abs(point_distance(0,0,sk_bone_m10,sk_bone_m11));
				var sk_bone_ysh = -angle_difference(-darctan2(sk_bone_m11,sk_bone_m10),-darctan2(sk_bone_m01,sk_bone_m00));
				if(sk_bone_determinant<0){
					// determinant is negative
					sk_bone_ysc = -sk_bone_ysc;
				}
				var sk_phys_joint_length = sk_bone[SK_BONE.length]*sk_bone_xsc;
				// apply VERLET to the physics state
				var sk_phys_px = sk_bone_state[0];
				var sk_phys_py = sk_bone_state[1];
				var sk_phys_vx = (sk_phys_px-sk_phys_xdisplacement-sk_bone_state[2])*sk_phys_damping;
				var sk_phys_vy = (sk_phys_py-sk_phys_ydisplacement-sk_bone_state[3])*sk_phys_damping;
				sk_bone_state[@ 2] = sk_phys_px; // set previous position
				sk_bone_state[@ 3] = sk_phys_py;
				sk_phys_px += sk_phys_vx+sk_phys_xgrav;
				sk_phys_py += sk_phys_vy+sk_phys_ygrav;
				var sk_phys_dx = sk_phys_px-sk_phys_pivot_x;
				var sk_phys_dy = sk_phys_py-sk_phys_pivot_y;
				var sk_phys_du = max(point_distance(0,0,sk_phys_dx,sk_phys_dy),0.01);
				if(sk_phys_rigidBody||(sk_phys_du>sk_phys_joint_length)){
					// constrain length
					sk_phys_du = sk_phys_joint_length/sk_phys_du;
					sk_phys_dx *= sk_phys_du;
					sk_phys_dy *= sk_phys_du;
					sk_phys_du = sk_phys_joint_length;
				}
				sk_phys_px = sk_phys_pivot_x+sk_phys_dx; // set current position
				sk_phys_py = sk_phys_pivot_y+sk_phys_dy;
				sk_bone_state[@ 0] = sk_phys_px;
				sk_bone_state[@ 1] = sk_phys_py;
				// update bone transformation
				sk_bone_xsc *= sk_phys_du/sk_phys_joint_length;
				var sk_bone_rot = -darctan2(sk_phys_dy,sk_phys_dx);
				var sk_bone_rot_y = sk_bone_rot+90;
				sk_bone[@ SK_BONE.XWorld] = sk_phys_pivot_x;
				sk_bone[@ SK_BONE.YWorld] = sk_phys_pivot_y;
				sk_bone[@ SK_BONE.m00] = dcos(sk_bone_rot)*sk_bone_xsc;
				sk_bone[@ SK_BONE.m01] = -dsin(sk_bone_rot)*sk_bone_xsc;
				sk_bone[@ SK_BONE.m10] = dcos(sk_bone_rot_y)*sk_bone_ysc;
				sk_bone[@ SK_BONE.m11] = -dsin(sk_bone_rot_y)*sk_bone_ysc;
				// make applied transform invalid
				sk_bone[@ SK_BONE.badApplied] = true;
				// update new pivot
				sk_phys_pivot_x = sk_phys_px;
				sk_phys_pivot_y = sk_phys_py;
			}
		}
	}
}
