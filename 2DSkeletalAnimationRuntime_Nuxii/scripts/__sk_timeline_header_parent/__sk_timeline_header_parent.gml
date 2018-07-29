#macro sk_type_timeline_parent __sk_timeline_header_parent
enum sk_keyframe_parent{
	time = sk_timeline_keyframe_time,
	bone = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_parent.ENTRIES,sk_timeline_parent_apply);