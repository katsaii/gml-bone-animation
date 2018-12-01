gml_pragma("global",@'
	global.sk_globalVar_skeletonFlag_flipX = false;
	global.sk_globalVar_skeletonFlag_flipY = false;
');
#macro sk_global_flipX global.sk_globalVar_skeletonFlag_flipX
#macro sk_global_flipY global.sk_globalVar_skeletonFlag_flipY
/// @desc update world transform of supplied bone
/// @param bone
var sk_bone = argument0;
var sk_x = sk_bone[SK_BONE.XApplied];
var sk_y = sk_bone[SK_BONE.YApplied];
var sk_xscale = sk_bone[SK_BONE.XScaleApplied];
var sk_yscale = sk_bone[SK_BONE.YScaleApplied];
var sk_xshear = sk_bone[SK_BONE.XShearApplied];
var sk_yshear = sk_bone[SK_BONE.YShearApplied];
var sk_rotation = sk_bone[SK_BONE.rotationApplied];
var sk_transform = sk_bone[SK_BONE.transformModeCorrected];
// get parent data
var sk_parent = sk_bone[SK_BONE.parent];
if(!sk_struct_isof(sk_parent,sk_type_bone)){
	// parent does not exist
	var sk_rotationX = sk_rotation+sk_xshear;
	var sk_rotationY = sk_rotation+sk_yshear+90;
	// set world matrix
	var sk_a = dcos(sk_rotationX)*sk_xscale;
	var sk_b = -dsin(sk_rotationX)*sk_xscale;
	var sk_c = dcos(sk_rotationY)*-sk_yscale;
	var sk_d = -dsin(sk_rotationY)*-sk_yscale;
	// set global flip
	if(sk_global_flipX){
		sk_x = -sk_x;
		sk_a = -sk_a;
		sk_c = -sk_c;
	}
	if(sk_global_flipY){
		sk_y = -sk_y;
		sk_b = -sk_b;
		sk_d = -sk_d;
	}
	// set transforms
	sk_bone[@ SK_BONE.m00] = sk_a;
	sk_bone[@ SK_BONE.m01] = sk_b;
	sk_bone[@ SK_BONE.m10] = sk_c;
	sk_bone[@ SK_BONE.m11] = sk_d;
	sk_bone[@ SK_BONE.XWorld] = sk_x;
	sk_bone[@ SK_BONE.YWorld] = sk_y;
	sk_bone[@ SK_BONE.badApplied] = false;
	return;
}
// get parent matrix
var sk_pa = sk_parent[SK_BONE.m00];
var sk_pb = sk_parent[SK_BONE.m01];
var sk_pc = sk_parent[SK_BONE.m10];
var sk_pd = sk_parent[SK_BONE.m11];
// calculate translation transforms
if(sk_transform&sk_transformMode_translate){
	// inherit translation
	sk_bone[@ SK_BONE.XWorld] = sk_parent[SK_BONE.XWorld] + sk_pa*sk_x+sk_pc*sk_y;
	sk_bone[@ SK_BONE.YWorld] = sk_parent[SK_BONE.YWorld] + sk_pb*sk_x+sk_pd*sk_y;
} else {
	// don't inherit translation
	if(sk_global_flipX){ sk_x = -sk_x; }
	if(sk_global_flipY){ sk_y = -sk_y; }
	sk_bone[@ SK_BONE.XWorld] = sk_x;
	sk_bone[@ SK_BONE.YWorld] = sk_y;
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
		sk_bone[@ SK_BONE.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
		sk_bone[@ SK_BONE.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
		sk_bone[@ SK_BONE.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
		sk_bone[@ SK_BONE.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
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
		sk_bone[@ SK_BONE.m00] = sk_a;
		sk_bone[@ SK_BONE.m01] = sk_b;
		sk_bone[@ SK_BONE.m10] = sk_c;
		sk_bone[@ SK_BONE.m11] = sk_d;
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
		sk_bone[@ SK_BONE.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
		sk_bone[@ SK_BONE.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
		sk_bone[@ SK_BONE.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
		sk_bone[@ SK_BONE.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
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
		if(sk_global_flipX){ sk_a = -sk_a; sk_c = -sk_c; }
		if(sk_global_flipY){ sk_b = -sk_b; sk_d = -sk_d; }
		sk_bone[@ SK_BONE.m00] = sk_a;
		sk_bone[@ SK_BONE.m01] = sk_b;
		sk_bone[@ SK_BONE.m10] = sk_c;
		sk_bone[@ SK_BONE.m11] = sk_d;
	break;
}
sk_bone[@ SK_BONE.badApplied] = false;