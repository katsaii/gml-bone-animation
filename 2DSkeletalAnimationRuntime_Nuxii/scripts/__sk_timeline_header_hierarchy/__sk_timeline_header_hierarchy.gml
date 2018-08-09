#macro sk_type_timeline_hierarchy "__sk_timeline_header_hierarchy"
enum sk_keyframe_hierarchy{
	time = sk_timeline_keyframe_time,
	tupleKey = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_hierarchy.ENTRIES,"sk_timeline_hierarchy_apply");