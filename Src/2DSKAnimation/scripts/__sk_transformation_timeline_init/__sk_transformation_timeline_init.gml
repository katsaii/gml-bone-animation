#macro SK_TYPE_TRANSFORMATION_TIMELINE "transformation_timeline"
enum sk_data_transformation_timeline{
	keyframes,
	target
}
#macro SK_TRANSFORMATION_KEYFRAME_TIME 0
#macro SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE 1
#macro SK_TRANSFORMATION_KEYFRAME_MIX_SCALE 2
#macro SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR 3
#macro SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE 4
#macro SK_TRANSFORMATION_KEYFRAME_EASE 5
#macro SK_TRANSFORMATION_KEYFRAME_ENTRIES 6
/// @desc initialise
/// @param variable
argument0[@ sk_data_transformation_timeline.keyframes] = ds_list_create();
sk_transformation_timeline_set_constraint(argument0,undefined);