__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc pushes an animation to the animation queue
/// @param state
/// @param anim
/// @param loopTimes
var sk_anim_previous = argument0[sk_data_animationState.animationCurrent];
var sk_queue = argument0[sk_data_animationState.animationQueue];
var sk_loops = (is_real(argument2)&&(argument2>=0)) ? argument2 : -1;
var sk_anim_id = ds_list_find_index(sk_queue,argument1);
var sk_anim_tuple;
if(sk_anim_id==-1){
	// build new animation tuple
	var sk_animation = ds_map_find_value(argument0[sk_data_animationState.animations],argument1);
	if(sk_animation==undefined) then return;
	sk_anim_tuple = [
		// [animation, remainingLoops, mix, timeOffset]
		sk_animation,
		(sk_loops==-1) ? -1: (sk_loops*sk_animation_get_duration(sk_animation)),
		0,
		(sk_loops==-1) ? 0 : argument0[sk_data_animationState.timerTime]
	];
}else{
	// use existing animation tuple
	var sk_anim_tuple = sk_queue[| sk_anim_id+1];
	ds_list_delete(sk_queue,sk_anim_id); // delete name
	ds_list_delete(sk_queue,sk_anim_id); // delete previous tuple
	if(sk_loops!=-1){
		var sk_duration = sk_animation_get_duration(sk_anim_tuple[0]);
		var sk_currentTime = argument0[sk_data_animationState.timerTime]-sk_anim_tuple[3];
		sk_anim_tuple[@ 1] = (round(sk_currentTime/sk_duration)+sk_loops)*sk_duration; // preserve loops
	}
}
ds_list_add(
	sk_queue,
	argument1,
	sk_anim_tuple
);
argument0[@ sk_data_animationState.animationMixSpeedCurrent] = sk_animationState_get_mix(argument0,sk_anim_previous,argument1);
argument0[@ sk_data_animationState.animationCurrent] = argument1;