#macro sk_type_timeline_event "ofTimelineEvent"
enum SK_TIMELINE_EVENT{
	keyframes = sk_timeline_header_keyframes,
	event = sk_timeline_header_body,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_bone = sk_timeline_keyframe_body,
		kf_string,
		kf_real,
		kf_int,
		kf_sound,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_event,SK_TIMELINE_EVENT.sizeof,sk_construct_timeline,sk_destruct_timeline,SK_TIMELINE_EVENT.kf_ENTRIES);");
/// @desc creates a structure
/// @param name
/// @param event
var sk_structure = sk_struct_create(sk_type_timeline_event,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;