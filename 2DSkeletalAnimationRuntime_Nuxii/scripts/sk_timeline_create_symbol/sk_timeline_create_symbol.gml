#macro sk_type_timeline_symbol "ofTimelineSymbol"
enum SK_TIMELINE_SYMBOL{
	keyframes = sk_timeline_header_keyframes,
	symbol = sk_timeline_header_body,
	/* nested timelines for each nested datastructure */
	NESTED_TIMELINE_TRANSLATE,
	NESTED_TIMELINE_SCALE,
	NESTED_TIMELINE_SHEAR,
	NESTED_TIMELINE_ROTATE,
	NESTED_TIMELINE_COLOUR,
	NESTED_TIMELINE_DISPLAY,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_bone = sk_timeline_keyframe_body,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_symbol,SK_TIMELINE_SYMBOL.sizeof,sk_construct_timeline,sk_destruct_timeline);");
/// @desc creates a structure
/// @param name
/// @param symbol
var sk_structure = sk_struct_create(sk_type_timeline_symbol,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;