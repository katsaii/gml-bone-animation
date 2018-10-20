/// @desc pushes an animation to the animation queue
/// @param animationState
/// @param animationName
/// @param loop
var sk_animationName_previous = argument0[SK_ANIMATIONSTATE.animationCurrent];
if(sk_animationName_previous!=argument1){
	var sk_animationQueue = argument0[SK_ANIMATIONSTATE.animationQueue];
	var sk_queueItem = array_create(SK_ANIMATIONSTATE.queueItem_ENTRIES);
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_anim] = ds_map_find_value(argument0[SK_ANIMATIONSTATE.animations],argument1);
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_loop] = argument2;
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_mix] = ds_list_empty(sk_animationQueue); // mix starts at 0 and increments to 1
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_timerOffset] = argument2 ? 0 : argument0[SK_ANIMATIONSTATE.timerTime]; // if not looping, then offset time so the animation begins at 0
	ds_list_add(sk_animationQueue,sk_queueItem);
	// update mixspeed
	argument0[@ SK_ANIMATIONSTATE.animationMixSpeedCurrent] = sk_animationState_get_animation_mix(argument0,sk_animationName_previous,argument1);
	argument0[@ SK_ANIMATIONSTATE.animationCurrent] = argument1;
}