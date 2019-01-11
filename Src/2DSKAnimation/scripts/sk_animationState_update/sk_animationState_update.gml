__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc updates the animation state
/// @param animationState
/// @param timestep
var sk_queue = argument0[sk_data_animationState.animationQueue];
var sk_dt = argument1*argument0[sk_data_animationState.timerTimescale];
argument0[@ sk_data_animationState.timerTimeLast] = argument0[sk_data_animationState.timerTime];
argument0[@ sk_data_animationState.timerTime] += sk_dt;
var sk_mix_difference = sk_dt*argument0[sk_data_animationState.animationMixSpeedCurrent];
var sk_queue_length = ds_list_size(sk_queue) div 2;
if(sk_queue_length>1){
	// update top mix
	var sk_anim_tuple_top = sk_queue[| 2*(sk_queue_length-1)+1];
	sk_anim_tuple_top[@ 2] += sk_mix_difference;
	// update previous animations
	repeat(sk_queue_length-1){
		var sk_anim_tuple_bottom = sk_queue[| 2*0+1];
		var sk_mix = sk_anim_tuple_bottom[2]-sk_mix_difference;
		sk_anim_tuple_bottom[@ 2] = sk_mix;
		if(sk_mix>0){
			// animation has not been fully faded out
			return;
		}
		if(sk_mix_difference<0) then sk_mix_difference = -sk_mix_difference;
		// dequeue the animation, since it has been fully dequeued, and carry remaining mix to next animation until queue is empty
		ds_list_delete(sk_queue,0); // dequeue name
		ds_list_delete(sk_queue,0); // dequeue tuple
	}
	// clamp final animation to 1
	sk_anim_tuple_top[@ 2] = 1;
}