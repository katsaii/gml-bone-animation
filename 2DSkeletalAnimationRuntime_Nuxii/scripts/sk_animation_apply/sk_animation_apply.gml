/// @desc sets the pose for the specified time
/// @param animation
/// @param timeLast - this is required for events
/// @param time
/// @param mixPose
/// @param alpha
var sk_alpha = argument4;
if(sk_alpha<0.001){ // zero effect
	return;
}
var sk_anim_duration = argument0[SK_ANIMATION.duration];
var sk_anim_timelines = argument0[SK_ANIMATION.timelines];
var sk_timeLast = argument1;
var sk_time = argument2;
if(sk_anim_duration>0){
	sk_timeLast = sk_timeLast mod sk_anim_duration;
	sk_time = sk_time mod sk_anim_duration;
}
var sk_loop = argument0[SK_ANIMATION.looping] ? sk_anim_duration : -1;
var sk_mixPose = argument3;
// iterate through timelines
var sk_timeline_count = ds_list_size(sk_anim_timelines);
var sk_timeline_id;
for(sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
	var sk_timelineData = sk_anim_timelines[| sk_timeline_id];
	switch(sk_struct_get_type(sk_timelineData)){
		case sk_type_timeline_translate:	sk_timeline_translate_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_scale:		sk_timeline_scale_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_shear:		sk_timeline_shear_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_rotate:		sk_timeline_rotate_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_colour:		sk_timeline_colour_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_display:		sk_timeline_display_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha); break;
		case sk_type_timeline_parent:		sk_timeline_parent_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha); break;
		case sk_type_timeline_event:		sk_timeline_event_apply(sk_timelineData,sk_timeLast,sk_time,sk_alpha); break;
		case sk_type_timeline_ik:			sk_timeline_ik_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_transform:	sk_timeline_transform_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha,sk_loop); break;
		case sk_type_timeline_hierarchy:	sk_timeline_hierarchy_apply(sk_timelineData,sk_time,sk_mixPose,sk_alpha); break;
		case sk_type_timeline_order:		sk_timeline_order_apply(sk_timelineData,sk_time,sk_alpha); break;
	}
}