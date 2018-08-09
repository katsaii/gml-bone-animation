#macro sk_type_timeline_transform "__sk_timeline_header_transform"
enum sk_keyframe_transform{
	time = sk_timeline_keyframe_time,
	translateMix = sk_timeline_keyframe_body,
	scaleMix,
	shearMix,
	rotateMix,
	tweenEasing,
	ENTRIES
}
/// @desc specialises a structure
/// @param command
/// @param struct
return __sk_timeline_pragma(argument0,argument1,sk_keyframe_transform.ENTRIES,"sk_timeline_transform_apply");