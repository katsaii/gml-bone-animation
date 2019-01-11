__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc pushes an animation to the animation queue
/// @param animationState
/// @param animationName
/// @param loop
var sk_animationName_previous = argument0[sk_data_animationState.animationCurrent];
if(sk_animationName_previous!=argument1){
	var sk_animationQueue = argument0[sk_data_animationState.animationQueue];
	var sk_queueItem = [
		ds_map_find_value(argument0[sk_data_animationState.animations],argument1),
		argument2,
		0, // mix starts at 0 and increments to 1
		argument2 ? 0 : argument0[sk_data_animationState.timerTime] // if not looping, then offset time so the animation begins at 0
	];
	ds_list_add(sk_animationQueue,sk_queueItem);
	// update mixspeed
	argument0[@ sk_data_animationState.animationMixSpeedCurrent] = sk_animationState_get_mix(argument0,sk_animationName_previous,argument1);
	argument0[@ sk_data_animationState.animationCurrent] = argument1;
}