#macro SK_TYPE_TRANSLATE_TIMELINE "translate_timeline"
enum sk_data_translate_timeline{
	keyframes,
	target
}
#macro SK_TRANSLATE_KEYFRAME_TIME 0
#macro SK_TRANSLATE_KEYFRAME_X 1
#macro SK_TRANSLATE_KEYFRAME_Y 2
#macro SK_TRANSLATE_KEYFRAME_EASE 3
#macro SK_TRANSLATE_KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data_translate_timeline.keyframes] = ds_list_create();
sk_translate_timeline_set_bone(argument0,undefined);