#macro SK_TYPE__TIMELINE "_timeline"
enum sk_data__timeline{
	keyframes,
	target
}
#macro SK__KEYFRAME_TIME 0
#macro SK__KEYFRAME_X 1
#macro SK__KEYFRAME_Y 2
#macro SK__KEYFRAME_EASE 3
#macro SK__KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data__timeline.keyframes] = ds_list_create();
sk__timeline_set_(argument0,undefined);