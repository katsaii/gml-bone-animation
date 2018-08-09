#macro sk_type_timeline_display "__sk_timeline_header_display"
enum sk_keyframe_display{
	time = sk_timeline_keyframe_time,
	attachmentKey = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_display.ENTRIES,"sk_timeline_display_apply");