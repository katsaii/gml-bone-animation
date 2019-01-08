#macro SK_TYPE_ROTATE_TIMELINE "rotate_timeline"
enum sk_data_rotate_timeline{
	keyframes,
	target
}
#macro SK_ROTATE_KEYFRAME_TIME 0
#macro SK_ROTATE_KEYFRAME_ANGLE 1
#macro SK_ROTATE_KEYFRAME_CYCLES 2
#macro SK_ROTATE_KEYFRAME_EASE 3
#macro SK_ROTATE_KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data_rotate_timeline.keyframes] = ds_list_create();
sk_rotate_timeline_set_bone(argument0,undefined);