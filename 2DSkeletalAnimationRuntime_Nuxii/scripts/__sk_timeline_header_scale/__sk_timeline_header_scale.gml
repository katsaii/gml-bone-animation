#macro sk_type_timeline_scale __sk_timeline_header_scale
enum sk_keyframe_scale{
	time = sk_timeline_keyframe_time,
	dx = sk_timeline_keyframe_body,
	dy,
	tweenEasing,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_scale.ENTRIES,sk_timeline_scale_apply);