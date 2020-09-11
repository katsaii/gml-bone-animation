#macro SK_TYPE_SCALE_TIMELINE "scale_timeline"
enum sk_data_scale_timeline{
	keyframes,
	target
}
#macro SK_SCALE_KEYFRAME_TIME 0
#macro SK_SCALE_KEYFRAME_X 1
#macro SK_SCALE_KEYFRAME_Y 2
#macro SK_SCALE_KEYFRAME_EASE 3
#macro SK_SCALE_KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data_scale_timeline.keyframes] = ds_list_create();
sk_scale_timeline_set_bone(argument0,undefined);