#macro sk_type_timeline_transform "ofTimelineTransform"
enum SK_TIMELINE_TRANSFORM{
	keyframes = sk_timeline_header_keyframes,
	constraint = sk_timeline_header_body,
	sizeof,
		kf_time = sk_timeline_keyframe_time,
		kf_translateMix = sk_timeline_keyframe_body,
		kf_scaleMix,
		kf_shearMix,
		kf_rotateMix,
		kf_tweenEasing,
		kf_ENTRIES
}
gml_pragma("global","sk_struct_type_add(sk_type_timeline_transform,SK_TIMELINE_TRANSFORM.sizeof,sk_construct_timeline,sk_destruct_timeline);");
/// @desc creates a structure
/// @param name
/// @param constraint
var sk_structure = sk_struct_create(sk_type_timeline_transform,argument0);
sk_timeline_set_body(sk_structure,argument1);
return sk_structure;