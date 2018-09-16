enum SK_TIMELINE_FRAMES_ROTATE{
	time = sk_timeline_keyframe_time,
	rotation = sk_timeline_keyframe_body,
	cycles,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_ROTATE.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_rotate");
// return to caller
return sk_struct;