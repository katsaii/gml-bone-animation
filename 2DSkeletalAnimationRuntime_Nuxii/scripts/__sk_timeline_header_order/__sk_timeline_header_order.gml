#macro sk_type_timeline_order "__sk_timeline_header_order"
enum sk_keyframe_order{
	time = sk_timeline_keyframe_time,
	itemOffsetTuple = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_order.ENTRIES,"sk_timeline_order_apply");