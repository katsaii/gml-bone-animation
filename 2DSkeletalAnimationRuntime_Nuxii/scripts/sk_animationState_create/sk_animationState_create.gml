#macro sk_type_animationState sk_animationState_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ANIMATIONSTATE{
	animations,playbackRate,
	mixTable,mixSpeedDefault,mixAlpha,
	animation_previous,animation_previous_loop,animation_previous_time,animation_previous_timeLast,
	animation_current,animation_current_loop,animation_current_time,animation_current_timeLast,
	animation_next,animation_next_loop,animation_next_time,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ANIMATIONSTATE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_animationState,argument0,
	-1, // setup script
	-1, // apply script
	"sk_animationState_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ANIMATIONSTATE.animations] = ds_map_create(); // create structures for mixing animations
sk_struct[@ SK_ANIMATIONSTATE.mixTable] = ds_map_create();
// set default property values
sk_animationState_set_playback_speed(sk_struct,1);
sk_animationState_set_default_mix(sk_struct,1);
// return to caller
return sk_struct;