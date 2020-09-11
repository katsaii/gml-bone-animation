__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_attachment_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_attachment_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	var sk_key = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_ATTACHMENT_KEYFRAME_KEY];
	var sk_attachment = ds_map_find_value(sk_target[sk_data_slot.availableAttachments],sk_key);
	// apply
	switch(sk_mixPose){
		case SK_MIX_BLEND: case SK_MIX_ADD:
			sk_target[@ sk_data_slot.appliedAttachment] = sk_attachment;
		break;
		case SK_MIX_OVERWRITE:
			sk_target[@ sk_data_slot.setupAttachmentKey] = sk_key;
			sk_target[@ sk_data_slot.setupAttachment] = sk_attachment;
		break;
	}
}