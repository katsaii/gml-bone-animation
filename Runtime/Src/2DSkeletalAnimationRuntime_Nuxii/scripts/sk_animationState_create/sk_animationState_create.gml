#macro sk_type_animationState sk_animationState_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ANIMATIONSTATE{
	animations,timescale,
	mixTable,mixSpeedDefault,
	timerTime,timerTimeLast, // a global timer which can be used to syncronise animations
	animationQueue,animationCurrent,animationMixSpeedCurrent, // the current rate to fade in the front animation and fade out the back animation
	sizeof,
		queueItem_anim = 0, // the reference of the animation
		queueItem_loop, // whether the animation loops
		queueItem_mix, // the alpha to apply the animation with
		queueItem_timerOffset, // the offset from the global timer (if 0 then the animation plays in sync with all others of the same duration)
		queueItem_ENTRIES
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
sk_struct[@ SK_ANIMATIONSTATE.animationQueue] = ds_list_create();
sk_struct[@ SK_ANIMATIONSTATE.timerTime] = 0;
sk_struct[@ SK_ANIMATIONSTATE.timerTimeLast] = 0;
sk_animationState_play_animation(sk_struct,undefined,false);
// set default property values
sk_animationState_set_timescale(sk_struct,1);
sk_animationState_set_default_mix(sk_struct,1);
// return to caller
return sk_struct;