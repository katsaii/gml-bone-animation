__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_parent_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_PARENT_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_PARENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_PARENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_parent_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	var sk_bone = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_PARENT_KEYFRAME_BONE];
	// apply
	switch(sk_mixPose){
		case SK_MIX_BLEND: case SK_MIX_ADD:
			sk_target[@ sk_data_slot.appliedBone] = sk_bone;
		break;
		case SK_MIX_OVERWRITE:
			sk_target[@ sk_data_slot.setupBone] = sk_bone;
		break;
	}
}