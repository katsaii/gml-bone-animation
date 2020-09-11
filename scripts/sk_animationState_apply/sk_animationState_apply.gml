__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc applies the animations
/// @param animationState
/// @param alpha
/// @param events
var sk_queue = argument0[sk_data_animationState.animationQueue];
var sk_time = argument0[sk_data_animationState.timerTime];
var sk_timeLast = argument0[sk_data_animationState.timerTimeLast];
var sk_queue_last = ds_list_size(sk_queue)-2;
for(var sk_queue_id = 0; sk_queue_id<=sk_queue_last; sk_queue_id+=2){
	var sk_tuple = sk_queue[| sk_queue_id+1];
	var sk_animation = sk_tuple[0];
	if(sk_animation!=undefined){
		var sk_duration = sk_tuple[1];
		var sk_timeOffset = sk_tuple[3];
		var sk_t1 = sk_timeLast-sk_timeOffset;
		var sk_t2 = sk_time-sk_timeOffset;
		sk_animation_apply(
			sk_animation,
			sk_t1,
			sk_t2,
			SK_MIX_ADD,
			sk_tuple[2]*argument1,
			(sk_duration==-1)||(sk_t1<=sk_duration),
			argument2
		);
	}
}