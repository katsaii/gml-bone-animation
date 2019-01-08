#macro SK_TYPE_COLOUR_TIMELINE "colour_timeline"
enum sk_data_colour_timeline{
	keyframes,
	target
}
#macro SK_COLOUR_KEYFRAME_TIME 0
#macro SK_COLOUR_KEYFRAME_COLOUR 1
#macro SK_COLOUR_KEYFRAME_ALPHA 2
#macro SK_COLOUR_KEYFRAME_EASE 3
#macro SK_COLOUR_KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data_colour_timeline.keyframes] = ds_list_create();
sk_colour_timeline_set_slot(argument0,undefined);