__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc update world transform of supplied bone
/// @param bone
var sk_x = argument0[sk_data_bone.appliedX];
var sk_y = argument0[sk_data_bone.appliedY];
var sk_xscale = argument0[sk_data_bone.appliedXScale];
var sk_yscale = argument0[sk_data_bone.appliedYScale];
var sk_xshear = argument0[sk_data_bone.appliedXShear];
var sk_yshear = argument0[sk_data_bone.appliedYShear];
var sk_rotation = argument0[sk_data_bone.appliedRotation];
var sk_transform = argument0[sk_data_bone.appliedTransformMode];
// get parent data
var sk_parent = argument0[sk_data_bone.parent];
if(sk_parent!=undefined){
	// get parent matrix
	var sk_pa = sk_parent[sk_data_bone.m00];
	var sk_pb = sk_parent[sk_data_bone.m01];
	var sk_pc = sk_parent[sk_data_bone.m10];
	var sk_pd = sk_parent[sk_data_bone.m11];
	// calculate translation transforms
	if(sk_transform&SK_TRANSFORM_MODE_TRANSLATE){
		// inherit translation
		argument0[@ sk_data_bone.worldX] = sk_parent[sk_data_bone.worldX]+sk_pa*sk_x+sk_pc*sk_y;
		argument0[@ sk_data_bone.worldY] = sk_parent[sk_data_bone.worldY]+sk_pb*sk_x+sk_pd*sk_y;
	} else {
		// don't inherit translation
		argument0[@ sk_data_bone.worldX] = sk_x;
		argument0[@ sk_data_bone.worldY] = sk_y;
	}
	sk_transform &= ~SK_TRANSFORM_MODE_TRANSLATE; // disable translation in transform mode
	// correct skew transforms
	var sk_skew = sk_transform&SK_TRANSFORM_MODE_SKEW;
	if(!sk_skew){
		if(sk_transform&SK_TRANSFORM_MODE_SCALE){ // non skewing transforms (scales are multiplied)
			// multiply current applied scale by parent scale
			sk_transform &= ~SK_TRANSFORM_MODE_SCALE;
			sk_xscale *= point_distance(0,0,sk_pa,sk_pb);
			sk_yscale *= point_distance(0,0,sk_pc,sk_pd);
			if(sk_pa*sk_pd-sk_pb*sk_pc < 0){
				// (?)spriter compatibility(?)
				sk_yscale = -sk_yscale;
				sk_rotation = -sk_rotation;
			}
		}
	}
	sk_transform &= ~SK_TRANSFORM_MODE_SKEW; // disable skewing in transform mode
	// calculate matrix transforms
	switch(sk_transform){
		case SK_TRANSFORM_MODE_SCALE|SK_TRANSFORM_MODE_ROTATE:
			var sk_rotationX = sk_rotation+sk_xshear;
			var sk_rotationY = sk_rotation+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_data_bone.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
			argument0[@ sk_data_bone.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
			argument0[@ sk_data_bone.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
			argument0[@ sk_data_bone.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
		break;
		case SK_TRANSFORM_MODE_ROTATE:
			// same as normal, but cancel out scale
			var sk_rotation_final;
			if(sk_skew){
				var sk_cosine = dcos(sk_rotation);
				var sk_sine = -dsin(sk_rotation);
				sk_rotation_final = -darctan2( (sk_pb*sk_cosine)+(sk_pd*sk_sine), (sk_pa*sk_cosine)+(sk_pc*sk_sine) );
			} else {
				sk_rotation_final = sk_rotation-darctan2(sk_pb,sk_pa);
			}
			var sk_rotationX = sk_rotation_final+sk_xshear;
			var sk_rotationY = sk_rotation_final+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_data_bone.m00] = sk_a;
			argument0[@ sk_data_bone.m01] = sk_b;
			argument0[@ sk_data_bone.m10] = sk_c;
			argument0[@ sk_data_bone.m11] = sk_d;
		break;
		case SK_TRANSFORM_MODE_SCALE:
			// same as normal, but cancel out rotation
			var sk_parent_determinant = sk_pa*sk_pd - sk_pb*sk_pc;
			var sk_parent_rotation = -darctan2(sk_pb,sk_pa);
			var sk_rotationX = sk_rotation+sk_xshear-sk_parent_rotation;
			var sk_rotationY = sk_rotation+sk_yshear+90-sk_parent_rotation;
			if(sk_parent_determinant<0){
				sk_rotationX = -sk_rotationX;
				sk_rotationY = -sk_rotationY;
			}
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_data_bone.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
			argument0[@ sk_data_bone.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
			argument0[@ sk_data_bone.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
			argument0[@ sk_data_bone.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
		break;
		case SK_TRANSFORM_MODE_NONE:
			// don't inherit anything; use applied transform
			var sk_rotationX = sk_rotation+sk_xshear;
			var sk_rotationY = sk_rotation+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			// set global flip
			argument0[@ sk_data_bone.m00] = sk_a;
			argument0[@ sk_data_bone.m01] = sk_b;
			argument0[@ sk_data_bone.m10] = sk_c;
			argument0[@ sk_data_bone.m11] = sk_d;
		break;
	}
}else{
	// parent does not exist
	var sk_rotationX = sk_rotation+sk_xshear;
	var sk_rotationY = sk_rotation+sk_yshear+90;
	// set world matrix
	var sk_a = dcos(sk_rotationX)*sk_xscale;
	var sk_b = -dsin(sk_rotationX)*sk_xscale;
	var sk_c = dcos(sk_rotationY)*-sk_yscale;
	var sk_d = -dsin(sk_rotationY)*-sk_yscale;
	// set transforms
	argument0[@ sk_data_bone.m00] = sk_a;
	argument0[@ sk_data_bone.m01] = sk_b;
	argument0[@ sk_data_bone.m10] = sk_c;
	argument0[@ sk_data_bone.m11] = sk_d;
	argument0[@ sk_data_bone.worldX] = sk_x;
	argument0[@ sk_data_bone.worldY] = sk_y;
}
argument0[@ sk_data_bone.invalidAppliedTransform] = false;