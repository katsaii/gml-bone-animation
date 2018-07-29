#macro sk_type_timeline_event __sk_timeline_header_event
enum sk_keyframe_event{
	time = sk_timeline_keyframe_time,
	bone = sk_timeline_keyframe_body,
	str,
	float,
	int,
	sound,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_event.ENTRIES,sk_timeline_event_apply);