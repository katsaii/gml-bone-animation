#macro sk_type_timeline_ik "ofTimelineIK"
enum SK_TIMELINE_IK{
	keyframes = sk_timeline_header_keyframes,
	constraint = sk_timeline_header_body,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_bendDir = sk_timeline_keyframe_body,
		kf_weight,
		kf_tweenEasing,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_ik,SK_TIMELINE_IK.sizeof,sk_construct_timeline,sk_destruct_timeline,SK_TIMELINE_IK.kf_ENTRIES);");
/// @desc creates a structure
/// @param name
/// @param constraint
var sk_structure = sk_struct_create(sk_type_timeline_ik,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;