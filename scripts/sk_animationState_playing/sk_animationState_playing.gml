__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc returns whether a supplied animation is playing in the queue
/// @param state
/// @param anim
var sk_queue = argument0[sk_data_animationState.animationQueue];
var sk_anim_id = ds_list_find_index(sk_queue,argument1);
if(sk_anim_id==-1) then return false;
var sk_anim_tuple = sk_queue[| sk_anim_id+1];
var sk_duration = sk_anim_tuple[1];
return (sk_duration==-1)||((argument0[sk_data_animationState.timerTime]-sk_anim_tuple[3])<=sk_duration);