__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc updates the animation state
/// @param animationState
/// @param timestep
var sk_animationQueue = argument0[sk_data_animationState.animationQueue];
var sk_dt = argument1*argument0[sk_data_animationState.timerTimescale];
argument0[@ sk_data_animationState.timerTimeLast] = argument0[sk_data_animationState.timerTime];
argument0[@ sk_data_animationState.timerTime] += sk_dt;
var sk_mix_difference = sk_dt*argument0[sk_data_animationState.animationMixSpeedCurrent];
var sk_queue_length = ds_list_size(sk_animationQueue);
if(sk_queue_length>1){
	// update top mix
	var sk_queueItem_top = sk_animationQueue[| sk_queue_length-1];
	sk_queueItem_top[@ 2] += sk_mix_difference;
	// update previous animations
	repeat(sk_queue_length-1){
		var sk_queueItem_bottom = sk_animationQueue[| 0];
		var sk_queueItem_mix = sk_queueItem_bottom[2] - sk_mix_difference;
		sk_queueItem_bottom[@ 2] = sk_queueItem_mix;
		if(sk_queueItem_mix>0){
			// animation has not been fully faded out
			return;
		}
		// dequeue the animation, since it has been fully dequeued, and carry remaining mix to next animation until queue is empty
		ds_list_delete(sk_animationQueue,0);
		sk_mix_difference = abs(sk_mix_difference);
	}
	// clamp final animation to 1
	sk_queueItem_top[@ 2] = 1;
}