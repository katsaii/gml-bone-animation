__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
if(false) then var sk_ignoreTheseArguments = [argument6,argument7];
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
/// @param mixDirection
var sk_target = argument0[sk_data_translate_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_TRANSLATE_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_TRANSLATE_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_translate_timeline.keyframes];
// interpolate
var sk_interpolation = sk_ease(argument3,sk_keyframes[| sk_keyframeA_id+SK_TRANSLATE_KEYFRAME_EASE]);
var sk_x = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_TRANSLATE_KEYFRAME_X],
	sk_keyframes[| sk_keyframeB_id+SK_TRANSLATE_KEYFRAME_X],
	sk_interpolation
);
var sk_y = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_TRANSLATE_KEYFRAME_Y],
	sk_keyframes[| sk_keyframeB_id+SK_TRANSLATE_KEYFRAME_Y],
	sk_interpolation
);
// apply
switch(argument4){
	case SK_MIX_BLEND:
		sk_target[@ sk_data_bone.appliedX] = lerp(sk_target[sk_data_bone.appliedX],sk_target[sk_data_bone.setupX]+sk_x,argument5);
		sk_target[@ sk_data_bone.appliedY] = lerp(sk_target[sk_data_bone.appliedY],sk_target[sk_data_bone.setupY]+sk_y,argument5);
	break;
	case SK_MIX_ADD:
		sk_target[@ sk_data_bone.appliedX] = sk_target[sk_data_bone.appliedX]+sk_x*argument5;
		sk_target[@ sk_data_bone.appliedY] = sk_target[sk_data_bone.appliedY]+sk_y*argument5;
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupX] = sk_target[sk_data_bone.setupX]+sk_x*argument5;
		sk_target[@ sk_data_bone.setupY] = sk_target[sk_data_bone.setupY]+sk_y*argument5;
	break;
}