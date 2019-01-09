__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
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
var sk_target = argument0[sk_data_colour_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_COLOUR_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_COLOUR_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_colour_timeline.keyframes];
// interpolate
var sk_interpolation = sk_ease(argument3,sk_keyframes[| sk_keyframeA_id+SK_COLOUR_KEYFRAME_EASE]);
var sk_colour_rgb = merge_colour(sk_keyframes[| sk_keyframeA_id+SK_COLOUR_KEYFRAME_COLOUR],sk_keyframes[| sk_keyframeB_id+SK_COLOUR_KEYFRAME_COLOUR],sk_interpolation);
var sk_colour_a = lerp(sk_keyframes[| sk_keyframeA_id+SK_COLOUR_KEYFRAME_ALPHA],sk_keyframes[| sk_keyframeB_id+SK_COLOUR_KEYFRAME_ALPHA],sk_interpolation);
// apply
switch(argument4){
	case SK_MIX_BLEND: case SK_MIX_ADD: 
		sk_target[@ sk_data_slot.appliedColour] = merge_colour(sk_target[sk_data_slot.appliedColour],sk_colour_rgb,argument5);
		sk_target[@ sk_data_slot.appliedAlpha] = lerp(sk_target[sk_data_slot.appliedAlpha],sk_colour_a,argument5);
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_slot.setupColour] = merge_colour(sk_target[sk_data_slot.setupColour],sk_colour_rgb,argument5);
		sk_target[@ sk_data_slot.setupAlpha] = lerp(sk_target[sk_data_slot.setupAlpha],sk_colour_a,argument5);
	break;
}