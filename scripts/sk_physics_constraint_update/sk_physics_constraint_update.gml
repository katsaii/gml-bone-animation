__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc apply
/// @param constraint
var sk_phys_state = global.sk_physics_environment_state;
// get data
var sk_phys_anchor = argument0[sk_data_physics_constraint.anchor];
var sk_phys_system = argument0[sk_data_physics_constraint.system];
var sk_phys_effector = argument0[sk_data_physics_constraint.effector];
var sk_phys_rigidBody = argument0[sk_data_physics_constraint.rigid];
var sk_phys_dx = global.sk_physics_environment_displacement_x;
var sk_phys_dy = global.sk_physics_environment_displacement_y;
var sk_phys_gx = argument0[sk_data_physics_constraint.appliedXGravity]+global.sk_physics_environment_gravity_x;
var sk_phys_gy = argument0[sk_data_physics_constraint.appliedYGravity]+global.sk_physics_environment_gravity_y;
var sk_phys_drive = argument0[sk_data_physics_constraint.appliedDrive]*global.sk_physics_environment_drive;
var sk_bone_count = ds_list_size(sk_phys_system);
if(sk_phys_anchor!=undefined){
	// constrain bones to effector
	if(sk_phys_effector!=undefined){
		var sk_phys_target_x = sk_phys_effector[sk_data_bone.worldX];
		var sk_phys_target_y = sk_phys_effector[sk_data_bone.worldY];
		var sk_phys_target_length = 0;
		for(var sk_bone_id = sk_bone_count-1; sk_bone_id >= 0; sk_bone_id--){
			var sk_bone = sk_phys_system[| sk_bone_id];
			// get current bone's physics state
			var sk_phys_state_id = ds_list_find_index(sk_phys_state,sk_bone);
			if(sk_phys_state_id==-1){
				sk_phys_state_id = ds_list_size(sk_phys_state);
				sk_phys_state[| sk_phys_state_id+0] = sk_bone;
				sk_phys_state[| sk_phys_state_id+1] = 0; // x
				sk_phys_state[| sk_phys_state_id+2] = 0; // y
				sk_phys_state[| sk_phys_state_id+3] = 0; // xprevious
				sk_phys_state[| sk_phys_state_id+4] = 0; // yprevious
			}
			// apply FABRIK inverse kinematics towards effector
			var sk_dx = sk_phys_state[| sk_phys_state_id+1]-sk_phys_target_x;
			var sk_dy = sk_phys_state[| sk_phys_state_id+2]-sk_phys_target_y;
			var sk_dd = max(point_distance(0,0,sk_dx,sk_dy),0.01);
			if(sk_phys_rigidBody||(sk_dd>sk_phys_target_length)){
				var sk_du = sk_phys_target_length/sk_dd;
				sk_dx *= sk_du; // constrain length
				sk_dy *= sk_du;
				sk_dd = sk_phys_target_length;
			}
			// set new target position
			sk_phys_target_x = sk_phys_target_x+sk_dx;
			sk_phys_target_y = sk_phys_target_y+sk_dy;
			sk_phys_state[| sk_phys_state_id+1] = sk_phys_target_x;
			sk_phys_state[| sk_phys_state_id+2] = sk_phys_target_y;
			// update joint length for next bone
			sk_phys_target_length = sk_bone[sk_data_bone.length]*abs(point_distance(0,0,sk_bone[sk_data_bone.m00],sk_bone[sk_data_bone.m01]));
		}
	}
	// constrain to anchor
	var sk_phys_pivot_x = sk_phys_anchor[sk_data_bone.worldX];
	var sk_phys_pivot_y = sk_phys_anchor[sk_data_bone.worldY];
	for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
		var sk_bone = sk_phys_system[| sk_bone_id];
		// get the current bones joint length
		var sk_bone_m00 = sk_bone[sk_data_bone.m00];
		var sk_bone_m01 = sk_bone[sk_data_bone.m01];
		var sk_bone_m10 = sk_bone[sk_data_bone.m10];
		var sk_bone_m11 = sk_bone[sk_data_bone.m11];
		var sk_bone_determinant = (sk_bone_m00*sk_bone_m11)-(sk_bone_m01*sk_bone_m10);
		var sk_bone_xsc = abs(point_distance(0,0,sk_bone_m00,sk_bone_m01));
		var sk_bone_ysc = abs(point_distance(0,0,sk_bone_m10,sk_bone_m11));
		var sk_bone_ysh = -angle_difference(-darctan2(sk_bone_m11,sk_bone_m10),-darctan2(sk_bone_m01,sk_bone_m00));
		if(sk_bone_determinant<0) then sk_bone_ysc = -sk_bone_ysc;
		var sk_phys_joint_length = sk_bone[sk_data_bone.length]*sk_bone_xsc;
		// get current bone's physics state
		var sk_phys_state_id = ds_list_find_index(sk_phys_state,sk_bone);
		if(sk_phys_state_id==-1){
			sk_phys_state_id = ds_list_size(sk_phys_state);
			sk_phys_state[| sk_phys_state_id+0] = sk_bone;
			sk_phys_state[| sk_phys_state_id+1] = 0; // x
			sk_phys_state[| sk_phys_state_id+2] = 0; // y
			sk_phys_state[| sk_phys_state_id+3] = 0; // xprevious
			sk_phys_state[| sk_phys_state_id+4] = 0; // yprevious
		}
		// apply VERLET integration to this state
		var sk_phys_x = sk_phys_state[| sk_phys_state_id+1];
		var sk_phys_y = sk_phys_state[| sk_phys_state_id+2];
		var sk_phys_vx = (sk_phys_x-sk_phys_dx-sk_phys_state[| sk_phys_state_id+3])*sk_phys_drive;
		var sk_phys_vy = (sk_phys_y-sk_phys_dy-sk_phys_state[| sk_phys_state_id+4])*sk_phys_drive;
		sk_phys_state[| sk_phys_state_id+3] = sk_phys_x;
		sk_phys_state[| sk_phys_state_id+4] = sk_phys_y;
		sk_phys_x += sk_phys_vx+sk_phys_gx;
		sk_phys_y += sk_phys_vy+sk_phys_gy;
		// apply FABRIK inverse kinematics towards pivot
		var sk_dx = sk_phys_x-sk_phys_pivot_x;
		var sk_dy = sk_phys_y-sk_phys_pivot_y;
		var sk_dd = max(point_distance(0,0,sk_dx,sk_dy),0.01);
		if(sk_phys_rigidBody||(sk_dd>sk_phys_joint_length)){
			var sk_du = sk_phys_joint_length/sk_dd;
			sk_dx *= sk_du; // constrain length
			sk_dy *= sk_du;
			sk_dd = sk_phys_joint_length;
		}
		// update bone transform
		sk_bone_xsc *= sk_dd/sk_phys_joint_length;
		var sk_bone_rot = -darctan2(sk_dy,sk_dx);
		var sk_bone_rot_y = sk_bone_rot+90;
		sk_bone[@ sk_data_bone.worldX] = sk_phys_pivot_x;
		sk_bone[@ sk_data_bone.worldY] = sk_phys_pivot_y;
		sk_bone[@ sk_data_bone.m00] = dcos(sk_bone_rot)*sk_bone_xsc;
		sk_bone[@ sk_data_bone.m01] = -dsin(sk_bone_rot)*sk_bone_xsc;
		sk_bone[@ sk_data_bone.m10] = dcos(sk_bone_rot_y)*sk_bone_ysc;
		sk_bone[@ sk_data_bone.m11] = -dsin(sk_bone_rot_y)*sk_bone_ysc;
		sk_bone[@ sk_data_bone.invalidAppliedTransform] = true;
		// set new pivot
		sk_phys_pivot_x += sk_dx;
		sk_phys_pivot_y += sk_dy;
		sk_phys_state[| sk_phys_state_id+1] = sk_phys_pivot_x;
		sk_phys_state[| sk_phys_state_id+2] = sk_phys_pivot_y;
	}
}