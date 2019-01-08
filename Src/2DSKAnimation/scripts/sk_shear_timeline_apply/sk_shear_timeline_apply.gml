__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
var sk_target = argument0[sk_data_shear_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_SHEAR_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_SHEAR_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_shear_timeline.keyframes];
// interpolate
var sk_interpolation = sk_ease(argument3,sk_keyframes[| sk_keyframeA_id+SK_SHEAR_KEYFRAME_EASE]);
var sk_x = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SHEAR_KEYFRAME_X],
	sk_keyframes[| sk_keyframeB_id+SK_SHEAR_KEYFRAME_X],
	sk_interpolation
);
var sk_y = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SHEAR_KEYFRAME_Y],
	sk_keyframes[| sk_keyframeB_id+SK_SHEAR_KEYFRAME_Y],
	sk_interpolation
);
// apply
switch(argument4){
	case SK_MIX_BLEND:
		var sk_xshear = sk_target[sk_data_bone.appliedXShear];
		var sk_yshear = sk_target[sk_data_bone.appliedYShear];
		sk_target[@ sk_data_bone.appliedXShear] = sk_xshear-angle_difference(sk_xshear,sk_target[sk_data_bone.setupXShear]+sk_x)*argument5;
		sk_target[@ sk_data_bone.appliedYShear] = sk_yshear-angle_difference(sk_yshear,sk_target[sk_data_bone.setupYShear]+sk_y)*argument5;
	break;
	case SK_MIX_ADD: 
		sk_target[@ sk_data_bone.appliedXShear] = sk_target[sk_data_bone.appliedXShear]+sk_x*argument5;
		sk_target[@ sk_data_bone.appliedYShear] = sk_target[sk_data_bone.appliedYShear]+sk_y*argument5;
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupXShear] = sk_target[sk_data_bone.setupXShear]+sk_x*argument5;
		sk_target[@ sk_data_bone.setupYShear] = sk_target[sk_data_bone.setupYShear]+sk_y*argument5;
	break;
}