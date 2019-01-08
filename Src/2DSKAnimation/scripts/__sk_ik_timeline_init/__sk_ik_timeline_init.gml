#macro SK_TYPE_IK_TIMELINE "ik_timeline"
enum sk_data_ik_timeline{
	keyframes,
	target
}
#macro SK_IK_KEYFRAME_TIME 0
#macro SK_IK_KEYFRAME_BEND 1
#macro SK_IK_KEYFRAME_WEIGHT 2
#macro SK_IK_KEYFRAME_EASE 3
#macro SK_IK_KEYFRAME_ENTRIES 4
/// @desc initialise
/// @param variable
argument0[@ sk_data_ik_timeline.keyframes] = ds_list_create();
sk_ik_timeline_set_constraint(argument0,undefined);