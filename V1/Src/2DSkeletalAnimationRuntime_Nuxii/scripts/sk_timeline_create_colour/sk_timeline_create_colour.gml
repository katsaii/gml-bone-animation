enum SK_TIMELINE_FRAMES_COLOUR{
	time = sk_timeline_keyframe_time,
	colour = sk_timeline_keyframe_body,
	alpha,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param slot
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_COLOUR.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_colour");
// return to caller
return sk_struct;