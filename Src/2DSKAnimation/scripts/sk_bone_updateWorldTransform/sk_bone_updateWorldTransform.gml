/// @desc update world transform of supplied bone
/// @param bone
var sk_appliedTransform = argument0[sk_bone_var_appliedTransform];
var sk_x = sk_appliedTransform[0];
var sk_y = sk_appliedTransform[1];
var sk_xscale = sk_appliedTransform[2];
var sk_yscale = sk_appliedTransform[3];
var sk_xshear = sk_appliedTransform[4];
var sk_yshear = sk_appliedTransform[5];
var sk_rotation = sk_appliedTransform[6];
var sk_transform = sk_appliedTransform[7];
// get parent data
var sk_parent = argument0[sk_bone_var_parent];
if(sk_parent!=undefined){
	// get parent matrix
	var sk_pa = sk_parent[sk_bone_var_m00];
	var sk_pb = sk_parent[sk_bone_var_m01];
	var sk_pc = sk_parent[sk_bone_var_m10];
	var sk_pd = sk_parent[sk_bone_var_m11];
	// calculate translation transforms
	if(sk_transform&sk_transformMode_translate){
		// inherit translation
		argument0[@ sk_bone_var_x] = sk_parent[sk_bone_var_x]+sk_pa*sk_x+sk_pc*sk_y;
		argument0[@ sk_bone_var_y] = sk_parent[sk_bone_var_y]+sk_pb*sk_x+sk_pd*sk_y;
	} else {
		// don't inherit translation
		argument0[@ sk_bone_var_x] = sk_x;
		argument0[@ sk_bone_var_y] = sk_y;
	}
	sk_transform &= ~sk_transformMode_translate; // disable translation in transform mode
	// correct skew transforms
	var sk_skew = sk_transform&sk_transformMode_skew;
	if(!sk_skew){
		if(sk_transform&sk_transformMode_scale){ // non skewing transforms (scales are multiplied)
			// multiply current applied scale by parent scale
			sk_transform &= ~sk_transformMode_scale;
			sk_xscale *= point_distance(0,0,sk_pa,sk_pb);
			sk_yscale *= point_distance(0,0,sk_pc,sk_pd);
			if(sk_pa*sk_pd-sk_pb*sk_pc < 0){
				// (?)spriter compatibility(?)
				sk_yscale = -sk_yscale;
				sk_rotation = -sk_rotation;
			}
		}
	}
	sk_transform &= ~sk_transformMode_skew; // disable skewing in transform mode
	// calculate matrix transforms
	switch(sk_transform){
		case sk_transformMode_scale|sk_transformMode_rotate:
			var sk_rotationX = sk_rotation+sk_xshear;
			var sk_rotationY = sk_rotation+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_bone_var_m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
			argument0[@ sk_bone_var_m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
			argument0[@ sk_bone_var_m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
			argument0[@ sk_bone_var_m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
		break;
		case sk_transformMode_rotate:
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
			argument0[@ sk_bone_var_m00] = sk_a;
			argument0[@ sk_bone_var_m01] = sk_b;
			argument0[@ sk_bone_var_m10] = sk_c;
			argument0[@ sk_bone_var_m11] = sk_d;
		break;
		case sk_transformMode_scale:
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
			argument0[@ sk_bone_var_m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
			argument0[@ sk_bone_var_m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
			argument0[@ sk_bone_var_m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
			argument0[@ sk_bone_var_m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
		break;
		case sk_transformMode_none:
			// don't inherit anything; use applied transform
			var sk_rotationX = sk_rotation+sk_xshear;
			var sk_rotationY = sk_rotation+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			// set global flip
			argument0[@ sk_bone_var_m00] = sk_a;
			argument0[@ sk_bone_var_m01] = sk_b;
			argument0[@ sk_bone_var_m10] = sk_c;
			argument0[@ sk_bone_var_m11] = sk_d;
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
	argument0[@ sk_bone_var_m00] = sk_a;
	argument0[@ sk_bone_var_m01] = sk_b;
	argument0[@ sk_bone_var_m10] = sk_c;
	argument0[@ sk_bone_var_m11] = sk_d;
	argument0[@ sk_bone_var_x] = sk_x;
	argument0[@ sk_bone_var_y] = sk_y;
}
argument0[@ sk_bone_var_invalidAppliedTransform] = false;