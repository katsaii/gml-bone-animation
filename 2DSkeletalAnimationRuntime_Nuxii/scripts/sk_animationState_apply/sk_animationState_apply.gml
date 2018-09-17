/// @desc applies the animations
/// @param animationState
/// @param alpha
var sk_animationQueue = argument0[SK_ANIMATIONSTATE.animationQueue];
var sk_time = argument0[SK_ANIMATIONSTATE.timerTime];
var sk_timeLast = argument0[SK_ANIMATIONSTATE.timerTimeLast];
var sk_queue_length = ds_list_size(sk_animationQueue);
for(var sk_queueItem_id = 0; sk_queueItem_id < sk_queue_length; sk_queueItem_id++){
	var sk_queueItem = sk_animationQueue[| sk_queueItem_id];
	var sk_queueItem_anim = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_anim];
	var sk_queueItem_looping = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_loop];
	var sk_queueItem_mix = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_mix]*argument1;
	var sk_queueItem_timeOffset = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_timerOffset];
	if(sk_struct_isof(sk_queueItem_anim,sk_type_animation)){
		sk_animation_apply(
			sk_queueItem_anim,
			sk_timeLast-sk_queueItem_timeOffset,
			sk_time-sk_queueItem_timeOffset,
			sk_mixPose_add,
			sk_queueItem_mix,
			sk_queueItem_looping
		);
	}
}