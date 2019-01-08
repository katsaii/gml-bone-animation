#macro SK_TYPE_PARENT_TIMELINE "parent_timeline"
enum sk_data_parent_timeline{
	keyframes,
	target
}
#macro SK_PARENT_KEYFRAME_TIME 0
#macro SK_PARENT_KEYFRAME_BONE 1
#macro SK_PARENT_KEYFRAME_ENTRIES 2
/// @desc initialise
/// @param variable
argument0[@ sk_data_parent_timeline.keyframes] = ds_list_create();
sk_parent_timeline_set_slot(argument0,undefined);