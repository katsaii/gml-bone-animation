#macro sk_type_timeline_colour __sk_timeline_header_colour
enum sk_keyframe_colour{
	time = sk_timeline_keyframe_time,
	colour = sk_timeline_keyframe_body,
	alpha,
	tweenEasing,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_colour.ENTRIES,sk_timeline_colour_apply);