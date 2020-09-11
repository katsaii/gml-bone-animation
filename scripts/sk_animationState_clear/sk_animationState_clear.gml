__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc clears all previous animations and pushes an optional animation to the queue
/// @param state
/// @param anim
/// @param loopTimes
var sk_queue = argument0[sk_data_animationState.animationQueue];
var sk_loops = (is_real(argument2)&&(argument2>=0)) ? (argument2+1) : -1;
ds_list_clear(sk_queue);
var sk_animation = ds_map_find_value(argument0[sk_data_animationState.animations],argument1);
if(sk_animation!=undefined){
	ds_list_add(
		sk_queue,
		argument1,
		[	// [animation, remainingLoops, mix, timeOffset]
			sk_animation,
			(sk_loops==-1) ? -1: (sk_loops*sk_animation_get_duration(sk_animation)),
			1,
			(sk_loops==-1) ? 0 : argument0[sk_data_animationState.timerTime]
		]
	);
}
argument0[@ sk_data_animationState.animationMixSpeedCurrent] = 1;
argument0[@ sk_data_animationState.animationCurrent] = argument1;