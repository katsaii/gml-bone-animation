#macro sk_type_animationState "ofAnimationState"
enum SK_ANIMATIONSTATE{
	animations,playbackRate,
	mixTable,mixSpeedDefault,mixAlpha,
	animation_previous,animation_previous_loop,animation_previous_time,animation_previous_timeLast,
	animation_current,animation_current_loop,animation_current_time,animation_current_timeLast,
	animation_next,animation_next_loop,animation_next_time,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_animationState,SK_ANIMATIONSTATE.sizeof,sk_construct_animationState,sk_destruct_animationState);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_animationState,argument0);
sk_animationState_playback_speed(sk_structure,1);
sk_animationState_mix_default(sk_structure,1);
return sk_structure;