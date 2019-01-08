__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
var sk_target = argument0[sk_data_attachment_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_attachment_timeline.keyframes];
if(argument5>=0.5){
	// interpolate
	var sk_key = sk_keyframes[| ((argument3>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_ATTACHMENT_KEYFRAME_KEY];
	var sk_attachment = ds_map_find_value(sk_target[sk_data_slot.availableAttachments],sk_key);
	// apply
	switch(argument4){
		case SK_MIX_BLEND: case SK_MIX_ADD:
			sk_target[@ sk_data_slot.appliedAttachment] = sk_attachment;
		break;
		case SK_MIX_OVERWRITE:
			sk_target[@ sk_data_slot.setupAttachmentKey] = sk_key;
			sk_target[@ sk_data_slot.setupAttachment] = sk_attachment;
		break;
	}
}