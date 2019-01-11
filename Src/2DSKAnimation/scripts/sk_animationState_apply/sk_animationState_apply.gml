__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc applies the animations
/// @param animationState
/// @param alpha
/// @param events
var sk_animationQueue = argument0[sk_data_animationState.animationQueue];
var sk_time = argument0[sk_data_animationState.timerTime];
var sk_timeLast = argument0[sk_data_animationState.timerTimeLast];
var sk_queue_length = ds_list_size(sk_animationQueue);
for(var sk_queueItem_id = 0; sk_queueItem_id < sk_queue_length; sk_queueItem_id++){
	var sk_queueItem = sk_animationQueue[| sk_queueItem_id];
	var sk_queueItem_anim = sk_queueItem[0];
	var sk_timeOffset = sk_queueItem[3];
	sk_animation_apply(
		sk_queueItem_anim,
		sk_timeLast-sk_timeOffset,
		sk_time-sk_timeOffset,
		SK_MIX_ADD,
		sk_queueItem[2]*argument1,
		sk_queueItem[1],
		argument2
	);
}