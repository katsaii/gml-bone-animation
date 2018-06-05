#macro sk_type_timeline_order "ofTimelineOrder"
enum SK_TIMELINE_ORDER{
	keyframes = sk_timeline_header_keyframes,
	target = sk_timeline_header_body,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_itemOffsetTuple = sk_timeline_keyframe_body,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_order,SK_TIMELINE_ORDER.sizeof,sk_construct_timeline,sk_destruct_timeline);");
/// @desc creates a structure
/// @param name
/// @param id
var sk_structure = sk_struct_create(sk_type_timeline_order,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;