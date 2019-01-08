#macro SK_TYPE_SHEAR_TIMELINE "shear_timeline"
enum sk_data_shear_timeline{
	keyframes,
	target
}
#macro SK_SHEAR_KEYFRAME_TIME 0
#macro SK_SHEAR_KEYFRAME_X 1
#macro SK_SHEAR_KEYFRAME_Y 2
#macro SK_SHEAR_KEYFRAME_EASE 3
#macro SK_SHEAR_KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data_shear_timeline.keyframes] = ds_list_create();
sk_shear_timeline_set_bone(argument0,undefined);