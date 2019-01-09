__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
var sk_target = argument0[sk_data_rotate_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_SCALE_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_SCALE_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_rotate_timeline.keyframes];
// interpolate
var sk_interpolation = sk_ease(argument3,sk_keyframes[| sk_keyframeA_id+SK_SCALE_KEYFRAME_EASE]);
var sk_x = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SCALE_KEYFRAME_X],
	sk_keyframes[| sk_keyframeB_id+SK_SCALE_KEYFRAME_X],
	sk_interpolation
);
var sk_y = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SCALE_KEYFRAME_Y],
	sk_keyframes[| sk_keyframeB_id+SK_SCALE_KEYFRAME_Y],
	sk_interpolation
);
// apply
switch(argument4){
	case SK_MIX_BLEND:
		sk_target[@ sk_data_bone.appliedXScale] = lerp(sk_target[sk_data_bone.appliedXScale],sk_target[sk_data_bone.setupXScale]+sk_x,argument5);
		sk_target[@ sk_data_bone.appliedYScale] = lerp(sk_target[sk_data_bone.appliedYScale],sk_target[sk_data_bone.setupYScale]+sk_y,argument5);
	break;
	case SK_MIX_ADD:
		sk_target[@ sk_data_bone.appliedXScale] = sk_target[sk_data_bone.appliedXScale]*lerp(1,sk_x,argument5);
		sk_target[@ sk_data_bone.appliedYScale] = sk_target[sk_data_bone.appliedYScale]*lerp(1,sk_y,argument5);
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupXScale] = sk_target[sk_data_bone.setupXScale]*lerp(1,sk_x,argument5);
		sk_target[@ sk_data_bone.setupYScale] = sk_target[sk_data_bone.setupYScale]*lerp(1,sk_y,argument5);
	break;
}