#macro SK_TYPE_ATTACHMENT_TIMELINE "attachment_timeline"
enum sk_data_attachment_timeline{
	keyframes,
	target
}
#macro SK_ATTACHMENT_KEYFRAME_TIME 0
#macro SK_ATTACHMENT_KEYFRAME_KEY 1
#macro SK_ATTACHMENT_KEYFRAME_ENTRIES 2
/// @desc initialise
/// @param variable
argument0[@ sk_data_attachment_timeline.keyframes] = ds_list_create();
sk_attachment_timeline_set_slot(argument0,undefined);