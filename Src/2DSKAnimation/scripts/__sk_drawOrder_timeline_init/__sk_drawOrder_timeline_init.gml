#macro SK_TYPE_DRAW_ORDER_TIMELINE "drawOrder_timeline"
enum sk_data_drawOrder_timeline{
	keyframes,
	target
}
#macro SK_DRAW_ORDER_KEYFRAME_TIME 0
#macro SK_DRAW_ORDER_KEYFRAME_TUPLE 1
#macro SK_DRAW_ORDER_KEYFRAME_ENTRIES 2
/// @desc initialise
/// @param variable
argument0[@ sk_data_drawOrder_timeline.keyframes] = ds_list_create();
sk_drawOrder_timeline_set_target(argument0,undefined);