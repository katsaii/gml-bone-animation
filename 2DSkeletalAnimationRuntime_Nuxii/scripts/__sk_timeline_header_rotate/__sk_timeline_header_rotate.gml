#macro sk_type_timeline_rotate __sk_timeline_header_rotate
enum sk_keyframe_rotate{
	time = sk_timeline_keyframe_time,
	rotation = sk_timeline_keyframe_body,
	cycles,
	tweenEasing,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_rotate.ENTRIES,sk_timeline_rotate_apply);