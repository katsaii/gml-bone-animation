#macro SK_TYPE_EVENT_TIMELINE "event_timeline"
enum sk_data_event_timeline{
	keyframes,
	target
}
#macro SK_EVENT_KEYFRAME_TIME 0
#macro SK_EVENT_KEYFRAME_DATA_BONE 1
#macro SK_EVENT_KEYFRAME_DATA_STRING 2
#macro SK_EVENT_KEYFRAME_DATA_REAL 3
#macro SK_EVENT_KEYFRAME_DATA_INT 4
#macro SK_EVENT_KEYFRAME_DATA_SOUND 5
#macro SK_EVENT_KEYFRAME_ENTRIES 6
/// @desc initialise
/// @param variable
argument0[@ sk_data_event_timeline.keyframes] = ds_list_create();
sk_event_timeline_set_event(argument0,undefined);