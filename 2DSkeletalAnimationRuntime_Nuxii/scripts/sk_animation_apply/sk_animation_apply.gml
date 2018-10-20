/// @desc sets the pose for the specified time
/// @param animation
/// @param timeLast - this is required for events
/// @param time
/// @param mixPose
/// @param alpha
/// @param wrap
var sk_alpha = argument4;
if(sk_alpha<0.001){ // zero effect
	return;
}
var sk_anim = argument0;
var sk_anim_duration = sk_anim[SK_ANIMATION.duration];
var sk_anim_timelines = sk_anim[SK_ANIMATION.timelines];
var sk_anim_loopTime = sk_anim[SK_ANIMATION.looping] ? sk_anim_duration : -1;
var sk_timeLast = argument1;
var sk_time = argument2;
if(sk_anim_duration>0){
	var sk_wrap = argument5;
	if(sk_wrap){
		sk_timeLast = sk_timeLast mod sk_anim_duration;
		sk_time = sk_time mod sk_anim_duration;
	} else {
		sk_timeLast = sk_anim_duration;
		sk_time = sk_anim_duration;
	}
}
var sk_mixPose = argument3;
// iterate through timelines
var sk_timeline_count = ds_list_size(sk_anim_timelines);
for(var sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
	sk_timeline_apply(sk_anim_timelines[| sk_timeline_id],sk_time,sk_timeLast,sk_mixPose,sk_alpha,sk_anim_loopTime);
}