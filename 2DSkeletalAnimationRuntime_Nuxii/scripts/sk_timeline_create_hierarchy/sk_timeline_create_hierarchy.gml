#macro sk_type_timeline_hierarchy "ofTimelineHierarchy"
enum SK_TIMELINE_HIERARCHY{
	keyframes = sk_timeline_header_keyframes,
	constraint = sk_timeline_header_body,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_tupleKey = sk_timeline_keyframe_body,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_hierarchy,SK_TIMELINE_HIERARCHY.sizeof,sk_construct_timeline,sk_destruct_timeline,SK_TIMELINE_HIERARCHY.kf_ENTRIES);");
/// @desc creates a structure
/// @param name
/// @param constraint
var sk_structure = sk_struct_create(sk_type_timeline_hierarchy,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;