#macro sk_type_timeline_ik "__sk_timeline_header_ik"
enum sk_keyframe_ik{
	time = sk_timeline_keyframe_time,
	bendDir = sk_timeline_keyframe_body,
	weight,
	tweenEasing,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_ik.ENTRIES,"sk_timeline_ik_apply");