#macro sk_type_timeline_colour "ofTimelineColour"
enum SK_TIMELINE_COLOUR{
	keyframes = sk_timeline_header_keyframes,
	slot = sk_timeline_header_body,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_colour = sk_timeline_keyframe_body,
		kf_alpha,
		kf_tweenEasing,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_colour,SK_TIMELINE_COLOUR.sizeof,sk_construct_timeline,sk_destruct_timeline);");
/// @desc creates a structure
/// @param name
/// @param slot
var sk_structure = sk_struct_create(sk_type_timeline_colour,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;