#macro SK_TYPE_ANIMATION_STATE "animationState"
enum sk_data_animationState{
	animations,
	mixTable,defaultMixSpeed,
	timerTimescale,
	timerTime, // a global timer which can be used to syncronise animations
	timerTimeLast,
	animationQueue,
	animationCurrent,
	animationMixSpeedCurrent // the current rate to fade in the front animation and fade out the back animation
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_animationState.animations] = ds_map_create(); // create structures for mixing animations
argument0[@ sk_data_animationState.mixTable] = ds_map_create();
argument0[@ sk_data_animationState.animationQueue] = ds_list_create();
argument0[@ sk_data_animationState.timerTimeLast] = -1;
sk_animationState_set_timescale(argument0,1);
sk_animationState_set_defaultMix(argument0,1);
sk_animationState_play(argument0,undefined,false);