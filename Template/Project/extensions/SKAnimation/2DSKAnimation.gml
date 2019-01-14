THIS FILE WAS AUTOMATICALLY GENERATED

#define ds_list_find_index_sk_animation
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_animation_exists(sk_item)&&(sk_animation_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_bone
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_bone_exists(sk_item)&&(sk_bone_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_event
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_event_exists(sk_item)&&(sk_event_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_ik_constraint
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_ik_constraint_exists(sk_item)&&(sk_ik_constraint_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_physics_constraint
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_physics_constraint_exists(sk_item)&&(sk_physics_constraint_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_plane_attachment
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_plane_attachment_exists(sk_item)&&(sk_plane_attachment_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_point_attachment
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_point_attachment_exists(sk_item)&&(sk_point_attachment_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_skin
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_skin_exists(sk_item)&&(sk_skin_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_slot
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_slot_exists(sk_item)&&(sk_slot_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define ds_list_find_index_sk_transformation_constraint
/// @desc find skeleton object index
/// @param id
/// @param name
var sk_item_count = ds_list_size(argument0);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument0[| sk_item_id];
	if(sk_transformation_constraint_exists(sk_item)&&(sk_transformation_constraint_get_name(sk_item)==argument1)){
		return sk_item_id;
	}
}
return -1;

#define sk_animationState_apply
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

#define sk_animationState_clear
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc clears all previous animations and pushes an optional animation to the queue
/// @param state
/// @param anim
/// @param loopTimes
var sk_queue = argument0[sk_data_animationState.animationQueue];
var sk_loops = (is_real(argument2)&&(argument2>=0)) ? (argument2+1) : -1;
ds_list_clear(sk_queue);
var sk_animation = ds_map_find_value(argument0[sk_data_animationState.animations],argument1);
if(sk_animation!=undefined){
	ds_list_add(
		sk_queue,
		argument1,
		[	// [animation, remainingLoops, mix, timeOffset]
			sk_animation,
			(sk_loops==-1) ? -1: (sk_loops*sk_animation_get_duration(sk_animation)),
			1,
			(sk_loops==-1) ? 0 : argument0[sk_data_animationState.timerTime]
		]
	);
}
argument0[@ sk_data_animationState.animationMixSpeedCurrent] = 1;
argument0[@ sk_data_animationState.animationCurrent] = argument1;

#define sk_animationState_create
/// @desc create
/// @param [armature]
var sk_obj = sk_object_create(SK_TYPE_ANIMATION_STATE);
if(argument_count>0) then sk_animationState_set_animations_armature(sk_obj,argument[0]);
return sk_obj;

#define sk_animationState_current_animation
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc returns a property
/// @param state
return argument0[sk_data_animationState.animationCurrent];

#define sk_animationState_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc destroys
/// @param state
sk_object_destroy(argument0);

#define sk_animationState_exists
/// @desc exists
/// @param state
return(sk_object_exists(argument0,SK_TYPE_ANIMATION_STATE));

#define sk_animationState_get_animations
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc returns a property
/// @param state
/// @param id
var sk_animationMap = argument0[sk_data_animationState.animations];
ds_list_clear(argument1);
var sk_key = ds_map_find_first(sk_animationMap);
repeat(ds_map_size(sk_animationMap)){
	ds_list_add(argument1,sk_animationMap[? sk_key]);
	// next
	sk_key = ds_map_find_next(sk_animationMap,sk_key);
}

#define sk_animationState_get_mix
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc returns a property
/// @param state
/// @param anim_from
/// @param anim_to
var sk_mix = ds_map_find_value(argument0[sk_data_animationState.mixTable],string(argument1)+"->"+string(argument2));
if(is_real(sk_mix)){
	return sk_mix;
}	return argument0[sk_data_animationState.defaultMixSpeed];

#define sk_animationState_play
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

#define sk_animationState_playing
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

#define sk_animationState_set_animations
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc sets a property
/// @param state
/// @param id
var sk_animationMap = argument0[sk_data_animationState.animations];
ds_map_clear(sk_animationMap);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_animation_exists(sk_item)){
		sk_animationMap[? sk_animation_get_name(sk_item)] = sk_item;
	}
}

#define sk_animationState_set_animations_armature
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc sets a property
/// @param state
/// @param armature
var sk_animations = ds_list_create();
if(sk_armature_exists(argument1)) then sk_armature_get_animations(argument1,sk_animations);
sk_animationState_set_animations(argument0,sk_animations);
ds_list_destroy(sk_animations);

#define sk_animationState_set_defaultMix
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc sets a property
/// @param state
/// @param amount
argument0[@ sk_data_animationState.defaultMixSpeed] = max(real(argument1),0);

#define sk_animationState_set_mix
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc sets a property
/// @param state
/// @param anim_from
/// @param anim_to
/// @param amount
ds_map_add(argument0[sk_data_animationState.mixTable],string(argument1)+"->"+string(argument2),max(real(argument3),0));

#define sk_animationState_set_timescale
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc sets a property
/// @param state
/// @param amount
argument0[@ sk_data_animationState.timerTimescale] = max(real(argument1),0);

#define sk_animationState_update
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

#define sk_animation_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc applies the animation by searching the mainline
/// @param animation
/// @param timeLast
/// @param time
/// @param mixPose
/// @param alpha
/// @param wrap
/// @param events
if(argument4<0.001) then return;
// wrap times
var sk_duration = argument0[sk_data_animation.duration];
var sk_timeLast = argument1;
var sk_time = argument2;
if(sk_duration>0){
	if(argument5){
		sk_timeLast = ((sk_timeLast%sk_duration)+sk_duration)%sk_duration;
		sk_time = ((sk_time%sk_duration)+sk_duration)%sk_duration;
	}else{
		if(sk_timeLast>sk_duration) then sk_timeLast = sk_duration;
		if(sk_time>sk_duration) then sk_time = sk_duration;
	}
}
// iterate through mainline
var sk_mainline = argument0[sk_data_animation.mainline];
var sk_mainline_size = ds_list_size(sk_mainline);
if(sk_mainline_size<SK_ANIMATION_MAINLINE_ENTRIES) then return; // empty
var sk_mainline_keyframe_id = 0;
var sk_mainline_keyframe_last_id = sk_mainline_keyframe_id;
if(sk_mainline_size>SK_ANIMATION_MAINLINE_ENTRIES){
	// search for mainline keyframe using sk_time + binary search
	sk_mainline_keyframe_id = __sk_search_binary(sk_mainline,sk_time,SK_ANIMATION_MAINLINE_ENTRIES,0,sk_mainline_size-1);
	sk_mainline_keyframe_last_id = (sk_timeLast==sk_time) ? (
		sk_mainline_keyframe_id
	): (
		__sk_search_binary(sk_mainline,sk_timeLast,SK_ANIMATION_MAINLINE_ENTRIES,0,sk_mainline_size-1)
	);
}
var sk_mainline_timelines = sk_mainline[| sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIMELINES];
var sk_mainline_timelines_last = sk_mainline[| sk_mainline_keyframe_last_id+SK_ANIMATION_MAINLINE_TIMELINES];
var sk_mainline_timeline_count = ds_list_size(sk_mainline_timelines);
for(var sk_mainline_timeline_id = 0; sk_mainline_timeline_id<=(sk_mainline_timeline_count-5); sk_mainline_timeline_id+=5){
	var sk_mainline_timeline = sk_mainline_timelines[| sk_mainline_timeline_id+0];
	var sk_mainline_keyframeA = sk_mainline_timelines[| sk_mainline_timeline_id+1];
	var sk_mainline_keyframeB = sk_mainline_timelines[| sk_mainline_timeline_id+2];
	var sk_mainline_keyframePrevious = sk_mainline_keyframeA;
	if(sk_mainline_timelines!=sk_mainline_timelines_last){
		var sk_mainline_timeline_last_id = ds_list_find_index(sk_mainline_timelines_last,sk_mainline_timeline);
		sk_mainline_keyframePrevious = (sk_mainline_timeline_last_id!=-1) ? sk_mainline_timelines_last[| sk_mainline_timeline_last_id+1] : -1;
	}
	var sk_mainline_timeA = sk_mainline_timelines[| sk_mainline_timeline_id+3];
	var sk_mainline_timeB = sk_mainline_timelines[| sk_mainline_timeline_id+4];
	var sk_interpolation = (sk_mainline_timeA==sk_mainline_timeB) ? 0 : clamp((sk_time-sk_mainline_timeA)/(sk_mainline_timeB-sk_mainline_timeA),0,1);
	sk_timeline_apply(sk_mainline_timeline,sk_mainline_keyframePrevious,sk_mainline_keyframeA,sk_mainline_keyframeB,sk_interpolation,argument3,argument4,argument6);
}

#define sk_animation_create
/// @desc create
/// @param name
/// @param [duration
/// @param loop]
var sk_obj = sk_object_create(SK_TYPE_ANIMATION);
sk_animation_set_name(sk_obj,argument[0]);
if(argument_count>2) then sk_animation_set_duration(sk_obj,argument[1],argument[2]);
return sk_obj;

#define sk_animation_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc destroy
/// @param animation
sk_object_destroy(argument0);

#define sk_animation_exists
/// @desc exists
/// @param animation
return sk_object_exists(argument0,SK_TYPE_ANIMATION);

#define sk_animation_get_duration
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param animation
return argument0[sk_data_animation.duration];

#define sk_animation_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param animation
return argument0[sk_data_animation.name];

#define sk_animation_get_timelines
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param animation
/// @param id
ds_list_copy(argument1,argument0[sk_data_animation.timelines]);

#define sk_animation_set_duration
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc sets a property
/// @param animation
/// @param duration
/// @param loop
argument0[@ sk_data_animation.duration] = max(0,real(argument1));
argument0[@ sk_data_animation.loop] = bool(argument2);

#define sk_animation_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc sets a property
/// @param animation
/// @param name
argument0[@ sk_data_animation.name] = string(argument1);

#define sk_animation_set_timelines
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc sets a property
/// @param animation
/// @param id
var sk_timelines = argument0[sk_data_animation.timelines];
ds_list_clear(sk_timelines);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_timeline_exists(sk_item)) then ds_list_add(sk_timelines,sk_item);
}
sk_animation_update_mainline(argument0);

#define sk_animation_update_mainline
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc updates the mainline by iterating through the timeline data
/// @param animation
var sk_looping = argument0[sk_data_animation.loop];
var sk_duration = argument0[sk_data_animation.duration];
var sk_mainline = argument0[sk_data_animation.mainline];
var sk_timelines = argument0[sk_data_animation.timelines];
var sk_timeline_count = ds_list_size(sk_timelines);
ds_list_clear(sk_mainline);
// compile all available times between timelines
var sk_available_times = ds_list_create();
ds_list_add(sk_available_times,0); // default time is zero
for(var sk_timeline_id = 0; sk_timeline_id<sk_timeline_count; sk_timeline_id++){
	var sk_timeline = sk_timelines[| sk_timeline_id];
	var sk_timeline_times = ds_list_create();
	sk_timeline_get_times(sk_timeline,sk_timeline_times);
	var sk_timeline_time_count = ds_list_size(sk_timeline_times);
	for(var sk_timeline_time_id = 0; sk_timeline_time_id<sk_timeline_time_count; sk_timeline_time_id++){
		var sk_timeline_time = sk_timeline_times[| sk_timeline_time_id];
		if(ds_list_find_index(sk_available_times,sk_timeline_time)==-1) then ds_list_add(sk_available_times,sk_timeline_time);
	}
	// dispose of dynamic structures
	ds_list_destroy(sk_timeline_times);
}
ds_list_sort(sk_available_times,true);
var sk_mainline_time_count = ds_list_size(sk_available_times);
for(var sk_mainline_time_id = 0; sk_mainline_time_id<sk_mainline_time_count; sk_mainline_time_id++){
	var sk_mainline_keyframe_id = ds_list_size(sk_mainline);
	sk_mainline[| sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIME] = sk_available_times[| sk_mainline_time_id];
	sk_mainline[| sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIMELINES] = ds_list_create();
	ds_list_mark_as_list(sk_mainline,sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIMELINES);
}
ds_list_destroy(sk_available_times);
// re-iterate through the timelines, and build each record of the mainline lists
for(var sk_timeline_id = 0; sk_timeline_id<sk_timeline_count; sk_timeline_id++){
	var sk_timeline = sk_timelines[| sk_timeline_id];
	var sk_timeline_records = ds_map_create();
	var sk_timeline_times = ds_list_create();
	sk_timeline_get_times(sk_timeline,sk_timeline_times);
	var sk_timeline_time_count = ds_list_size(sk_timeline_times);
	if(sk_timeline_time_count>0){
		// compile timeline records
		for(var sk_timeline_time_id = 0; sk_timeline_time_id<sk_timeline_time_count; sk_timeline_time_id++){
			var sk_timeline_time = sk_timeline_times[| sk_timeline_time_id];
			var sk_timeline_time_next_id = sk_timeline_time_id+1;
			var sk_timeline_time_next;
			if(sk_timeline_time_next_id>=sk_timeline_time_count){
				sk_timeline_time_next = sk_duration;
				// last record
				if(sk_looping){
					sk_timeline_time_next += sk_timeline_times[| 0];
					sk_timeline_time_next_id = 0;
				}else{
					sk_timeline_time_next_id = sk_timeline_time_id;
				}
			}else{
				sk_timeline_time_next = sk_timeline_times[| sk_timeline_time_next_id];
			}
			sk_timeline_records[? sk_timeline_time] = [
				sk_timeline_time_id,
				sk_timeline_time_next_id,
				sk_timeline_time,
				sk_timeline_time_next
			];
		}
		// add information to mainline
		var sk_last_record = undefined;
		var sk_mainline_keyframe_last = ds_list_size(sk_mainline)-SK_ANIMATION_MAINLINE_ENTRIES;
		for(var sk_mainline_keyframe_id = 0; sk_mainline_keyframe_id<=sk_mainline_keyframe_last; sk_mainline_keyframe_id+=SK_ANIMATION_MAINLINE_ENTRIES){
			var sk_mainline_keyframe_time = sk_mainline[| sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIME];
			var sk_mainline_keyframe_timelines = sk_mainline[| sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIMELINES];
			var sk_mainline_record = sk_timeline_records[? sk_mainline_keyframe_time];
			if(sk_mainline_record==undefined){
				sk_mainline_record = sk_last_record;
				if(sk_mainline_record==undefined){
					// either loop the animation or ignore this keyframe
					if(!sk_looping) then continue else{
						var sk_first_keyframe_id = 0;
						var sk_final_keyframe_id = ds_list_size(sk_timeline_times)-1;
						var sk_final_time = sk_timeline_times[| sk_final_keyframe_id];
						var sk_first_time = sk_timeline_times[| sk_first_keyframe_id];
						sk_mainline_record = [
							sk_final_keyframe_id,
							sk_first_keyframe_id,
							-(sk_duration-sk_final_time),
							sk_first_time
						];
					}
				}
			}
			var sk_mainline_keyframe_timeline_id = ds_list_size(sk_mainline_keyframe_timelines);
			sk_mainline_keyframe_timelines[| sk_mainline_keyframe_timeline_id+0] = sk_timeline;
			sk_mainline_keyframe_timelines[| sk_mainline_keyframe_timeline_id+1] = sk_mainline_record[0];
			sk_mainline_keyframe_timelines[| sk_mainline_keyframe_timeline_id+2] = sk_mainline_record[1];
			sk_mainline_keyframe_timelines[| sk_mainline_keyframe_timeline_id+3] = sk_mainline_record[2];
			sk_mainline_keyframe_timelines[| sk_mainline_keyframe_timeline_id+4] = sk_mainline_record[3];
			sk_last_record = sk_mainline_record;
		}
	}
	// dispose of dynamic structures
	ds_map_destroy(sk_timeline_records);
	ds_list_destroy(sk_timeline_times);
}

#define sk_armature_create
/// @desc create
var sk_obj = sk_object_create(SK_TYPE_ARMATURE);
return sk_obj;

#define sk_armature_create_dragonbones
/// @desc loads an armature file
/// @param filepath
/// @param armature_name_or_id
return sk_armature_create_dragonbones_context(__sk_file_read_all(argument0),argument1);

#define sk_armature_create_dragonbones_context
/// @desc loads an armature file
/// @param json
/// @param armature_name_or_id
var sk_db_armature = undefined;
// extract armature data from dragonbones json
var sk_db_arm = json_decode(argument0);
if(sk_db_arm==-1) then return undefined;
var sk_db_armatures = sk_db_arm[? "armature"];
if(is_real(sk_db_armatures)&&ds_exists(sk_db_armatures,ds_type_list)){
	var sk_db_armature_count = ds_list_size(sk_db_armatures);
    for(var sk_db_armature_id = 0; sk_db_armature_id < sk_db_armature_count; sk_db_armature_id++){
        var sk_db_armature_data = sk_db_armatures[| sk_db_armature_id];
        if(
			is_real(sk_db_armature_data)&&ds_exists(sk_db_armature_data,ds_type_map)&&
			(sk_db_armature_data[? "type"]=="Armature")&&((sk_db_armature_data[? "name"]==argument1)||(sk_db_armature_id==argument1))
		){
    		// armature found
			sk_db_armature = sk_db_armature_data;
			break;
    	}
    }
}
if(sk_db_armature==undefined){
	ds_map_destroy(sk_db_arm);
	return undefined;
}
// extract important data
var sk_db_bones = sk_db_armature[? "bone"];
var sk_db_slots = sk_db_armature[? "slot"];
var sk_db_skins = sk_db_armature[? "skin"];
var sk_db_IK = sk_db_armature[? "ik"];
var sk_db_animations = sk_db_armature[? "animation"];
var sk_db_fps = 1; //30/max(real(sk_db_armature[? "frameRate"]),1); // 30 fps baseline /* THIS WAS AN EXPERIMENTAL FEATURE FOR MAPPING THE FRAMERATE OF ANIMATIONS TO GAMESPEED*/
// create armature
var sk_arm = sk_armature_create();
// create containers
var sk_bones = ds_list_create();
var sk_constraints = ds_list_create();
var sk_slots = ds_list_create();
var sk_animations = ds_list_create();
var sk_skins = ds_list_create();
var sk_attachments = ds_list_create();
var sk_events = ds_list_create();
// transfer bone data
if(is_real(sk_db_bones)&&ds_exists(sk_db_bones,ds_type_list)){
	var sk_db_bone_count = ds_list_size(sk_db_bones);
	for(var sk_db_bone_id = 0; sk_db_bone_id < sk_db_bone_count; sk_db_bone_id++){
	    var sk_db_bone_record = sk_db_bones[| sk_db_bone_id];
	    if(is_real(sk_db_bone_record)&&ds_exists(sk_db_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(sk_db_bone_record[? "name"]);
	        var sk_bone_len = real(sk_db_bone_record[? "length"]);
	        var sk_bone_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_bone_record[? "parent"])];
			var sk_bone_xpos = 0;
	        var sk_bone_ypos = 0;
	        var sk_bone_xsc = 1;
	        var sk_bone_ysc = 1;
	        var sk_bone_xsh = 0;
			var sk_bone_ysh = 0;
	        var sk_bone_inherit_rotation = !is_real(sk_db_bone_record[? "inheritRotation"])||sk_db_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(sk_db_bone_record[? "inheritScale"])||sk_db_bone_record[? "inheritScale"];
			var sk_bone_inheritance = real(
				(SK_TRANSFORM_MODE_ROTATE*sk_bone_inherit_rotation)|
				(SK_TRANSFORM_MODE_SCALE*sk_bone_inherit_scale)|
				SK_TRANSFORM_MODE_TRANSLATE|
				SK_TRANSFORM_MODE_SKEW
			);
	        // obtain transformation data
	        var sk_db_bone_transformations = sk_db_bone_record[? "transform"];
	        if(is_real(sk_db_bone_transformations)&&ds_exists(sk_db_bone_transformations,ds_type_map)){
				sk_bone_xpos = real(sk_db_bone_transformations[? "x"]);
				sk_bone_ypos = real(sk_db_bone_transformations[? "y"]);
				sk_bone_xsc = is_real(sk_db_bone_transformations[? "scX"]) ? sk_db_bone_transformations[? "scX"] : 1;
				sk_bone_ysc = is_real(sk_db_bone_transformations[? "scY"]) ? sk_db_bone_transformations[? "scY"] : 1;
				sk_bone_xsh = -real(sk_db_bone_transformations[? "skX"]);
				sk_bone_ysh = -real(sk_db_bone_transformations[? "skY"]);
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name,sk_bone_par,sk_bone_len);
			sk_bone_set_pose(
				sk_bone,
				sk_bone_xpos,sk_bone_ypos,
				sk_bone_xsc,sk_bone_ysc,
				sk_bone_xsh,sk_bone_ysh,
				0,
				sk_bone_inheritance
			);
			ds_list_add(sk_bones,sk_bone);
			#endregion
	    }
	}
}
// transfer slot data
if(is_real(sk_db_slots)&&ds_exists(sk_db_slots,ds_type_list)){
	var sk_db_slot_count = ds_list_size(sk_db_slots);
	for(var sk_db_slot_id = 0; sk_db_slot_id < sk_db_slot_count; sk_db_slot_id++){
	    var sk_db_slot_record = sk_db_slots[| sk_db_slot_id];
	    if(is_real(sk_db_slot_record)&&ds_exists(sk_db_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(sk_db_slot_record[? "name"]);
   			var sk_slot_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_slot_record[? "parent"])];
			var sk_slot_displayIndex = string(real(sk_db_slot_record[? "displayIndex"]));
			var sk_slot_col = $ffffff;
	        var sk_slot_a = 1;
	        // obtain colour data
	        var sk_db_slot_colourData = sk_db_slot_record[? "color"];
	        if(is_real(sk_db_slot_colourData)&&ds_exists(sk_db_slot_colourData,ds_type_map)){
	            var sk_rgba_r = sk_db_slot_colourData[? "rM"];
	            var sk_rgba_g = sk_db_slot_colourData[? "gM"];
	            var sk_rgba_b = sk_db_slot_colourData[? "bM"];
	            var sk_rgba_a = sk_db_slot_colourData[? "aM"];
	            sk_slot_col = make_colour_rgb(
					is_real(sk_rgba_r) ? sk_rgba_r : 255,
					is_real(sk_rgba_g) ? sk_rgba_g : 255,
					is_real(sk_rgba_b) ? sk_rgba_b : 255
				);
	            sk_slot_a = is_real(sk_rgba_a) ? sk_rgba_a : 1;
	        }
			// create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name);
			sk_slot_set_pose(
				sk_slot,
				sk_slot_col,
				sk_slot_a,
				sk_slot_par,
				sk_slot_displayIndex
			);
			ds_list_add(sk_slots,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(sk_db_skins)&&ds_exists(sk_db_skins,ds_type_list)){
	var sk_db_skin_count = ds_list_size(sk_db_skins);
	for(var sk_db_skin_id = 0; sk_db_skin_id < sk_db_skin_count; sk_db_skin_id++){
	    var sk_db_skin_record = sk_db_skins[| sk_db_skin_id];
	    if(is_real(sk_db_skin_record)&&ds_exists(sk_db_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin_name = is_string(sk_db_skin_record[? "name"]) ? sk_db_skin_record[? "name"] : "";
			var sk_skin = sk_skin_create(sk_skin_name);
			ds_list_add(sk_skins,sk_skin);
			// compile slot attachment data
			var sk_db_skin_slots = sk_db_skin_record[? "slot"];
			if(is_real(sk_db_skin_slots)&&ds_exists(sk_db_skin_slots,ds_type_list)){
				// iterate through skin slots and add their display data
				var sk_db_skin_slot_count = ds_list_size(sk_db_skin_slots);
				for(var sk_db_skin_slot_id = 0; sk_db_skin_slot_id < sk_db_skin_slot_count; sk_db_skin_slot_id++){
				    var sk_db_skin_slot_record = sk_db_skin_slots[| sk_db_skin_slot_id];
				    if(is_real(sk_db_skin_slot_record)&&ds_exists(sk_db_skin_slot_record,ds_type_map)){
						var sk_skin_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_db_skin_slot_record[? "name"])];
						var sk_db_skin_slot_displays = sk_db_skin_slot_record[? "display"];
						if((sk_skin_slotData!=undefined)&&is_real(sk_db_skin_slot_displays)&&ds_exists(sk_db_skin_slot_displays,ds_type_list)){
							// iterate through slot displays and create attachments
							var sk_db_skin_slot_display_count = ds_list_size(sk_db_skin_slot_displays);
							for(var sk_db_skin_slot_display_id = 0; sk_db_skin_slot_display_id < sk_db_skin_slot_display_count; sk_db_skin_slot_display_id++){
							    var sk_db_skin_slot_display_record = sk_db_skin_slot_displays[| sk_db_skin_slot_display_id];
							    if(is_real(sk_db_skin_slot_display_record)&&ds_exists(sk_db_skin_slot_display_record,ds_type_map)){
									#region // add attachment to skin
									// attachment name is a combination of its parent slot and the path of the texture
									var sk_attachment_name = string(sk_slot_get_name(sk_skin_slotData))+"."+string(sk_db_skin_slot_display_record[? "name"]);
									switch(sk_db_skin_slot_display_record[? "type"]){
										case "mesh": case "point": break; // not supported
										case "image": default:
											// create plane attachment
											var sk_attachment_textureName = sk_db_skin_slot_display_record[? "name"];
											var sk_attachment_x = 0;
											var sk_attachment_y = 0;
											var sk_attachment_xscale = 1;
											var sk_attachment_yscale = 1;
											var sk_attachment_xshear = 0;
											var sk_attachment_yshear = 0;
											// compile transformation data
											var sk_db_attachment_transformations = sk_db_skin_slot_display_record[? "transform"];
											if(is_real(sk_db_attachment_transformations)&&ds_exists(sk_db_attachment_transformations,ds_type_map)){
						                        sk_attachment_x = real(sk_db_attachment_transformations[? "x"]);
						                        sk_attachment_y = real(sk_db_attachment_transformations[? "y"]);
						                        sk_attachment_xscale = is_real(sk_db_attachment_transformations[? "scX"]) ? sk_db_attachment_transformations[? "scX"] : 1;
						                        sk_attachment_yscale = is_real(sk_db_attachment_transformations[? "scY"]) ? sk_db_attachment_transformations[? "scY"] : 1;
						                        sk_attachment_xshear = -real(sk_db_attachment_transformations[? "skX"]);
												sk_attachment_yshear = -real(sk_db_attachment_transformations[? "skY"]);
						                    }
											// create a new attachment and add it to the skin
											var sk_attachment = sk_plane_attachment_create(sk_attachment_name);
											sk_plane_attachment_set_regionKey(sk_attachment,sk_attachment_textureName);
											sk_plane_attachment_set_matrix(
												sk_attachment,
												sk_attachment_x,sk_attachment_y,
												sk_attachment_xscale,sk_attachment_yscale,
												sk_attachment_xshear,sk_attachment_yshear,0
											);
											ds_list_add(sk_attachments,sk_attachment);
											sk_skin_record_add(
												sk_skin,
												sk_skin_slotData,
												sk_attachment,
												string(sk_db_skin_slot_display_id)
											);
										break;
									}
									#endregion
								}
							}
						}
					}
				}
			}
			#endregion
		}
	}
}
// transfer IKConstraint data 
if(is_real(sk_db_IK)&&ds_exists(sk_db_IK,ds_type_list)){
	var sk_db_IK_count = ds_list_size(sk_db_IK);
	for(var sk_db_IK_id = 0; sk_db_IK_id < sk_db_IK_count; sk_db_IK_id++){
	    var sk_db_IK_record = sk_db_IK[| sk_db_IK_id];
	    if(is_real(sk_db_IK_record)&&ds_exists(sk_db_IK_record,ds_type_map)){
			#region // add IK constraint
			var sk_IK_name = string(sk_db_IK_record[? "name"]);
			var sk_IK_chain = sk_db_IK_record[? "chain"]||false;
	        var sk_IK_boneTarget = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_IK_record[? "target"])];
			var sk_IK_boneJoint = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_IK_record[? "bone"])];
			var sk_IK_positive = (is_undefined(sk_db_IK_record[? "bendPositive"])||sk_db_IK_record[? "bendPositive"]) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
			var sk_IK_weight = is_real(sk_db_IK_record[? "weight"]) ? sk_db_IK_record[? "weight"] : 1;
			// create new record and set data
			var sk_constraint = sk_ik_constraint_create(sk_IK_name,sk_IK_boneJoint,sk_IK_boneTarget,sk_IK_chain);
			sk_ik_constraint_set_pose(
				sk_constraint,
				sk_IK_positive,
				sk_IK_weight
			);
			ds_list_add(sk_constraints,sk_constraint);
			#endregion
	    }
	}
}
// transfer animation data
if(is_real(sk_db_animations)&&ds_exists(sk_db_animations,ds_type_list)){
	var sk_db_anim_count = ds_list_size(sk_db_animations);
	for(var sk_db_anim_id = 0; sk_db_anim_id < sk_db_anim_count; sk_db_anim_id++){
	    var sk_db_anim_record = sk_db_animations[| sk_db_anim_id];
	    if(is_real(sk_db_anim_record)&&ds_exists(sk_db_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(sk_db_anim_record[? "name"]));
			sk_animation_set_duration(sk_anim,real(sk_db_anim_record[? "duration"])*sk_db_fps,false);
			ds_list_add(sk_animations,sk_anim);
			var sk_anim_timelines = ds_list_create();
			// compile timeline data
			var sk_db_anim_bones = sk_db_anim_record[? "bone"];
			var sk_db_anim_slots = sk_db_anim_record[? "slot"];
			var sk_db_anim_ik = sk_db_anim_record[? "ik"];
			var sk_db_anim_events = sk_db_anim_record[? "frame"];
			var sk_db_anim_order = sk_db_anim_record[? "zOrder"];
			// iterate through bone data
			if(is_real(sk_db_anim_bones)&&ds_exists(sk_db_anim_bones,ds_type_list)){
	            var sk_db_anim_bone_count = ds_list_size(sk_db_anim_bones);
	            for(var sk_db_anim_bone_id = 0; sk_db_anim_bone_id < sk_db_anim_bone_count; sk_db_anim_bone_id++){
	                var sk_db_anim_bone_record = sk_db_anim_bones[| sk_db_anim_bone_id];
	                if(is_real(sk_db_anim_bone_record)&&ds_exists(sk_db_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(sk_db_anim_bone_record[? "name"]);
						var sk_anim_timeline_boneData = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_anim_timeline_boneName)];
						var sk_db_anim_bone_translate = sk_db_anim_bone_record[? "translateFrame"];
						var sk_db_anim_bone_scale = sk_db_anim_bone_record[? "scaleFrame"];
						var sk_db_anim_bone_rotate = sk_db_anim_bone_record[? "rotateFrame"];
						#region // compile translate timeline
						if(is_real(sk_db_anim_bone_translate)&&ds_exists(sk_db_anim_bone_translate,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_bone_translate);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_translate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_bone_translate[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_db_anim_frame_record[? "x"],
											sk_db_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_translate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(sk_db_anim_bone_scale)&&ds_exists(sk_db_anim_bone_scale,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_bone_scale);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_scale_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_bone_scale[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_db_anim_frame_record[? "x"],
											sk_db_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_scale_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
						#region // compile rotate timeline
						if(is_real(sk_db_anim_bone_rotate)&&ds_exists(sk_db_anim_bone_rotate,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_bone_rotate);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_rotate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_bone_rotate[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											-real(sk_db_anim_frame_record[? "rotate"]),
											-real(sk_db_anim_frame_record[? "clockwise"]), // this value is multiplied to the next frame to get the amount of extra periods of rotation
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_rotate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through slot data
			if(is_real(sk_db_anim_slots)&&ds_exists(sk_db_anim_slots,ds_type_list)){
	            var sk_db_anim_slot_count = ds_list_size(sk_db_anim_slots);
	            for(var sk_db_anim_slot_id = 0; sk_db_anim_slot_id < sk_db_anim_slot_count; sk_db_anim_slot_id++){
	                var sk_db_anim_slot_record = sk_db_anim_slots[| sk_db_anim_slot_id];
	                if(is_real(sk_db_anim_slot_record)&&ds_exists(sk_db_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(sk_db_anim_slot_record[? "name"]);
						var sk_anim_timeline_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_anim_timeline_slotName)];
						var sk_db_anim_slot_colour = sk_db_anim_slot_record[? "colorFrame"];
						var sk_db_anim_slot_display = sk_db_anim_slot_record[? "displayFrame"];
						#region // compile colour timeline
						if(is_real(sk_db_anim_slot_colour)&&ds_exists(sk_db_anim_slot_colour,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_slot_colour);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_colour_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_slot_colour[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
										// get colour
										var sk_anim_frame_colour = $ffffff;
		                                var sk_anim_frame_alpha = 1;
										var sk_db_anim_frame_colourData = sk_db_anim_frame_record[? "color"];
		                                if(is_real(sk_db_anim_frame_colourData)&&ds_exists(sk_db_anim_frame_colourData,ds_type_map)){
		                                    var sk_anim_frame_r = sk_db_anim_frame_colourData[? "rM"];
		                                    var sk_anim_frame_g = sk_db_anim_frame_colourData[? "gM"];
		                                    var sk_anim_frame_b = sk_db_anim_frame_colourData[? "bM"];
		                                    var sk_anim_frame_a = sk_db_anim_frame_colourData[? "aM"];
		                                    sk_anim_frame_colour = make_colour_rgb(
												is_real(sk_anim_frame_r) ? sk_anim_frame_r : 255,
												is_real(sk_anim_frame_g) ? sk_anim_frame_g : 255,
												is_real(sk_anim_frame_b) ? sk_anim_frame_b : 255
											);
		                                    sk_anim_frame_alpha = is_real(sk_anim_frame_a) ? sk_anim_frame_a : 1;
		                                }
		                                // append keyframe data in format [time, colour, alpha, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_anim_frame_colour,
											sk_anim_frame_alpha,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_colour_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
						#region // compile display timeline
						if(is_real(sk_db_anim_slot_display)&&ds_exists(sk_db_anim_slot_display,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_slot_display);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_attachment_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_slot_display[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// append keyframe data in format [time, displayIndex]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											string(real(sk_db_anim_frame_record[? "value"]))
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_attachment_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through ik data
			if(is_real(sk_db_anim_ik)&&ds_exists(sk_db_anim_ik,ds_type_list)){
	            var sk_db_anim_ik_count = ds_list_size(sk_db_anim_ik);
	            for(var sk_db_anim_ik_id = 0; sk_db_anim_ik_id < sk_db_anim_ik_count; sk_db_anim_ik_id++){
	                var sk_db_anim_ik_record = sk_db_anim_ik[| sk_db_anim_ik_id];
	                if(is_real(sk_db_anim_ik_record)&&ds_exists(sk_db_anim_ik_record,ds_type_map)){
						// add ik timeline data to animation
						var sk_anim_timeline_ikName = string(sk_db_anim_ik_record[? "name"]);
						var sk_anim_timeline_ikData = sk_constraints[| ds_list_find_index_sk_ik_constraint(sk_constraints,sk_anim_timeline_ikName)];
						var sk_db_anim_ik_frames = sk_db_anim_ik_record[? "frame"];
						#region // compile ik timeline
						if(is_real(sk_db_anim_ik_frames)&&ds_exists(sk_db_anim_ik_frames,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_ik_frames);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_ik_timeline_create(sk_anim_timeline_ikData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_ik_frames[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){// add frame
		                                // add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, bendDir, weight, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											(is_undefined(sk_db_anim_frame_record[? "bendPositive"])||sk_db_anim_frame_record[? "bendPositive"]) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE,
											sk_db_anim_frame_record[? "weight"],
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_ik_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
					}
				}
			}
			#region // compile event timelines
			var sk_event_timeline_map = ds_map_create(); // create a map to keep track of the timelines for each event
			if(is_real(sk_db_anim_events)&&ds_exists(sk_db_anim_events,ds_type_list)){
	            var sk_db_anim_event_count = ds_list_size(sk_db_anim_events);
				if(sk_db_anim_event_count>0){
					var sk_anim_frame_time = 0; // this is used for events which appear halfway through the timeline
		            for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_event_count; sk_db_anim_frame_id++){
		                var sk_db_anim_frame_record = sk_db_anim_events[| sk_db_anim_frame_id];
		                if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
							// add frame
							var sk_db_anim_frame_events = sk_db_anim_frame_record[? "events"];
							var sk_event_sound = asset_get_index(string(sk_db_anim_frame_record[? "sound"]));
							if(is_real(sk_db_anim_frame_events)&&ds_exists(sk_db_anim_frame_events,ds_type_list)){
								// iterate through events and set their timelines
								var sk_db_event_id;
								var sk_db_event_count = ds_list_size(sk_db_anim_frame_events);
								for(sk_db_event_id = 0; sk_db_event_id < sk_db_event_count; sk_db_event_id++){
									var sk_db_event = sk_db_anim_frame_events[| sk_db_event_id];
									if(is_real(sk_db_event)&&ds_exists(sk_db_event,ds_type_map)){
										// add event
										var sk_event_name = sk_db_event[? "name"];
										//show_message(sk_event_name+string(sk_db_anim_frame_id));
										var sk_event = sk_events[| ds_list_find_index_sk_event(sk_events,sk_event_name)];
										if(!sk_event_exists(sk_event)){
											// the event doesn't exist yet, so create it
											sk_event = sk_event_create(sk_event_name);
											ds_list_add(sk_events,sk_event);
										}
										var sk_event_timeline = sk_event_timeline_map[? sk_event_name];
										if(!sk_event_timeline_exists(sk_event_timeline)){
											// the event timeline doesn't exist yet, so create it
											sk_event_timeline = sk_event_timeline_create(sk_event);
											ds_list_add(sk_anim_timelines,sk_event_timeline);
											sk_event_timeline_map[? sk_event_name] = sk_event_timeline;
										}
										// get data types
										var sk_event_bone = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_event[? "bone"])];
										var sk_event_string = undefined;
										var sk_event_float = undefined;
										var sk_event_int = undefined;
										var sk_db_event_strings = sk_db_event[? "strings"];
										if(is_real(sk_db_event_strings)&&ds_exists(sk_db_event_strings,ds_type_list)){
											sk_event_string = string(sk_db_event_strings[| 0]);
										}
										var sk_db_event_floats = sk_db_event[? "floats"];
										if(is_real(sk_db_event_floats)&&ds_exists(sk_db_event_floats,ds_type_list)){
											sk_event_float = real(sk_db_event_floats[| 0]);
										}
										var sk_db_event_ints = sk_db_event[? "ints"];
										if(is_real(sk_db_event_ints)&&ds_exists(sk_db_event_ints,ds_type_list)){
											sk_event_int = int64(sk_db_event_ints[| 0]);
										}
										// append timeline data
										var sk_timeline_frames = ds_list_create();
										sk_event_timeline_get_keyframes(sk_event_timeline,sk_timeline_frames);
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_event_bone,
											sk_event_string,
											sk_event_float,
											sk_event_int,
											sk_event_sound
										);
										sk_event_timeline_set_keyframes(sk_event_timeline,sk_timeline_frames);
										ds_list_destroy(sk_timeline_frames);
									}
								}
							}
							// set next duration
							sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
						}
					}
				}
			}
			ds_map_destroy(sk_event_timeline_map);
			#endregion
			#region // compile draw order timeline
			if(is_real(sk_db_anim_order)&&ds_exists(sk_db_anim_order,ds_type_map)){
				var sk_db_anim_order_frames = sk_db_anim_order[? "frame"];
				if(is_real(sk_db_anim_order_frames)&&ds_exists(sk_db_anim_order_frames,ds_type_list)){
		            var sk_db_anim_frame_count = ds_list_size(sk_db_anim_order_frames);
					if(sk_db_anim_frame_count>0){
						var sk_order_timeline = sk_drawOrder_timeline_create(sk_arm);
						ds_list_add(sk_anim_timelines,sk_order_timeline);
						// compile frames
						var sk_timeline_frames = ds_list_create();
						var sk_anim_frame_time = 0;
			            for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
			                var sk_db_anim_frame_record = sk_db_anim_order_frames[| sk_db_anim_frame_id];
			                if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
								// add frame
								var sk_order_itemOffsetTuple = ds_list_create();
								// find original slot from slots array
								var sk_db_order_zOrder = sk_db_anim_frame_record[? "zOrder"];
								if(is_real(sk_db_order_zOrder)&&ds_exists(sk_db_order_zOrder,ds_type_list)){
									var sk_db_order_id;
									var sk_db_order_last = ds_list_size(sk_db_order_zOrder);
									for(sk_db_order_id = 0; sk_db_order_id < sk_db_order_last; sk_db_order_id+=2){
										var sk_order_z = real(sk_db_order_zOrder[| sk_db_order_id+0]);
										var sk_order_shift = real(sk_db_order_zOrder[| sk_db_order_id+1]);
										// use z value to locate the desired slot to shift
										var sk_order_slot = sk_slots[| sk_order_z];
										if(!sk_slot_exists(sk_order_slot)) then continue;
										// add slot and offset to tuple
										ds_list_add(
											sk_order_itemOffsetTuple,
											sk_order_slot,
											sk_order_shift
										);
									}
								}
								// append timeline data
								ds_list_add(
									sk_timeline_frames,
									sk_anim_frame_time,
									sk_order_itemOffsetTuple
								);
								ds_list_mark_as_list(sk_timeline_frames,ds_list_size(sk_timeline_frames)-1);
								// set next duration
								sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
							}
						}
						sk_drawOrder_timeline_set_keyframes(sk_order_timeline,sk_timeline_frames);
						ds_list_destroy(sk_timeline_frames);
					}
				}
			}
			#endregion
			sk_animation_set_timelines(sk_anim,sk_anim_timelines);
			ds_list_destroy(sk_anim_timelines);
			#endregion
		}
	}
}
// destroy dragonbones json
ds_map_destroy(sk_db_arm);
// set armature containers
sk_armature_set_bones(sk_arm,sk_bones);
sk_armature_set_constraints(sk_arm,sk_constraints);
sk_armature_set_slots(sk_arm,sk_slots);
sk_armature_set_animations(sk_arm,sk_animations);
sk_armature_set_skins(sk_arm,sk_skins);
sk_armature_set_attachments(sk_arm,sk_attachments);
sk_armature_set_events(sk_arm,sk_events);
sk_armature_update_cache(sk_arm);
sk_armature_set_default_skin(sk_arm,"");
sk_armature_set_skin(sk_arm);
sk_armature_pose_setup(sk_arm);
sk_armature_pose_update(sk_arm);
// destroy containers
ds_list_destroy(sk_bones);
ds_list_destroy(sk_constraints);
ds_list_destroy(sk_slots);
ds_list_destroy(sk_animations);
ds_list_destroy(sk_skins);
ds_list_destroy(sk_attachments);
ds_list_destroy(sk_events);
// return armature
return sk_arm;

#define sk_armature_create_spine
/// @desc loads an armature file
/// @param filepath
return sk_armature_create_spine_context(__sk_file_read_all(argument0));

#define sk_armature_create_spine_context
/// @desc loads an armature file
/// @param json
var sk_sp_armature = noone;
// extract armature data from spriter json
var sk_sp_arm = json_decode(argument0);
if(sk_sp_arm!=-1){
	sk_sp_armature = sk_sp_arm;
} else {
	return noone;
}
// extract important data
var sk_sp_meta = sk_sp_armature[? "skeleton"];
var sk_sp_bones = sk_sp_armature[? "bones"];
var sk_sp_slots = sk_sp_armature[? "slots"];
var sk_sp_skins = sk_sp_armature[? "skins"];
var sk_sp_constraints_IK = sk_sp_armature[? "ik"];
var sk_sp_constraints_transform = sk_sp_armature[? "transform"];
var sk_sp_constraints_path = sk_sp_armature[? "path"]; // not used
var sk_sp_animations = sk_sp_armature[? "animations"];
var sk_sp_events = sk_sp_armature[? "events"];
// create armature
var sk_arm = sk_armature_create();
// create containers
var sk_bones = ds_list_create();
var sk_constraints = ds_list_create();
var sk_slots = ds_list_create();
var sk_animations = ds_list_create();
var sk_skins = ds_list_create();
var sk_attachments = ds_list_create();
var sk_events = ds_list_create();
// transfer bone data
if(is_real(sk_sp_bones)&&ds_exists(sk_sp_bones,ds_type_list)){
	var sk_sp_bone_count = ds_list_size(sk_sp_bones);
	for(var sk_sp_bone_id = 0; sk_sp_bone_id < sk_sp_bone_count; sk_sp_bone_id++){
	    var sk_sp_bone_record = sk_sp_bones[| sk_sp_bone_id];
	    if(is_real(sk_sp_bone_record)&&ds_exists(sk_sp_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(sk_sp_bone_record[? "name"]);
	        var sk_bone_len = real(sk_sp_bone_record[? "length"]);
	        var sk_bone_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_bone_record[? "parent"])];
			var sk_bone_xpos = real(sk_sp_bone_record[? "x"]);
	        var sk_bone_ypos = -real(sk_sp_bone_record[? "y"]);
	        var sk_bone_xsc = is_real(sk_sp_bone_record[? "scaleX"]) ? sk_sp_bone_record[? "scaleX"] : 1;
	        var sk_bone_ysc = is_real(sk_sp_bone_record[? "scaleY"]) ? sk_sp_bone_record[? "scaleY"] : 1;
	        var sk_bone_xsh = real(sk_sp_bone_record[? "shearX"]);
			var sk_bone_ysh = real(sk_sp_bone_record[? "shearY"]);
			var sk_bone_rot = real(sk_sp_bone_record[? "rotation"]);
	        var sk_bone_inherit_rotation = !is_real(sk_sp_bone_record[? "inheritRotation"])||sk_sp_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(sk_sp_bone_record[? "inheritScale"])||sk_sp_bone_record[? "inheritScale"];
			var sk_bone_inheritance = SK_TRANSFORM_MODE_NORMAL;
			switch(sk_sp_bone_record[? "transform"]){
				case "onlyTranslation": sk_bone_inheritance = SK_TRANSFORM_MODE_NOROTATIONORSCALE; break;
				case "noRotationOrReflection": sk_bone_inheritance = SK_TRANSFORM_MODE_NOROTATION; break;
				case "noScale": case "noScaleOrReflection": sk_bone_inheritance = SK_TRANSFORM_MODE_NOSCALE; break;
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name,sk_bone_par,sk_bone_len);
			sk_bone_set_pose(
				sk_bone,
				sk_bone_xpos,sk_bone_ypos,
				sk_bone_xsc,sk_bone_ysc,
				sk_bone_xsh,sk_bone_ysh,
				sk_bone_rot,
				sk_bone_inheritance
			);
			ds_list_add(sk_bones,sk_bone);
			#endregion
		}
	}
}
// transfer slot data
if(is_real(sk_sp_slots)&&ds_exists(sk_sp_slots,ds_type_list)){
	var sk_sp_slot_count = ds_list_size(sk_sp_slots);
	for(var sk_sp_slot_id = 0; sk_sp_slot_id < sk_sp_slot_count; sk_sp_slot_id++){
	    var sk_sp_slot_record = sk_sp_slots[| sk_sp_slot_id];
	    if(is_real(sk_sp_slot_record)&&ds_exists(sk_sp_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(sk_sp_slot_record[? "name"]);
   			var sk_slot_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_slot_record[? "bone"])];
			var sk_slot_attachmentName = string(sk_sp_slot_record[? "attachment"]);
			var sk_slot_rgba = is_string(sk_sp_slot_record[? "color"]) ? sk_sp_slot_record[? "color"] : "FFFFFFFF";
	        // create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name);
			sk_slot_set_pose(
				sk_slot,
				__sk_hex_to_colour(sk_slot_rgba,false),
				__sk_hex_to_alpha(sk_slot_rgba,false),
				sk_slot_par,
				sk_slot_attachmentName
			);
			ds_list_add(sk_slots,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(sk_sp_skins)&&ds_exists(sk_sp_skins,ds_type_map)){
	var sk_sp_skin_count = ds_map_size(sk_sp_skins);
	var sk_sp_skin_name = ds_map_find_first(sk_sp_skins);
	repeat(sk_sp_skin_count){
		var sk_sp_skin_record = sk_sp_skins[? sk_sp_skin_name];
		if(is_real(sk_sp_skin_record)&&ds_exists(sk_sp_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin = sk_skin_create(sk_sp_skin_name);
			ds_list_add(sk_skins,sk_skin);
			// compile slot attachment data
			var sk_sp_skin_slots = sk_sp_skin_record;
			// iterate through skin slots and add their display data
			var sk_sp_skin_slot_count = ds_map_size(sk_sp_skin_slots);
			var sk_sp_skin_slot_name = ds_map_find_first(sk_sp_skin_slots);
			repeat(sk_sp_skin_slot_count){
				var sk_sp_skin_slot_record = sk_sp_skin_slots[? sk_sp_skin_slot_name];
				if(is_real(sk_sp_skin_slot_record)&&ds_exists(sk_sp_skin_slot_record,ds_type_map)){
					var sk_skin_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_sp_skin_slot_name)];
					var sk_sp_skin_slot_attachments = sk_sp_skin_slot_record;
					if(sk_slot_exists(sk_skin_slotData)){
						// iterate through slot attachments and add create attachments
						var sk_sp_skin_slot_attachment_count = ds_map_size(sk_sp_skin_slot_attachments);
						var sk_sp_skin_slot_attachment_key = ds_map_find_first(sk_sp_skin_slot_attachments);
						repeat(sk_sp_skin_slot_attachment_count){
							var sk_sp_skin_slot_attachment_record = sk_sp_skin_slot_attachments[? sk_sp_skin_slot_attachment_key];
							if(is_real(sk_sp_skin_slot_attachment_record)&&ds_exists(sk_sp_skin_slot_attachment_record,ds_type_map)){
								#region // add attachment to skin
								// attachment name is a combination of its parent slot's name and its attachment key
								var sk_attachment_name = string(sk_sp_skin_slot_name)+"."+string(sk_sp_skin_slot_attachment_key);
								var sk_attachment = noone;
								switch(sk_sp_skin_slot_attachment_record[? "type"]){
									case "mesh": case "linkedmesh": case "boundingbox": case "path": case "clipping": break; // not supported
									case "point":
										// create point attachment
										var sk_attachment_x = real(sk_sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sk_sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_rotation = real(sk_sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_point_attachment_create(sk_attachment_name,sk_attachment_x,sk_attachment_y,sk_attachment_rotation);
									break;
									case "region": default:
										// create plane (region) attachment
										var sk_attachment_textureName = is_string(sk_sp_skin_slot_attachment_record[? "name"]) ? sk_sp_skin_slot_attachment_record[? "name"] : string(sk_sp_skin_slot_attachment_key);
										var sk_attachment_x = real(sk_sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sk_sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_xscale = is_real(sk_sp_skin_slot_attachment_record[? "scaleX"]) ? sk_sp_skin_slot_attachment_record[? "scaleX"] : 1;
										var sk_attachment_yscale = is_real(sk_sp_skin_slot_attachment_record[? "scaleY"]) ? sk_sp_skin_slot_attachment_record[? "scaleY"] : 1;
										var sk_attachment_rotation = real(sk_sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_plane_attachment_create(sk_attachment_name);
										sk_plane_attachment_set_regionKey(sk_attachment,sk_attachment_textureName);
										sk_plane_attachment_set_matrix(
											sk_attachment,
											sk_attachment_x,sk_attachment_y,
											sk_attachment_xscale,sk_attachment_yscale,
											0,0,sk_attachment_rotation
										);
									break;
								}
								ds_list_add(sk_attachments,sk_attachment);
								// add attachment to the skin (even if it doesn't exist, because those will be null attachments)
								sk_skin_record_add(
									sk_skin,
									sk_skin_slotData,
									sk_attachment,
									sk_sp_skin_slot_attachment_key
								);
								#endregion
							}
							// goto next attachment
							sk_sp_skin_slot_attachment_key = ds_map_find_next(sk_sp_skin_slot_attachments,sk_sp_skin_slot_attachment_key);
						}
					}
				}
				// goto next slot
				sk_sp_skin_slot_name = ds_map_find_next(sk_sp_skin_slots,sk_sp_skin_slot_name);
			}
			#endregion
		}
		// goto next skin
		sk_sp_skin_name = ds_map_find_next(sk_sp_skins,sk_sp_skin_name);
	}
}
// transfer constraint data
var sk_sp_ik_count = 0;
if(is_real(sk_sp_constraints_IK)&&ds_exists(sk_sp_constraints_IK,ds_type_list)){
	sk_sp_ik_count = ds_list_size(sk_sp_constraints_IK);
}
var sk_sp_transform_count = 0;
if(is_real(sk_sp_constraints_transform)&&ds_exists(sk_sp_constraints_transform,ds_type_list)){
	sk_sp_transform_count = ds_list_size(sk_sp_constraints_transform);
}
var sk_sp_path_count = 0;
if(is_real(sk_sp_constraints_path)&&ds_exists(sk_sp_constraints_path,ds_type_list)){
	sk_sp_path_count = ds_list_size(sk_sp_constraints_path);
}
var sk_sp_constraint_count = sk_sp_ik_count + sk_sp_transform_count + sk_sp_path_count;
for(var sk_sp_constraint_id = 0; sk_sp_constraint_id < sk_sp_constraint_count; sk_sp_constraint_id++){
	// iterate through all constraints and add them by order
	if(sk_sp_ik_count>0){
		for(var sk_sp_ik_id = 0; sk_sp_ik_id < sk_sp_ik_count; sk_sp_ik_id++){
			var sk_sp_ik_record = sk_sp_constraints_IK[| sk_sp_ik_id];
			if(is_real(sk_sp_ik_record)&&ds_exists(sk_sp_ik_record,ds_type_map)){
				if(sk_sp_constraint_id==sk_sp_ik_record[? "order"]){
					var sk_sp_IK_bones = sk_sp_ik_record[? "bones"];
					if(is_real(sk_sp_IK_bones)&&ds_exists(sk_sp_IK_bones,ds_type_list)){
						#region // add IK constraint
						var sk_IK_name = string(sk_sp_ik_record[? "name"]);
				        var sk_IK_chain = ds_list_size(sk_sp_IK_bones)>1;
						var sk_IK_boneTarget = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_ik_record[? "target"])];
						var sk_IK_boneJoint = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_IK_bones[| sk_IK_chain ? 1 : 0])];
						var sk_IK_positive = (is_real(sk_sp_ik_record[? "bendPositive"])&&(!sk_sp_ik_record[? "bendPositive"])) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE; //  this is because spines +ve y axis is up (not down)
						var sk_IK_weight = is_real(sk_sp_ik_record[? "mix"]) ? sk_sp_ik_record[? "mix"] : 1;
						// create new record and set data
						var sk_constraint = sk_ik_constraint_create(sk_IK_name,sk_IK_boneJoint,sk_IK_boneTarget,sk_IK_chain);
						sk_ik_constraint_set_pose(sk_constraint,sk_IK_positive,sk_IK_weight);
						ds_list_add(sk_constraints,sk_constraint);
						#endregion
					}
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sk_sp_transform_count>0){
		for(var sk_sp_transform_id = 0; sk_sp_transform_id < sk_sp_transform_count; sk_sp_transform_id++){
			var sk_sp_transform_record = sk_sp_constraints_transform[| sk_sp_transform_id];
			if(is_real(sk_sp_transform_record)&&ds_exists(sk_sp_transform_record,ds_type_map)){
				if(sk_sp_constraint_id==sk_sp_transform_record[? "order"]){
					#region // add transformation constraint
					var sk_transform_name = string(sk_sp_transform_record[? "name"]);
					var sk_transform_boneTarget = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_transform_record[? "target"])];
					var sk_transform_bones = sk_sp_transform_record[? "bones"];
					var sk_transform_x = real(sk_sp_transform_record[? "x"]);
					var sk_transform_y = -real(sk_sp_transform_record[? "y"]);
					var sk_transform_xscale = real(sk_sp_transform_record[? "scaleX"]);
					var sk_transform_yscale = real(sk_sp_transform_record[? "scaleY"]);
					var sk_transform_yshear = real(sk_sp_transform_record[? "shearY"]);
					var sk_transform_rotation = real(sk_sp_transform_record[? "rotation"]);
					var sk_transform_translateMix = is_real(sk_sp_transform_record[? "translateMix"]) ? sk_sp_transform_record[? "translateMix"] : 1;
					var sk_transform_scaleMix = is_real(sk_sp_transform_record[? "scaleMix"]) ? sk_sp_transform_record[? "scaleMix"] : 1;
					var sk_transform_shearMix = is_real(sk_sp_transform_record[? "shearMix"]) ? sk_sp_transform_record[? "shearMix"] : 1;
					var sk_transform_rotateMix = is_real(sk_sp_transform_record[? "rotateMix"]) ? sk_sp_transform_record[? "rotateMix"] : 1;
					var sk_transform_local = real(sk_sp_transform_record[? "local"]);
					var sk_transform_relative = real(sk_sp_transform_record[? "relative"]);
					// create new record and set data
					var sk_constraint = sk_transformation_constraint_create(sk_transform_name,sk_transform_boneTarget);
					sk_transformation_constraint_set_state(sk_constraint,sk_transform_local,sk_transform_relative);
					sk_transformation_constraint_set_offsets(
						sk_constraint,
						sk_transform_x,sk_transform_y,
						sk_transform_xscale,sk_transform_yscale,
						sk_transform_yshear,sk_transform_rotation
					);
					sk_transformation_constraint_set_pose(
						sk_constraint,
						sk_transform_translateMix,
						sk_transform_scaleMix,
						sk_transform_shearMix,
						sk_transform_rotateMix
					);
					// add child bones
					var sk_children = ds_list_create();
					if(is_real(sk_transform_bones)&&ds_exists(sk_transform_bones,ds_type_list)){
						var sk_transform_bone_count = ds_list_size(sk_transform_bones);
						for(var sk_transform_bone_id = 0; sk_transform_bone_id < sk_transform_bone_count; sk_transform_bone_id++){
							var sk_transform_bone = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_transform_bones[| sk_transform_bone_id])];
							ds_list_add(sk_children,sk_transform_bone);
						}
					}
					sk_transformation_constraint_set_children(sk_constraint,sk_children);
					ds_list_destroy(sk_children);
					ds_list_add(sk_constraints,sk_constraint);
					#endregion
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sk_sp_path_count>0){
		for(var sk_sp_path_id = 0; sk_sp_path_id < sk_sp_path_count; sk_sp_path_id++){
			var sk_sp_path_record = sk_sp_constraints_path[| sk_sp_path_id];
			if(is_real(sk_sp_path_record)&&ds_exists(sk_sp_path_record,ds_type_map)){
				if(sk_sp_constraint_id==sk_sp_path_record[? "order"]){
					#region // add path constraint
					// TBA
					#endregion
				}
			}
		}
	}
}
// transfer event data
if(is_real(sk_sp_events)&&ds_exists(sk_sp_events,ds_type_map)){
	var sk_sp_event_count = ds_map_size(sk_sp_events);
	var sk_sp_event_name = ds_map_find_first(sk_sp_events);
	repeat(sk_sp_event_count){
	    var sk_sp_event_record = sk_sp_events[? sk_sp_event_name];
	    if(is_real(sk_sp_event_record)&&ds_exists(sk_sp_event_record,ds_type_map)){
			#region // add event
			var sk_event_string = is_string(sk_sp_event_record[? "string"]) ? sk_sp_event_record[? "string"] : "";
			var sk_event_float = real(sk_sp_event_record[? "float"]);
			var sk_event_int = int64(sk_sp_event_record[? "int"]);
			// create a new event and add it to the armature
			var sk_event = sk_event_create(string(sk_sp_event_name),noone,sk_event_string,sk_event_float,sk_event_int,-1);
			ds_list_add(sk_events,sk_event);
			#endregion
		}
		// goto next event
		sk_sp_event_name = ds_map_find_next(sk_sp_events,sk_sp_event_name);
	}
}
// transfer animation data
var sk_sp_fps = 60;
if(is_real(sk_sp_animations)&&ds_exists(sk_sp_animations,ds_type_map)){
	var sk_sp_anim_count = ds_map_size(sk_sp_animations);
	var sk_sp_anim_name = ds_map_find_first(sk_sp_animations);
	repeat(sk_sp_anim_count){
	    var sk_sp_anim_record = sk_sp_animations[? sk_sp_anim_name];
	    if(is_real(sk_sp_anim_record)&&ds_exists(sk_sp_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(sk_sp_anim_name));
			ds_list_add(sk_animations,sk_anim);
			var sk_anim_duration = 0;
			var sk_anim_timelines = ds_list_create();
			// compile timeline data
			var sk_sp_anim_bones = sk_sp_anim_record[? "bones"];
			var sk_sp_anim_slots = sk_sp_anim_record[? "slots"];
			var sk_sp_anim_ik = sk_sp_anim_record[? "ik"];
			var sk_sp_anim_transform = sk_sp_anim_record[? "transform"];
			var sk_sp_anim_events = sk_sp_anim_record[? "events"];
			var sk_sp_anim_drawOrder = sk_sp_anim_record[? "draworder"];
			// iterate through bone data
			if(is_real(sk_sp_anim_bones)&&ds_exists(sk_sp_anim_bones,ds_type_map)){
				var sk_sp_anim_bone_count = ds_map_size(sk_sp_anim_bones);
				var sk_sp_anim_bone_name = ds_map_find_first(sk_sp_anim_bones);
				repeat(sk_sp_anim_bone_count){
				    var sk_sp_anim_bone_record = sk_sp_anim_bones[? sk_sp_anim_bone_name];
				    if(is_real(sk_sp_anim_bone_record)&&ds_exists(sk_sp_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(sk_sp_anim_bone_name);
						var sk_anim_timeline_boneData = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_anim_timeline_boneName)];
						var sk_sp_anim_bone_translate = sk_sp_anim_bone_record[? "translate"];
						var sk_sp_anim_bone_scale = sk_sp_anim_bone_record[? "scale"];
						var sk_sp_anim_bone_shear = sk_sp_anim_bone_record[? "shear"];
						var sk_sp_anim_bone_rotate = sk_sp_anim_bone_record[? "rotate"];
						#region // compile translate timeline
						if(is_real(sk_sp_anim_bone_translate)&&ds_exists(sk_sp_anim_bone_translate,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_translate);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_translate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_translate[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											real(sk_sp_anim_frame_record[? "x"]),
											-real(sk_sp_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_translate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(sk_sp_anim_bone_scale)&&ds_exists(sk_sp_anim_bone_scale,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_scale);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_scale_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_scale[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "x"],
											sk_sp_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_scale_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile shear timeline
						if(is_real(sk_sp_anim_bone_shear)&&ds_exists(sk_sp_anim_bone_shear,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_shear);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_shear_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_shear[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "x"],
											sk_sp_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_shear_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile rotation timeline
						if(is_real(sk_sp_anim_bone_rotate)&&ds_exists(sk_sp_anim_bone_rotate,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_rotate);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_rotate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_rotate[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, angle, cycles, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "angle"],
											0,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_rotate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next bone
					sk_sp_anim_bone_name = ds_map_find_next(sk_sp_anim_bones,sk_sp_anim_bone_name);
				}
			}
			// iterate through slot data
			if(is_real(sk_sp_anim_slots)&&ds_exists(sk_sp_anim_slots,ds_type_map)){
				var sk_sp_anim_slot_count = ds_map_size(sk_sp_anim_slots);
				var sk_sp_anim_slot_name = ds_map_find_first(sk_sp_anim_slots);
				repeat(sk_sp_anim_slot_count){
				    var sk_sp_anim_slot_record = sk_sp_anim_slots[? sk_sp_anim_slot_name];
				    if(is_real(sk_sp_anim_slot_record)&&ds_exists(sk_sp_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(sk_sp_anim_slot_name);
						var sk_anim_timeline_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_anim_timeline_slotName)];
						var sk_sp_anim_slot_colour = sk_sp_anim_slot_record[? "color"];
						var sk_sp_anim_slot_attachment = sk_sp_anim_slot_record[? "attachment"];
						#region // compile colour timeline
						if(is_real(sk_sp_anim_slot_colour)&&ds_exists(sk_sp_anim_slot_colour,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_slot_colour);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_colour_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_slot_colour[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
										// get colour
										var sk_anim_frame_rgba = is_string(sk_sp_anim_frame_record[? "color"]) ? sk_sp_anim_frame_record[? "color"] : "FFFFFFFF";
										// append keyframe data in format [time, colour, alpha, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											__sk_hex_to_colour(sk_anim_frame_rgba,false),
											__sk_hex_to_alpha(sk_anim_frame_rgba,false),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_colour_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile attachment timeline
						if(is_real(sk_sp_anim_slot_attachment)&&ds_exists(sk_sp_anim_slot_attachment,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_slot_attachment);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_attachment_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_slot_attachment[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// append keyframe data in format [time, attachmentName]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											string(sk_sp_anim_frame_record[? "name"])
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_attachment_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next slot
					sk_sp_anim_slot_name = ds_map_find_next(sk_sp_anim_slots,sk_sp_anim_slot_name);
				}
			}
			// iterate through ik data
			if(is_real(sk_sp_anim_ik)&&ds_exists(sk_sp_anim_ik,ds_type_map)){
				var sk_sp_anim_ik_count = ds_map_size(sk_sp_anim_ik);
				var sk_sp_anim_ik_name = ds_map_find_first(sk_sp_anim_ik);
				repeat(sk_sp_anim_ik_count){
				    var sk_sp_anim_ik_record = sk_sp_anim_ik[? sk_sp_anim_ik_name];
				    if(is_real(sk_sp_anim_ik_record)&&ds_exists(sk_sp_anim_ik_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_ikName = string(sk_sp_anim_ik_name);
						var sk_anim_timeline_ikData = sk_constraints[| ds_list_find_index_sk_ik_constraint(sk_constraints,sk_anim_timeline_ikName)];
						var sk_sp_anim_ik_frames = sk_sp_anim_ik_record;
						#region // compile IK timeline
						if(true){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_ik_frames);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_ik_timeline_create(sk_anim_timeline_ikData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_anim_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_ik_frames[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, bendDir, weight, tweenEasing]
										ds_list_add(
											sk_anim_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "bendPositive"] ? SK_BEND_NEGATIVE : SK_BEND_POSITIVE,
											is_real(sk_sp_anim_frame_record[? "mix"]) ? sk_sp_anim_frame_record[? "mix"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_ik_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next ik constraint
					sk_sp_anim_ik_name = ds_map_find_next(sk_sp_anim_ik,sk_sp_anim_ik_name);
				}
			}
			// iterate through transformation data
			if(is_real(sk_sp_anim_transform)&&ds_exists(sk_sp_anim_transform,ds_type_map)){
				var sk_sp_anim_transform_count = ds_map_size(sk_sp_anim_transform);
				var sk_sp_anim_transform_name = ds_map_find_first(sk_sp_anim_transform);
				repeat(sk_sp_anim_transform_count){
				    var sk_sp_anim_transform_record = sk_sp_anim_transform[? sk_sp_anim_transform_name];
				    if(is_real(sk_sp_anim_transform_record)&&ds_exists(sk_sp_anim_transform_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_transformName = string(sk_sp_anim_transform_name);
						var sk_anim_timeline_transformData = sk_constraints[| ds_list_find_index_sk_transformation_constraint(sk_constraints,sk_anim_timeline_transformName)];
						var sk_sp_anim_transform_frames = sk_sp_anim_transform_record;
						#region // compile transform timeline
						if(true){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_transform_frames);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_transformation_timeline_create(sk_anim_timeline_transformData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_anim_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_transform_frames[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, bendDir, weight, tweenEasing]
										ds_list_add(
											sk_anim_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "translateMix"],
											sk_sp_anim_frame_record[? "scaleMix"],
											sk_sp_anim_frame_record[? "shearMix"],
											sk_sp_anim_frame_record[? "rotateMix"],
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_transformation_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next transformation constraint
					sk_sp_anim_transform_name = ds_map_find_next(sk_sp_anim_transform,sk_sp_anim_transform_name);
				}
			}
			// iterate through event data
			var sk_sp_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(sk_sp_anim_record,"|sk_sp_EVENT_TIMELINE_MAP|",sk_sp_EVENT_TIMELINE_MAP); // store it in the spine json temporarily so it can be destroyed easily
			if(is_real(sk_sp_anim_events)&&ds_exists(sk_sp_anim_events,ds_type_list)){
				var sk_sp_anim_event_count = ds_list_size(sk_sp_anim_events);
				if(sk_sp_anim_event_count>0){
					var sk_anim_frame_duration = 0;
		            for(var sk_sp_anim_event_id = 0; sk_sp_anim_event_id < sk_sp_anim_event_count; sk_sp_anim_event_id++){
		                var sk_sp_anim_event_record = sk_sp_anim_events[| sk_sp_anim_event_id];
		                if(is_real(sk_sp_anim_event_record)&&ds_exists(sk_sp_anim_event_record,ds_type_map)){
							#region // compile event timeline
							var sk_anim_frame_time = real(sk_sp_anim_event_record[? "time"])*sk_sp_fps;
							var sk_anim_frame_eventName = sk_sp_anim_event_record[? "name"];
							// get event
							var sk_anim_frame_event = sk_events[| ds_list_find_index_sk_event(sk_events,sk_anim_frame_eventName)];
							if(sk_event_exists(sk_anim_frame_event)){
								// get timeline
								var sk_anim_frame_timeline = sk_sp_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName];
								if(!sk_event_timeline_exists(sk_anim_frame_timeline)){
									// timeline doesn't exist, create it
									sk_anim_frame_timeline = sk_event_timeline_create(sk_anim_frame_event);
									ds_list_add(sk_anim_timelines,sk_anim_frame_timeline);
									sk_sp_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName] = sk_anim_frame_timeline;
								}
								// get event data
								var sk_anim_frame_int = sk_sp_anim_event_record[? "int"];
								var sk_anim_frame_float = sk_sp_anim_event_record[? "float"];
								var sk_anim_frame_string = sk_sp_anim_event_record[? "string"];
								// append timeline data in format [time, bone, string, real, int, sound]
								var sk_anim_frames = ds_list_create();
								sk_event_timeline_get_keyframes(sk_anim_frame_timeline,sk_anim_frames);
								ds_list_add(
									sk_anim_frames,
									sk_anim_frame_time,
									undefined,
									sk_anim_frame_string,
									sk_anim_frame_float,
									sk_anim_frame_int,
									-1
								);
								sk_event_timeline_set_keyframes(sk_anim_frame_timeline,sk_anim_frames);
								ds_list_destroy(sk_anim_frames);
							}
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
							#endregion
						}
					}
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// iterate through drawOrder data
			if(is_real(sk_sp_anim_drawOrder)&&ds_exists(sk_sp_anim_drawOrder,ds_type_list)){
				var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_drawOrder);
				if(sk_sp_anim_frame_count>0){
					// add timeline to animation
					var sk_timelineData = sk_drawOrder_timeline_create(sk_arm);
					ds_list_add(sk_anim_timelines,sk_timelineData);
					#region // compile order frames
					var sk_anim_frames = ds_list_create();
					var sk_anim_frame_duration = 0;
		            for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                var sk_sp_anim_frame_record = sk_sp_anim_drawOrder[| sk_sp_anim_frame_id];
		                if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
							// add frame
							var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
							var sk_order_itemOffsetTuple = ds_list_create();
							// find original slot from slots array
							var sk_sp_order_offsets = sk_sp_anim_frame_record[? "offsets"];
							if(is_real(sk_sp_order_offsets)&&ds_exists(sk_sp_order_offsets,ds_type_list)){
								var sk_sp_order_offset_count = ds_list_size(sk_sp_order_offsets);
								for(var sk_sp_order_offset_id = 0; sk_sp_order_offset_id < sk_sp_order_offset_count; sk_sp_order_offset_id++){
									var sk_sp_order_record = sk_sp_order_offsets[| sk_sp_order_offset_id];
									if(is_real(sk_sp_order_record)&&ds_exists(sk_sp_order_record,ds_type_map)){
										var sk_order_slot = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_sp_order_record[? "slot"])];
										if(!sk_slot_exists(sk_order_slot)) then continue;
										// add slot and offset to tuple
										ds_list_add(
											sk_order_itemOffsetTuple,
											sk_order_slot,
											real(sk_sp_order_record[? "slot"])
										);
									}
								}
							}
							// append timeline data in the format [time, tuple]
							ds_list_add(
								sk_anim_frames,
								sk_anim_frame_time,
								sk_order_itemOffsetTuple
							);
							ds_list_mark_as_list(sk_anim_frames,ds_list_size(sk_anim_frames)-1);
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
						}
					}
					#endregion
					sk_drawOrder_timeline_set_keyframes(sk_timelineData,sk_anim_frames);
					ds_list_destroy(sk_anim_frames);
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// set final duration
			sk_animation_set_duration(sk_anim,sk_anim_duration,false);
			// set timelines
			sk_animation_set_timelines(sk_anim,sk_anim_timelines);
			ds_list_destroy(sk_anim_timelines);
			#endregion
		}
		// goto next animation
		sk_sp_anim_name = ds_map_find_next(sk_sp_animations,sk_sp_anim_name);
	}
}
// destroy spine json
ds_map_destroy(sk_sp_arm);
// set armature containers
sk_armature_set_bones(sk_arm,sk_bones);
sk_armature_set_constraints(sk_arm,sk_constraints);
sk_armature_set_slots(sk_arm,sk_slots);
sk_armature_set_animations(sk_arm,sk_animations);
sk_armature_set_skins(sk_arm,sk_skins);
sk_armature_set_attachments(sk_arm,sk_attachments);
sk_armature_set_events(sk_arm,sk_events);
sk_armature_update_cache(sk_arm);
sk_armature_set_default_skin(sk_arm,"default");
sk_armature_set_skin(sk_arm);
sk_armature_pose_setup(sk_arm);
sk_armature_pose_update(sk_arm);
// destroy containers
ds_list_destroy(sk_bones);
ds_list_destroy(sk_constraints);
ds_list_destroy(sk_slots);
ds_list_destroy(sk_animations);
ds_list_destroy(sk_skins);
ds_list_destroy(sk_attachments);
ds_list_destroy(sk_events);
// return armature
return sk_arm;

#define sk_armature_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc destroys
/// @param armature
sk_object_destroy(argument0);

#define sk_armature_draw_debug
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc renders an abstract structure representing the bone
/// @param armature
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_bones = argument0[sk_data_armature.bones];
var sk_bone_count = ds_list_size(sk_bones);
for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
	var sk_bone = sk_bones[| sk_bone_id];
	sk_bone_draw_debug(sk_bone,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define sk_armature_exists
/// @desc exists
/// @param variable
return(sk_object_exists(argument0,SK_TYPE_ARMATURE));

#define sk_armature_get_animations
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.animations]);

#define sk_armature_get_attachments
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.attachments]);

#define sk_armature_get_bones
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.bones]);

#define sk_armature_get_constraints
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.constraints]);

#define sk_armature_get_drawOrder
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.drawOrder]);

#define sk_armature_get_events
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.events]);

#define sk_armature_get_skins
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.skins]);

#define sk_armature_get_slots
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.slots]);

#define sk_armature_get_updateOrder
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc returns a property
/// @param armature
/// @param id
ds_list_copy(argument1,argument0[sk_data_armature.updateOrder]);

#define sk_armature_pose_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets the local transforms of the bones, slots, and constraints
/// @param armature
var sk_updateOrder = argument0[sk_data_armature.updateOrder];
var sk_drawOrder = argument0[sk_data_armature.drawOrder];
ds_list_copy(sk_drawOrder,argument0[sk_data_armature.slots]);
// set bones/constraints to setup pose
var sk_updatable_count = ds_list_size(sk_updateOrder);
for(var sk_updatable_id = 0; sk_updatable_id<sk_updatable_count; sk_updatable_id++){
	sk_updatable_setup(sk_updateOrder[| sk_updatable_id]);
}
// set slots to setup pose
var sk_slot_count = ds_list_size(sk_drawOrder);
for(var sk_slot_id = 0; sk_slot_id<sk_slot_count; sk_slot_id++){
	sk_renderable_setup(sk_drawOrder[| sk_slot_id]);
}

#define sk_armature_pose_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc iterates through the updatables and updates their world transforms
/// @param armature
var sk_updateOrder = argument0[sk_data_armature.updateOrder];
var sk_updatable_count = ds_list_size(sk_updateOrder);
for(var sk_updatable_id = 0; sk_updatable_id<sk_updatable_count; sk_updatable_id++){
	sk_updatable_update(sk_updateOrder[| sk_updatable_id]);
}

#define sk_armature_pose_vertex_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc iterates through the slots and applies them to the vertex buffer
/// @param armature
/// @param vbuff
var sk_drawOrder = argument0[sk_data_armature.drawOrder];
var sk_slot_id_last = ds_list_size(sk_drawOrder)-1;
for(var sk_slot_id = 0; sk_slot_id<=sk_slot_id_last; sk_slot_id++){
	sk_renderable_vertex_add(sk_drawOrder[| sk_slot_id],argument1);
}

#define sk_armature_set_animations
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.animations];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_animation_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_set_atlas
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc iterates through the attachments and updates their regions using the supplied atlas
/// @param armature
/// @param atlas
var sk_attachments = argument0[sk_data_armature.attachments];
var sk_attachment_count = ds_list_size(sk_attachments);
for(var sk_attachment_id = 0; sk_attachment_id<sk_attachment_count; sk_attachment_id++){
	var sk_attachment = sk_attachments[| sk_attachment_id];
	if(sk_plane_attachment_exists(sk_attachment)){
		sk_plane_attachment_set_atlas(sk_attachment,argument1);
	}
}

#define sk_armature_set_attachments
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.attachments];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_attachment_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_set_bones
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.bones];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_bone_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_set_constraints
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.constraints];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_updatable_exists(sk_item)&&(!sk_bone_exists(sk_item))){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_set_default_skin
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param skin_name
argument0[@ sk_data_armature.defaultSkin] = argument1;

#define sk_armature_set_events
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.events];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_event_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_set_skin
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets the skin
/// @param armature
/// @param [skin_name1
/// @param skin_name2
/// @param ...]
var sk_obj = argument[0];
var sk_slots = sk_obj[sk_data_armature.slots];
// clear slots
var sk_slot_count = ds_list_size(sk_slots);
var sk_empty_map = ds_map_create();
for(var sk_slot_id = 0; sk_slot_id<sk_slot_count; sk_slot_id++){
	sk_renderable_set_attachments(sk_slots[| sk_slot_id],sk_empty_map);
}
ds_map_destroy(sk_empty_map);
// apply skins
var sk_skins = sk_obj[sk_data_armature.skins];
for(var argument_id = 0; argument_id<argument_count; argument_id++){
	var sk_skin_name = (argument_id<1) ? argument0[sk_data_armature.defaultSkin] : argument[argument_id];
	var sk_skin_pos = ds_list_find_index_sk_skin(sk_skins,sk_skin_name);
	if(sk_skin_pos!=-1){
		sk_skin_apply(sk_skins[| sk_skin_pos],false);
	}
}

#define sk_armature_set_skins
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.skins];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_skin_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_set_slots
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.slots];
ds_list_clear(sk_target_list);
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_renderable_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}

#define sk_armature_update_cache
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc Caches information about bones, slots, and constraints.
///		| THIS MUST BE CALLED IN THE FOLLOWING CASES:
///		| * Changes to the bone hierarchy (changing a parent, this may not apply to slots, but be aware and call this just incase)
///		| * Changes to the default draw order (deleting or adding a slot)
///		| * Changes to a constraint data sets, such as changing the end effector of an IKConstraint
///		| * New bones, slots, or constraints are created or removed from the armature
/// @param armature
var sk_updateOrder = argument0[sk_data_armature.updateOrder];
ds_list_clear(sk_updateOrder);
// sort constraints
var sk_constraints = argument0[sk_data_armature.constraints];
var sk_constraint_count = ds_list_size(sk_constraints);
for(var sk_constraint_id = 0; sk_constraint_id<sk_constraint_count; sk_constraint_id++){
	sk_updatable_cache(sk_constraints[| sk_constraint_id],sk_updateOrder);
}
// sort remaining bones
var sk_bones = argument0[sk_data_armature.bones];
var sk_bone_count = ds_list_size(sk_bones);
for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
	sk_updatable_cache(sk_bones[| sk_bone_id],sk_updateOrder);
}

#define sk_atlas_add_region
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc adds a subtexture to the subtexture map
/// @param atlas
/// @param key
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param ox
/// @param oy
/// @param w
/// @param h
/// @param rotation
var sk_uv_left = clamp(argument2,0,1);
var sk_uv_top = clamp(argument3,0,1);
var sk_uv_right = clamp(argument4,0,1);
var sk_uv_bottom = clamp(argument5,0,1);
var sk_uv_ox = argument6;
var sk_uv_oy = argument7;
var sk_uv_width = argument8;
var sk_uv_height = argument9;
var sk_region = array_create(12);
switch(floor((angle_difference(argument10+45,0))/90)){
	case -2:
		// rotate 180 degrees
		sk_region[@ 0] = sk_uv_right;
		sk_region[@ 1] = sk_uv_bottom;
		sk_region[@ 2] = sk_uv_left;
		sk_region[@ 3] = sk_uv_bottom;
		sk_region[@ 4] = sk_uv_right;
		sk_region[@ 5] = sk_uv_top;
		sk_region[@ 6] = sk_uv_left;
		sk_region[@ 7] = sk_uv_top;
	break;
	case -1:
		// rotate 90 degrees clockwise
		sk_region[@ 0] = sk_uv_right;
		sk_region[@ 1] = sk_uv_top;
		sk_region[@ 2] = sk_uv_right;
		sk_region[@ 3] = sk_uv_bottom;
		sk_region[@ 4] = sk_uv_left;
		sk_region[@ 5] = sk_uv_top;
		sk_region[@ 6] = sk_uv_left;
		sk_region[@ 7] = sk_uv_bottom;
	break;
	case 0:
		// no rotation
		sk_region[@ 0] = sk_uv_left;
		sk_region[@ 1] = sk_uv_top;
		sk_region[@ 2] = sk_uv_right;
		sk_region[@ 3] = sk_uv_top;
		sk_region[@ 4] = sk_uv_left;
		sk_region[@ 5] = sk_uv_bottom;
		sk_region[@ 6] = sk_uv_right;
		sk_region[@ 7] = sk_uv_bottom;
	break;
	case 1:
		// rotate 90 degrees counter clockwise
		sk_region[@ 0] = sk_uv_left;
		sk_region[@ 1] = sk_uv_bottom;
		sk_region[@ 2] = sk_uv_left;
		sk_region[@ 3] = sk_uv_top;
		sk_region[@ 4] = sk_uv_right;
		sk_region[@ 5] = sk_uv_bottom;
		sk_region[@ 6] = sk_uv_right;
		sk_region[@ 7] = sk_uv_top;
	break;
}
sk_region[@ 8] = sk_uv_ox;
sk_region[@ 9] = sk_uv_oy;
sk_region[@ 10] = sk_uv_width;
sk_region[@ 11] = sk_uv_height;
ds_map_add(argument0[sk_data_atlas.subtextures],argument1,sk_region);

#define sk_atlas_add_region_direct
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc adds a subtexture to the subtexture map
/// @param atlas
/// @param key
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param u3
/// @param v3
/// @param u4
/// @param v4
/// @param ox
/// @param oy
/// @param w
/// @param h
var sk_region = [];
sk_region[@ 0] = clamp(argument2,0,1); // defined in a clockwise motion
sk_region[@ 1] = clamp(argument3,0,1);
sk_region[@ 2] = clamp(argument4,0,1);
sk_region[@ 3] = clamp(argument5,0,1);
sk_region[@ 4] = clamp(argument6,0,1);
sk_region[@ 5] = clamp(argument7,0,1);
sk_region[@ 6] = clamp(argument8,0,1);
sk_region[@ 7] = clamp(argument9,0,1);
sk_region[@ 8] = argument10; // this is relative to the top left of the region in world coordinates
sk_region[@ 9] = argument11;
sk_region[@ 10] = argument12;
sk_region[@ 11] = argument13;
ds_map_add(argument0[sk_data_atlas.subtextures],argument1,sk_region);

#define sk_atlas_create
/// @desc create
/// @param [sprite
/// @param index]
var sk_obj = sk_object_create(SK_TYPE_ATLAS);
if(argument_count>1) then sk_atlas_set_page(sk_obj,argument[0],argument[1]);
return sk_obj;

#define sk_atlas_create_dragonbones
/// @desc loads an atlas file
/// @param filepath
/// @param sprite
/// @param subimg
/// @param scale
return sk_atlas_create_dragonbones_context(__sk_file_read_all(argument0),argument1,argument2,argument3);

#define sk_atlas_create_dragonbones_context
/// @desc builds an atlas from dragonbones json format
/// @param json
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sk_db_atlas = json_decode(argument0);
if(ds_exists(sk_db_atlas,ds_type_map)){
	var sk_db_atlas_subtextures = sk_db_atlas[? "SubTexture"];
	if(is_real(sk_db_atlas_subtextures)&&ds_exists(sk_db_atlas_subtextures,ds_type_list)&&(!ds_list_empty(sk_db_atlas_subtextures))){
		var sk_db_texture_width = sk_db_atlas[? "width"];
        var sk_db_texture_height = sk_db_atlas[? "height"];
        if(is_real(sk_db_texture_width)&&(sk_db_texture_width>0)&&is_real(sk_db_texture_height)&&(sk_db_texture_height>0)){
			// build final structure
			var sk_atlas = sk_atlas_create();
			#region // transfer atlas texture data to new structure
			var sk_db_subtex_count = ds_list_size(sk_db_atlas_subtextures); var sk_db_subtex_id;
			for(sk_db_subtex_id = 0; sk_db_subtex_id < sk_db_subtex_count; sk_db_subtex_id++){
				var sk_db_subtex_record = sk_db_atlas_subtextures[| sk_db_subtex_id];
				if(is_real(sk_db_subtex_record)&&ds_exists(sk_db_subtex_record,ds_type_map)){
				    var sk_tex_name = string(sk_db_subtex_record[? "name"]);
				    var sk_tex_x = real(sk_db_subtex_record[? "x"]); // defaults to '0' if not real
					var sk_tex_y = real(sk_db_subtex_record[? "y"]);
					var sk_tex_w = real(sk_db_subtex_record[? "width"]);
					var sk_tex_h = real(sk_db_subtex_record[? "height"]);
					var sk_tex_dxframe = real(sk_db_subtex_record[? "frameX"]);
					var sk_tex_dyframe = real(sk_db_subtex_record[? "frameY"]);
					var sk_tex_wframe = is_real(sk_db_subtex_record[? "frameWidth"]) ? sk_db_subtex_record[? "frameWidth"] : sk_tex_w;
					var sk_tex_hframe = is_real(sk_db_subtex_record[? "frameHeight"]) ? sk_db_subtex_record[? "frameHeight"] : sk_tex_h;
					// insert
					sk_atlas_add_region(
						sk_atlas,
						sk_tex_name,
						sk_tex_x/sk_db_texture_width,
						sk_tex_y/sk_db_texture_height,
						(sk_tex_x+sk_tex_w)/sk_db_texture_width,
						(sk_tex_y+sk_tex_h)/sk_db_texture_height,
						(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
						(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
						sk_tex_w*sk_atlas_scale,
						sk_tex_h*sk_atlas_scale,
						0
					);
				}
			}
			#endregion
			// return final structure
			ds_map_destroy(sk_db_atlas);
			// set page
			sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
			return sk_atlas;
        }
    }
	ds_map_destroy(sk_db_atlas);
}
return undefined;

#define sk_atlas_create_libgdx
/// @desc loads an atlas file
/// @param filepath
/// @param sprite
/// @param subimg
/// @param scale
return sk_atlas_create_libgdx_context(__sk_file_read_all(argument0),argument1,argument2,argument3);

#define sk_atlas_create_libgdx_context
/// @desc loads an atlas file
/// @param libgdx
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sk_sp_atlas = file_text_open_from_string(string(argument0));
// search for header
while(file_text_read_string(sk_sp_atlas)!=""){
	if(file_text_eof(sk_sp_atlas)){
		// header not found
		file_text_close(sk_sp_atlas);
		return undefined;
	}
	file_text_readln(sk_sp_atlas);
}
// get image name
var sk_sp_name = "";
do{	// while the current line is not a statement, move to the next line
	file_text_readln(sk_sp_atlas);
	if(file_text_eof(sk_sp_atlas)){
		// name not found
		file_text_close(sk_sp_atlas);
		return undefined;
	}
	sk_sp_name = file_text_read_string(sk_sp_atlas);
}until(string_count(":",sk_sp_name)<1)
// get max atlas size
var sk_sp_size = "";
var sk_sp_texture_width = 0;
var sk_sp_texture_height = 0;
do{ // while the current line is a statement, move to the next line
	file_text_readln(sk_sp_atlas);
	if(file_text_eof(sk_sp_atlas)){
		// name not found
		file_text_close(sk_sp_atlas);
		return undefined;
	}
	sk_sp_size = file_text_read_string(sk_sp_atlas);
	if(string_count(":",sk_sp_size)>0){
		var sk_sp_delimiter = string_pos(":",sk_sp_size);
		if(string_replace_all(string_copy(sk_sp_size,0,sk_sp_delimiter)," ","")=="size:"){
			var sk_sp_size_vector = string_replace_all(string_copy(sk_sp_size,sk_sp_delimiter+1,string_length(sk_sp_size)-sk_sp_delimiter)," ","");
			if(string_count(",",sk_sp_size)>0){
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_size_vector);
				sk_sp_texture_width = real(string_copy(sk_sp_size_vector,0,sk_sp_vector_delimiter-1));
				sk_sp_texture_height = real(string_copy(sk_sp_size_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_size_vector)-sk_sp_vector_delimiter));
			} else { // uniform size
				sk_sp_texture_width = real(sk_sp_size_vector);
				sk_sp_texture_height = sk_sp_texture_width;
			}
			break;
		}
	}
}until(false)
if((sk_sp_texture_width<1)||(sk_sp_texture_height<1)){
	// size is invalid
	file_text_close(sk_sp_atlas);
	return undefined;
}
// build atlas
var sk_atlas = sk_atlas_create();
// add regions
var sk_current_exists = false;
var sk_current_name = "";
var sk_current_x = 0;
var sk_current_y = 0;
var sk_current_w = 0;
var sk_current_h = 0;
var sk_current_xframe = 0;
var sk_current_yframe = 0;
var sk_current_wframe = 0;
var sk_current_hframe = 0;
var sk_current_rotation = 0;
do{
	file_text_readln(sk_sp_atlas);
	var sk_sp_data = file_text_read_string(sk_sp_atlas);
	if(file_text_eof(sk_sp_atlas)||(sk_sp_data=="")||(string_count(":",sk_sp_data)<1)){
		// current line is a statement, apply current attributes to current region and add it to the atlas
		if(sk_current_exists){
			var sk_tex_dx = (sk_current_rotation>45) ? sk_current_h : sk_current_w;
			var sk_tex_dy = (sk_current_rotation>45) ? sk_current_w : sk_current_h;
			sk_atlas_add_region(
				sk_atlas,
				sk_current_name,
				sk_current_x/sk_sp_texture_width,
				sk_current_y/sk_sp_texture_height,
				(sk_current_x+sk_tex_dx)/sk_sp_texture_width,
				(sk_current_y+sk_tex_dy)/sk_sp_texture_height,
				(sk_current_xframe+sk_current_wframe*0.5)*sk_atlas_scale,
				(sk_current_yframe+sk_current_hframe*0.5)*sk_atlas_scale,
				sk_current_w*sk_atlas_scale,
				sk_current_h*sk_atlas_scale,
				sk_current_rotation
			);
			// reset attributes for next round
			sk_current_x = 0;
			sk_current_y = 0;
			sk_current_w = 0;
			sk_current_h = 0;
			sk_current_xframe = 0;
			sk_current_yframe = 0;
			sk_current_wframe = 0;
			sk_current_hframe = 0;
			sk_current_rotation = 0;
		} else {
			// set initialisation flag for first cycle
			sk_current_exists = true;
		}
		if(file_text_eof(sk_sp_atlas)||(sk_sp_data=="")){
			// end reached
			file_text_close(sk_sp_atlas);
			break;
		} else {
			// set the next region's name
			sk_current_name = string(sk_sp_data);
		}
	} else {
		// current line is a assignment, set the current attribute for future use
		var sk_sp_delimiter = string_pos(":",sk_sp_data);
		var sk_sp_data_vector = string_replace_all(string_copy(sk_sp_data,sk_sp_delimiter+1,string_length(sk_sp_data)-sk_sp_delimiter)," ","");
		switch(string_replace_all(string_copy(sk_sp_data,0,sk_sp_delimiter)," ","")){
			case "rotate:":
				sk_current_rotation = (sk_sp_data_vector=="true") ? 90 : 0;
				//show_message(sk_sp_data_vector+" -> "+string(sk_sp_data_vector=="true"));
			break;
			case "xy:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_x = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_y = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
			case "size:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_w = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_h = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
			case "orig:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_wframe = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_hframe = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
			case "offset:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_xframe = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_yframe = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
		}
	}
}until(false)
// set page
sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
return sk_atlas;

#define sk_atlas_create_scon
/// @desc loads an atlas file
/// @param filepath
/// @param sprite
/// @param subimg
/// @param scale
return sk_atlas_create_scon_context(__sk_file_read_all(argument0),argument1,argument2,argument3);

#define sk_atlas_create_scon_context
/// @desc loads an atlas file
/// @param json
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sk_sp_atlas = json_decode(argument0);
if(ds_exists(sk_sp_atlas,ds_type_map)){
	var sk_sp_atlas_frames = sk_sp_atlas[? "frames"];
	var sk_sp_atlas_metaData = sk_sp_atlas[? "meta"];
	if(
		is_real(sk_sp_atlas_frames)&&ds_exists(sk_sp_atlas_frames,ds_type_list)&&(!ds_list_empty(sk_sp_atlas_frames))&&
		is_real(sk_sp_atlas_metaData)&&ds_exists(sk_sp_atlas_metaData,ds_type_map)
	){
		var sk_sp_texture_scale = sk_sp_atlas_metaData[? "scale"];
		var sk_sp_texture_size = sk_sp_atlas_metaData[? "size"];
		if(is_real(sk_sp_texture_size)&&ds_exists(sk_sp_texture_size,ds_type_map)){
			var sk_sp_texture_width = sk_sp_texture_size[? "w"];
			var sk_sp_texture_height = sk_sp_texture_size[? "h"];
			if(is_real(sk_sp_texture_width)&&(sk_sp_texture_width>0)&&is_real(sk_sp_texture_height)&&(sk_sp_texture_height>0)){
				// build final structure
				var sk_atlas = sk_atlas_create();
				#region // transfer atlas texture data to new structure
				var sk_sp_subtex_count = ds_list_size(sk_sp_atlas_frames); var sk_sp_subtex_id;
				for(sk_sp_subtex_id = 0; sk_sp_subtex_id < sk_sp_subtex_count; sk_sp_subtex_id++){
					var sk_sp_subtex_record = sk_sp_atlas_frames[| sk_sp_subtex_id];
					if(is_real(sk_sp_subtex_record)&&ds_exists(sk_sp_subtex_record,ds_type_map)){
						var sk_tex_path = string(sk_sp_subtex_record[? "filename"]);
						var sk_tex_rotate = sk_sp_subtex_record[? "rotated"]=="true";
						var sk_tex_x = 0;
						var sk_tex_y = 0;
						var sk_tex_w = 0;
						var sk_tex_h = 0;
						var sk_tex_dxframe = 0;
						var sk_tex_dyframe = 0;
						var sk_tex_wframe = 0;
						var sk_tex_hframe = 0;
						// get frame data
						var sk_sp_subtex_frameData = sk_sp_subtex_record[? "frame"];
						if(is_real(sk_sp_subtex_frameData)&&ds_exists(sk_sp_subtex_frameData,ds_type_map)){
							sk_tex_x = real(sk_sp_subtex_frameData[? "x"]); // defaults to '0' if not real
							sk_tex_y = real(sk_sp_subtex_frameData[? "y"]);
							sk_tex_w = real(sk_sp_subtex_frameData[? "w"]);
							sk_tex_h = real(sk_sp_subtex_frameData[? "h"]);
						}
						// get source offset
						var sk_sp_subtex_sourceSpriteSize = sk_sp_subtex_record[? "spriteSourceSize"];
						if(is_real(sk_sp_subtex_sourceSpriteSize)&&ds_exists(sk_sp_subtex_sourceSpriteSize,ds_type_map)){
							sk_tex_dxframe = -real(sk_sp_subtex_sourceSpriteSize[? "x"]);
							sk_tex_dyframe = -real(sk_sp_subtex_sourceSpriteSize[? "y"]);
						}
						// get source size
						var sk_sp_subtex_sourceSize = sk_sp_subtex_record[? "sourceSize"];
						if(is_real(sk_sp_subtex_sourceSize)&&ds_exists(sk_sp_subtex_sourceSize,ds_type_map)){
							sk_tex_wframe = real(sk_sp_subtex_sourceSize[? "w"]);
							sk_tex_hframe = real(sk_sp_subtex_sourceSize[? "h"]);
						}
						// insert
						var sk_tex_dx = sk_tex_rotate ? sk_tex_h : sk_tex_w;
						var sk_tex_dy = sk_tex_rotate ? sk_tex_w : sk_tex_h;
						sk_atlas_add_region(
							sk_atlas,
							sk_tex_path,
							sk_tex_x/sk_sp_texture_width,
							sk_tex_y/sk_sp_texture_height,
							(sk_tex_x+sk_tex_dx)/sk_sp_texture_width,
							(sk_tex_y+sk_tex_dy)/sk_sp_texture_height,
							(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
							(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
							sk_tex_w*sk_atlas_scale,
							sk_tex_h*sk_atlas_scale,
							sk_tex_rotate*-90 /* rotate the UVs 90 degrees clockwise */
						);
					}
				}
				#endregion
				// return final structure
				ds_map_destroy(sk_sp_atlas);
				// set page
				sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
				return sk_atlas;
			}
		}
	}
	ds_map_destroy(sk_sp_atlas);
}
return undefined;

#define sk_atlas_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc destroys
/// @param atlas
sk_object_destroy(argument0);

#define sk_atlas_draw_debug
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc draws the atlas and its regions
///		| NOTE: if you are using a texture which has been cropped or is not a power of two, then it will be incorrectly represented...
///		|		this does not mean that your UVs are incorrect, it just means that what is displayed is inaccurate.
/// @param atlas
/// @param x
/// @param y
/// @param w
/// @param h
/// @param debugArgs
var sk_atlas_subtextures = argument0[sk_data_atlas.subtextures];
var sk_atlas_texture = argument0[sk_data_atlas.texturePage];
var sk_x1 = argument1;
var sk_y1 = argument2;
var sk_x2 = sk_x1+argument3;
var sk_y2 = sk_y1+argument4;
if(argument5&SK_ATLAS_DEBUG_TEXTURE){
	// draw texture
	draw_primitive_begin_texture(pr_trianglestrip,sk_atlas_texture);
	draw_vertex_texture_colour(sk_x1,sk_y1,0,0,c_white,1);
	draw_vertex_texture_colour(sk_x1,sk_y2,0,1,c_white,1);
	draw_vertex_texture_colour(sk_x2,sk_y1,1,0,c_white,1);
	draw_vertex_texture_colour(sk_x2,sk_y2,1,1,c_white,1);
	draw_primitive_end();
}
// draw regions
var sk_region_count = ds_map_size(sk_atlas_subtextures);
var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
repeat(sk_region_count){
	var sk_region = sk_atlas_subtextures[? sk_region_key];
	// get positions
	var ULX = lerp(sk_x1,sk_x2,sk_region[0]);
	var ULY = lerp(sk_y1,sk_y2,sk_region[1]);
	var URX = lerp(sk_x1,sk_x2,sk_region[2]);
	var URY = lerp(sk_y1,sk_y2,sk_region[3]);
	var BLX = lerp(sk_x1,sk_x2,sk_region[4]);
	var BLY = lerp(sk_y1,sk_y2,sk_region[5]);
	var BRX = lerp(sk_x1,sk_x2,sk_region[6]);
	var BRY = lerp(sk_y1,sk_y2,sk_region[7]);
	// get origin
	var OX = lerp(ULX,BRX,sk_region[8]/max(sk_region[10],1));
	var OY = lerp(ULY,BRY,sk_region[9]/max(sk_region[11],1));
	// draw polygon
	draw_primitive_begin(pr_linelist);
	if(argument5&SK_ATLAS_DEBUG_REGIONS){
		draw_vertex_colour(BLX,BLY,c_blue,1); // left
		draw_vertex_colour(ULX,ULY,c_blue,1);
		draw_vertex_colour(ULX,ULY,c_yellow,1); // top
		draw_vertex_colour(URX,URY,c_yellow,1);
		draw_vertex_colour(BRX,BRY,c_blue,1); // right
		draw_vertex_colour(URX,URY,c_blue,1);
		draw_vertex_colour(BLX,BLY,c_blue,1); // bottom
		draw_vertex_colour(BRX,BRY,c_blue,1);
	}
	if(argument5&SK_ATLAS_DEBUG_ORIGINS){
		draw_vertex_colour(ULX,ULY,c_green,1); // origin
		draw_vertex_colour(OX,OY,c_green,1);
	}
	draw_primitive_end();
	if(argument5&SK_ATLAS_DEBUG_KEYS){
		draw_text(OX,OY,sk_region_key);
	}
	sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
}

#define sk_atlas_exists
/// @desc exists
/// @param variable
return(sk_object_exists(argument0,SK_TYPE_ATLAS));

#define sk_atlas_get_region
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc returns the region array
/// @param atlas
/// @param key
return ds_map_find_value(argument0[sk_data_atlas.subtextures],argument1);

#define sk_atlas_get_texture
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc returns a property
/// @param atlas
return argument0[sk_data_atlas.texturePage];

#define sk_atlas_set_page
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc sets a property
/// @param atlas
/// @param sprite
/// @param subimg
var sk_sprite = argument1;
var sk_subimg = argument2;
if(sprite_exists(sk_sprite)){
	// correct dimensions of uv coordinates beyond the texture atlas dimensions
	// this allows texture pages to be stored and cropped without having to be a power of two format
	var sk_w = sprite_get_width(sk_sprite);
	var sk_h = sprite_get_height(sk_sprite);
	var sk_uvs = sprite_get_uvs(sk_sprite,sk_subimg);
	var sk_uv_u = sk_uvs[0];
	var sk_uv_v = sk_uvs[1];
	var sk_uv_u2 = sk_uvs[2];
	var sk_uv_v2 = sk_uvs[3];
	var sk_uv_dx = sk_uvs[4]; // number of pixels trimmed from the left
	var sk_uv_dy = sk_uvs[5]; // number of pixels trimmed from the top
	var sk_uv_a = sk_uvs[6]; // ratio of discarded pixels horizontally
	var sk_uv_b = sk_uvs[7]; // ratio of discarded pixels vertically
	var sk_uv_width = (sk_uv_u2-sk_uv_u)/sk_uv_a;
	var sk_uv_height = (sk_uv_v2-sk_uv_v)/sk_uv_b;
	var sk_uv_kw = sk_uv_width/sk_w;
	var sk_uv_kh = sk_uv_height/sk_h;
	// set data
	argument0[@ sk_data_atlas.texturePage] = sprite_get_texture(sk_sprite,sk_subimg);
	argument0[@ sk_data_atlas.UVLeft] = sk_uv_u-sk_uv_dx*sk_uv_kw;
	argument0[@ sk_data_atlas.UVTop] = sk_uv_v-sk_uv_dy*sk_uv_kh;
	argument0[@ sk_data_atlas.UVRight] = argument0[sk_data_atlas.UVLeft]+sk_uv_width;
	argument0[@ sk_data_atlas.UVBottom] = argument0[sk_data_atlas.UVTop]+sk_uv_height;
}else{
	argument0[@ sk_data_atlas.texturePage] = -1;
	argument0[@ sk_data_atlas.UVLeft] = 0;
	argument0[@ sk_data_atlas.UVTop] = 0;
	argument0[@ sk_data_atlas.UVRight] = 1;
	argument0[@ sk_data_atlas.UVBottom] = 1;
}

#define sk_attachment_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_exists(argument0);
/// @desc destroy
/// @param variable
sk_object_destroy(argument0);

#define sk_attachment_exists
gml_pragma("forceinline");
/// @desc exists
/// @param variable
return sk_object_exists(argument0,undefined,SK_INTERFACE_ATTACHMENT);

#define sk_attachment_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_attachment_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_ATTACHMENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_attachment_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	var sk_key = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_ATTACHMENT_KEYFRAME_KEY];
	var sk_attachment = ds_map_find_value(sk_target[sk_data_slot.availableAttachments],sk_key);
	// apply
	switch(sk_mixPose){
		case SK_MIX_BLEND: case SK_MIX_ADD:
			sk_target[@ sk_data_slot.appliedAttachment] = sk_attachment;
		break;
		case SK_MIX_OVERWRITE:
			sk_target[@ sk_data_slot.setupAttachmentKey] = sk_key;
			sk_target[@ sk_data_slot.setupAttachment] = sk_attachment;
		break;
	}
}

#define sk_attachment_timeline_create
/// @desc create
/// @param [slot]
var sk_obj = sk_object_create(SK_TYPE_ATTACHMENT_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_attachment_timeline_set_slot(sk_obj,argument[0]);
return sk_obj;

#define sk_attachment_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_attachment_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_ATTACHMENT_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_attachment_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_attachment_timeline.keyframes]);

#define sk_attachment_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_attachment_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_ATTACHMENT_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_ATTACHMENT_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_ATTACHMENT_KEYFRAME_TIME]);
}

#define sk_attachment_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_attachment_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_ATTACHMENT_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_ATTACHMENT_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_ATTACHMENT_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_ATTACHMENT_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_ATTACHMENT_KEYFRAME_KEY] = argument1[| sk_frame_id+SK_ATTACHMENT_KEYFRAME_KEY];
}

#define sk_attachment_timeline_set_slot
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param slot
argument0[@ sk_data_attachment_timeline.target] = sk_slot_exists(argument1) ? argument1 : undefined;

#define sk_attachment_vertex_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
/// @param vbuff
/// @param bone
/// @param colour
/// @param alpha
script_execute(argument0[1,0],argument0,argument1,argument2,argument3,argument4);

#define sk_bone_cache
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc sort bones in hierarchy
/// @param bone
/// @param id
var sk_bone_id = ds_list_find_index(argument1,argument0);
if(sk_bone_id==-1){
	// sort parent
	var sk_parent = argument0[sk_data_bone.parent];
	if(sk_parent!=undefined){
		sk_bone_cache(sk_parent,argument1);
	}
	// add self
	ds_list_add(argument1,argument0);
}

#define sk_bone_create
/// @desc create
/// @param name
/// @param [parent]
/// @param [length]
var sk_obj = sk_object_create(SK_TYPE_BONE,SK_INTERFACE_UPDATABLE);
sk_bone_set_name(sk_obj,argument[0]);
if(argument_count>1) then sk_bone_set_parent(sk_obj,argument[1]);
if(argument_count>2) then sk_bone_set_length(sk_obj,argument[2]);
return sk_obj;

#define sk_bone_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc destroy
/// @param bone
sk_object_destroy(argument0);

#define sk_bone_draw_debug
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc renders an abstract structure representing the bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_bone = argument0;
var sk_draw_x = argument1;
var sk_draw_y = argument2;
var sk_draw_xscale = argument3;
var sk_draw_yscale = argument4;
var sk_draw_rot = argument5;
var sk_draw_sine = (sk_draw_rot==0) ? 0 : dsin(sk_draw_rot);
var sk_draw_cosine = (sk_draw_rot==0) ? 1 : dcos(sk_draw_rot);
// transform by global scale
var sk_bone_xlocal = sk_bone[sk_data_bone.worldX]*sk_draw_xscale;
var sk_bone_ylocal = sk_bone[sk_data_bone.worldY]*sk_draw_yscale;
var sk_bone_m00 = sk_bone[sk_data_bone.m00]*sk_draw_xscale; // x component of x
var sk_bone_m01 = sk_bone[sk_data_bone.m01]*sk_draw_yscale; // y component of x
var sk_bone_m10 = sk_bone[sk_data_bone.m10]*sk_draw_xscale; // x component of y
var sk_bone_m11 = sk_bone[sk_data_bone.m11]*sk_draw_yscale; // y component of y
// transform by global rotation
var sk_bone_xworld = sk_draw_x+sk_bone_xlocal*sk_draw_cosine+sk_bone_ylocal*sk_draw_sine;
var sk_bone_yworld = sk_draw_y-sk_bone_xlocal*sk_draw_sine+sk_bone_ylocal*sk_draw_cosine;
var sk_bone_w00 = (sk_bone_m00*sk_draw_cosine)+(sk_bone_m01*sk_draw_sine);
var sk_bone_w01 = (sk_bone_m00*-sk_draw_sine)+(sk_bone_m01*sk_draw_cosine);
var sk_bone_w10 = (sk_bone_m10*sk_draw_cosine)+(sk_bone_m11*sk_draw_sine);
var sk_bone_w11 = (sk_bone_m10*-sk_draw_sine)+(sk_bone_m11*sk_draw_cosine);
// start primitive
draw_primitive_begin(pr_linelist);
var V_COLOUR = c_black;
var V_ALPHA = 1;
if(argument6&SK_BONE_DEBUG_BONES){
	V_COLOUR = $00ff00;
	var sk_bone_len = max(sk_bone[sk_data_bone.length],1);
	var sk_bone_width = max(sk_bone_len,5)*0.05;
	// draw a bone in its familiar shape
	var sk_bone_xlen = sk_bone_xworld+sk_bone_w00*sk_bone_len;
	var sk_bone_ylen = sk_bone_yworld+sk_bone_w01*sk_bone_len;
	if(argument6&SK_BONE_DEBUG_SIMPLE){
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xlen,sk_bone_ylen,V_COLOUR,V_ALPHA);
	} else {
		var sk_bone_xpositive = sk_bone_xworld+sk_bone_w00*sk_bone_len*0.2+sk_bone_w10*sk_bone_width;
		var sk_bone_ypositive = sk_bone_yworld+sk_bone_w01*sk_bone_len*0.2+sk_bone_w11*sk_bone_width;
		var sk_bone_xnegative = sk_bone_xworld+sk_bone_w00*sk_bone_len*0.2-sk_bone_w10*sk_bone_width;
		var sk_bone_ynegative = sk_bone_yworld+sk_bone_w01*sk_bone_len*0.2-sk_bone_w11*sk_bone_width;
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xpositive,sk_bone_ypositive,V_COLOUR,V_ALPHA); // #1
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xnegative,sk_bone_ynegative,V_COLOUR,V_ALPHA); // #2
		draw_vertex_colour(sk_bone_xpositive,sk_bone_ypositive,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xlen,sk_bone_ylen,V_COLOUR,V_ALPHA); // #3
		draw_vertex_colour(sk_bone_xnegative,sk_bone_ynegative,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xlen,sk_bone_ylen,V_COLOUR,V_ALPHA); // #4
	}
}
if(argument6&SK_BONE_DEBUG_INHERITANCE){
	V_COLOUR = $ff00ff;
	var sk_parentData = sk_bone[sk_data_bone.parent];
	if(sk_parentData!=undefined){
		// get parent bone transforms
		var sk_parent_xlocal = sk_parentData[sk_data_bone.worldX]*sk_draw_xscale;
		var sk_parent_ylocal = sk_parentData[sk_data_bone.worldY]*sk_draw_yscale;
		var sk_parent_m00 = sk_parentData[sk_data_bone.m00]*sk_draw_xscale; // x component of x
		var sk_parent_m01 = sk_parentData[sk_data_bone.m01]*sk_draw_yscale; // y component of x
	//	var sk_parent_m10 = sk_parentData[sk_data_bone.m10]*sk_draw_xscale; // x component of y // not required
	//	var sk_parent_m11 = sk_parentData[sk_data_bone.m11]*sk_draw_yscale; // y component of y
		// transform by global rotation
		var sk_parent_xworld = sk_draw_x+sk_parent_xlocal*sk_draw_cosine+sk_parent_ylocal*sk_draw_sine;
		var sk_parent_yworld = sk_draw_y-sk_parent_xlocal*sk_draw_sine+sk_parent_ylocal*sk_draw_cosine;
		var sk_parent_w00 = (sk_parent_m00*sk_draw_cosine)+(sk_parent_m01*sk_draw_sine);
		var sk_parent_w01 = (sk_parent_m00*-sk_draw_sine)+(sk_parent_m01*sk_draw_cosine);
	//	var sk_parent_w10 = (sk_parent_m10*sk_draw_cosine)+(sk_parent_m11*sk_draw_sine); // not required
	//	var sk_parent_w11 = (sk_parent_m10*-sk_draw_sine)+(sk_parent_m11*sk_draw_cosine);
		var sk_parent_length = max(sk_parentData[sk_data_bone.length],1);
		draw_vertex_colour(sk_parent_xworld+sk_parent_w00*sk_parent_length,sk_parent_yworld+sk_parent_w01*sk_parent_length,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
	}
}
V_COLOUR = $ffffff;
var sk_bone_len = max(sk_bone[sk_data_bone.length],1);
var sk_bone_xtext = sk_bone_xworld+sk_bone_w00*sk_bone_len*0.5;
var sk_bone_ytext = sk_bone_yworld+sk_bone_w01*sk_bone_len*0.5;
if(argument6&SK_BONE_DEBUG_NAMES){	
	draw_text(sk_bone_xtext,sk_bone_ytext,sk_bone_get_name(sk_bone));
}
if(argument6&SK_BONE_DEBUG_BAD_TRANSFORMS){
	draw_text(sk_bone_xtext,sk_bone_ytext+10,sk_bone[sk_data_bone.invalidAppliedTransform]);
}
if(argument6&SK_BONE_DEBUG_VECTORS){
	var unit = max(sk_bone[sk_data_bone.length]*0.5,1);
	V_COLOUR = $0000ff;
	draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
	draw_vertex_colour(sk_bone_xworld+sk_bone_w00*unit,sk_bone_yworld+sk_bone_w01*unit,V_COLOUR,V_ALPHA);
	V_COLOUR = $ff0000;
	draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
	draw_vertex_colour(sk_bone_xworld+sk_bone_w10*unit,sk_bone_yworld+sk_bone_w11*unit,V_COLOUR,V_ALPHA);
}
draw_primitive_end();

#define sk_bone_exists
/// @desc exists
/// @param bone
return sk_object_exists(argument0,SK_TYPE_BONE,SK_INTERFACE_UPDATABLE);

#define sk_bone_get_length
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return argument0[sk_data_bone.length];

#define sk_bone_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return argument0[sk_data_bone.name];

#define sk_bone_get_rotation
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return -darctan2(argument0[sk_data_bone.m01],argument0[sk_data_bone.m00]);

#define sk_bone_get_shear
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return -darctan2(argument0[sk_data_bone.m11],argument0[sk_data_bone.m10]);

#define sk_bone_get_x
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return argument0[sk_data_bone.worldX];

#define sk_bone_get_xscale
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return point_distance(0,0,argument0[sk_data_bone.m00],argument0[sk_data_bone.m01]);

#define sk_bone_get_y
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return argument0[sk_data_bone.worldY];

#define sk_bone_get_yscale
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param bone
return point_distance(0,0,argument0[sk_data_bone.m10],argument0[sk_data_bone.m11]);

#define sk_bone_ik
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param alpha
var sk_bone = argument0;
var sk_parent = sk_bone[sk_data_bone.parent];
// confirm applied state
if(sk_bone[sk_data_bone.invalidAppliedTransform]){
	sk_bone_update_applied(sk_bone);
}
// get bone data
var sk_bone_ax = sk_bone[sk_data_bone.appliedX];
var sk_bone_ay = sk_bone[sk_data_bone.appliedY];
var sk_bone_axscale = sk_bone[sk_data_bone.appliedXScale];
var sk_bone_axshear = sk_bone[sk_data_bone.appliedXShear];
var sk_bone_arotation = sk_bone[sk_data_bone.appliedRotation];
// calculate the parent's inverse rotation matrix
var sk_parent_m00 = sk_parent[sk_data_bone.m00];
var sk_parent_m01 = sk_parent[sk_data_bone.m01];
var sk_parent_m10 = sk_parent[sk_data_bone.m10];
var sk_parent_m11 = sk_parent[sk_data_bone.m11];
var sk_determinant = sk_parent_m00*sk_parent_m11 - sk_parent_m01*sk_parent_m10;
if(abs(sk_determinant)<0.001){
	// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
	return;
}
sk_determinant = 1/sk_determinant;
var sk_im00 = sk_parent_m11*sk_determinant;
var sk_im01 = -sk_parent_m01*sk_determinant;
var sk_im10 = -sk_parent_m10*sk_determinant;
var sk_im11 = sk_parent_m00*sk_determinant;
var sk_xx = argument1-sk_parent[sk_data_bone.worldX];
var sk_yy = argument2-sk_parent[sk_data_bone.worldY];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_bone_ax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_bone_ay;
// use local position to set new rotation
var sk_rotationIK = -darctan2(sk_ty,sk_tx)-sk_bone_arotation-sk_bone_axshear;
if(sk_bone_axscale<0){ // make sure whatever the scale the bone points towards the effector
	sk_rotationIK += 180;
}
// update rotation and apply
sk_bone[@ sk_data_bone.appliedRotation] = sk_bone_arotation+sk_rotationIK*argument3;
sk_bone[@ sk_data_bone.appliedTransformMode] = SK_TRANSFORM_MODE_NORMAL;
sk_bone_update(sk_bone);

#define sk_bone_ik_chain
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param bendDir
/// @param alpha
var sk_child = argument0;
var sk_parent = sk_child[sk_data_bone.parent];
var sk_targetX = argument1;
var sk_targetY = argument2;
var sk_bendDir = argument3;
var sk_alpha = argument4;
// confirm applied state
if(sk_parent[sk_data_bone.invalidAppliedTransform]){
	sk_bone_update_applied(sk_parent);
}
if(sk_child[sk_data_bone.invalidAppliedTransform]){
	sk_bone_update_applied(sk_child);
}
// child local transforms
var sk_cax = sk_child[sk_data_bone.appliedX];
var sk_cay = sk_child[sk_data_bone.appliedY];
var sk_caxscale = sk_child[sk_data_bone.appliedXScale];
var sk_cayscale = sk_child[sk_data_bone.appliedYScale];
var sk_caxshear = sk_child[sk_data_bone.appliedXShear];
var sk_carotation = sk_child[sk_data_bone.appliedRotation]
// parent local transforms
var sk_pax = sk_parent[sk_data_bone.appliedX];
var sk_pay = sk_parent[sk_data_bone.appliedY];
var sk_paxscale = sk_parent[sk_data_bone.appliedXScale];
var sk_payscale = sk_parent[sk_data_bone.appliedYScale];
var sk_parotation = sk_parent[sk_data_bone.appliedRotation]+sk_parent[sk_data_bone.appliedXShear]
// normalise scales
if(sk_caxscale<0){
	sk_caxscale = -sk_caxscale;
	sk_cayscale = -sk_cayscale;
}
if(sk_paxscale<0){
	sk_paxscale = -sk_paxscale;
	sk_payscale = -sk_payscale;
}
var sk_flipscale = 1;
if(sk_payscale<0){
	sk_payscale = -sk_payscale;
	sk_flipscale = -1;
}
// get the parent's parent matrix
var sk_parentparent = sk_parent[sk_data_bone.parent];
var sk_pp_m00 = sk_parentparent[sk_data_bone.m00];
var sk_pp_m01 = sk_parentparent[sk_data_bone.m01];
var sk_pp_m10 = sk_parentparent[sk_data_bone.m10];
var sk_pp_m11 = sk_parentparent[sk_data_bone.m11];
// get parent bone's parent bone's inverse matrix
var sk_determinant = sk_pp_m00*sk_pp_m11 - sk_pp_m01*sk_pp_m10;
	sk_determinant = (sk_determinant==0) ? 0 : 1/sk_determinant; 
var sk_im00 = sk_pp_m11*sk_determinant;
var sk_im01 = -sk_pp_m01*sk_determinant;
var sk_im10 = -sk_pp_m10*sk_determinant;
var sk_im11 = sk_pp_m00*sk_determinant;
var sk_xx = sk_targetX - sk_parentparent[sk_data_bone.worldX];
var sk_yy = sk_targetY - sk_parentparent[sk_data_bone.worldY];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_pax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_pay;
var sk_dd = sk_tx*sk_tx+sk_ty*sk_ty;
var sk_dir = -darctan2(sk_ty,sk_tx);
// determine whether the parent bone is of uniform scale
var sk_clength = sk_child[sk_data_bone.length];
if((sk_paxscale-sk_payscale)==0){
	// uniform
	var sk_r1 = point_distance(0,0,sk_cax,sk_cay)*sk_paxscale;
	var sk_r2 = sk_clength*sk_caxscale*sk_paxscale;
	var sk_a2 = darccos(clamp((sk_dd-sk_r1*sk_r1-sk_r2*sk_r2)/max(2*sk_r1*sk_r2,0.0000001),-1,1))*-sk_bendDir;
	var sk_a1 = sk_dir-darctan2(sk_r2*dsin(sk_a2),sk_r1+sk_r2*dcos(sk_a2));
	// update applied transforms and apply
	var sk_offsetShear = -darctan2(sk_cay,sk_cax);
	var sk_rotationIK = angle_difference(sk_a1-sk_offsetShear,sk_parotation);
	sk_parent[@ sk_data_bone.appliedYScale] = sk_flipscale*sk_payscale;
	sk_parent[@ sk_data_bone.appliedXShear] = 0;
	sk_parent[@ sk_data_bone.appliedYShear] = 0;
	sk_parent[@ sk_data_bone.appliedRotation] = sk_parotation+sk_rotationIK*sk_alpha;
	sk_parent[@ sk_data_bone.appliedTransformMode] = SK_TRANSFORM_MODE_NORMAL;
	sk_bone_update(sk_parent);
	sk_rotationIK = sk_flipscale*sk_a2+sk_offsetShear-sk_carotation-sk_caxshear;
	sk_child[@ sk_data_bone.appliedRotation] = sk_carotation+sk_rotationIK*sk_alpha;
	sk_child[@ sk_data_bone.appliedTransformMode] = SK_TRANSFORM_MODE_NORMAL;
	sk_bone_update(sk_child);
} else {
	// non-uniform
	var sk_scale = sk_paxscale/max(sk_payscale,0.0000001);
	var sk_r1 = sk_parent[sk_data_bone.length]*sk_payscale;
	var sk_r2 = sk_clength*sk_caxscale*sk_payscale;
	// calculate quadratic roots of ellipse-circle intersection
	var sk_a = 1-sk_scale*sk_scale;
	var sk_b = 2*sk_scale*sk_r1;
	var sk_c = sk_scale*sk_scale*(sk_r1*sk_r1-sk_r2*sk_r2+sk_dd);
	var sk_discriminant = sk_b*sk_b-4*sk_a*sk_c;
	var sk_xroot = -(-sk_b+sqrt(max(0,sk_discriminant)))/(2*sk_a);
	var sk_yroot = -sk_bendDir*sqrt(max(0,sk_dd-sk_xroot*sk_xroot));
	var sk_a1 = -darctan2(sk_yroot,sk_xroot);
	// apply
	var sk_rotationIK = angle_difference(sk_dir+sk_a1,sk_parotation);
	sk_parent[@ sk_data_bone.appliedYScale] = sk_flipscale*sk_payscale;
	sk_parent[@ sk_data_bone.appliedXShear] = 0;
	sk_parent[@ sk_data_bone.appliedYShear] = 0;
	sk_parent[@ sk_data_bone.appliedRotation] = sk_parotation+sk_rotationIK*sk_alpha;
	sk_parent[@ sk_data_bone.appliedTransformMode] = SK_TRANSFORM_MODE_NORMAL;
	sk_bone_update(sk_parent);
	sk_child[@ sk_data_bone.appliedY] = 0;
	sk_bone_ik(sk_child,sk_targetX,sk_targetY,sk_alpha); // temp solution (a lot slower than setting it directly), but it works!
}

#define sk_bone_interpolate_absolute_local
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param target
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
if(sk_bone[sk_data_bone.invalidAppliedTransform]){
	sk_bone_update_applied(sk_bone);
}
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone[@ sk_data_bone.appliedX] = lerp(sk_bone[sk_data_bone.appliedX],sk_target[sk_data_bone.appliedX]+argument2,sk_translateMix);
	sk_bone[@ sk_data_bone.appliedY] = lerp(sk_bone[sk_data_bone.appliedY],sk_target[sk_data_bone.appliedY]+argument3,sk_translateMix);
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone[@ sk_data_bone.appliedXScale] = lerp(sk_bone[sk_data_bone.appliedXScale],sk_target[sk_data_bone.appliedXScale]+argument4,sk_scaleMix);
	sk_bone[@ sk_data_bone.appliedYScale] = lerp(sk_bone[sk_data_bone.appliedYScale],sk_target[sk_data_bone.appliedYScale]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone[@ sk_data_bone.appliedYShear] += -angle_difference(sk_bone[sk_data_bone.appliedYShear],sk_target[sk_data_bone.appliedYShear]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone[@ sk_data_bone.appliedRotation] += -angle_difference(sk_bone[sk_data_bone.appliedRotation],sk_target[sk_data_bone.appliedRotation]+argument7)*sk_rotationMix;
}
// apply
sk_bone_update(sk_bone);

#define sk_bone_interpolate_absolute_world
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param target
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
var sk_updated = false;
// determine whether the target bone has a negative scale
var sk_target_m00 = sk_target[sk_data_bone.m00];
var sk_target_m01 = sk_target[sk_data_bone.m01];
var sk_target_m10 = sk_target[sk_data_bone.m10];
var sk_target_m11 = sk_target[sk_data_bone.m11];
var sk_target_reflect = ((sk_target_m00*sk_target_m11 - sk_target_m01*sk_target_m10)<=0) ? 1 : -1;
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	var sk_targetX = sk_target[sk_data_bone.worldX]+sk_target_m00*argument2+sk_target_m10*argument3;
	var sk_targetY = sk_target[sk_data_bone.worldY]+sk_target_m01*argument2+sk_target_m11*argument3;
	sk_bone[@ sk_data_bone.worldX] = lerp(sk_bone[sk_data_bone.worldX],sk_targetX,sk_translateMix);
	sk_bone[@ sk_data_bone.worldY] = lerp(sk_bone[sk_data_bone.worldY],sk_targetY,sk_translateMix);
	sk_updated = true;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	var sk_a = sk_bone[sk_data_bone.m00];
	var sk_b = sk_bone[sk_data_bone.m01];
	var sk_c = sk_bone[sk_data_bone.m10];
	var sk_d = sk_bone[sk_data_bone.m11];
	var sk_xscale = point_distance(0,0,sk_a,sk_b);
	var sk_yscale = point_distance(0,0,sk_c,sk_d);
	if(sk_xscale>0.001){ sk_xscale = lerp(1,(point_distance(0,0,sk_target_m00,sk_target_m01)+argument4)/sk_xscale,sk_scaleMix); }
	if(sk_yscale>0.001){ sk_yscale = lerp(1,(point_distance(0,0,sk_target_m10,sk_target_m11)+argument5)/sk_yscale,sk_scaleMix); }	
	sk_bone[@ sk_data_bone.m00] = sk_a*sk_xscale;
	sk_bone[@ sk_data_bone.m01] = sk_b*sk_xscale;
	sk_bone[@ sk_data_bone.m10] = sk_c*sk_yscale;
	sk_bone[@ sk_data_bone.m11] = sk_d*sk_yscale;
	sk_updated = true;
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	var sk_a = sk_bone[sk_data_bone.m00];
	var sk_b = sk_bone[sk_data_bone.m01];
	var sk_c = sk_bone[sk_data_bone.m10];
	var sk_d = sk_bone[sk_data_bone.m11];
	var sk_ashear = -angle_difference(-darctan2(sk_target_m11,sk_target_m10),-darctan2(sk_target_m01,sk_target_m00));
	var sk_bshear = -angle_difference(-darctan2(sk_d,sk_c),-darctan2(sk_b,sk_a));
	var sk_deltaShear = (-angle_difference(sk_ashear,sk_bshear)+argument6*sk_target_reflect)*sk_shearMix;
	var sk_cosine = dcos(sk_deltaShear);
	var sk_sine = -dsin(sk_deltaShear);
	sk_bone[@ sk_data_bone.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ sk_data_bone.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	var sk_a = sk_bone[sk_data_bone.m00];
	var sk_b = sk_bone[sk_data_bone.m01];
	var sk_c = sk_bone[sk_data_bone.m10];
	var sk_d = sk_bone[sk_data_bone.m11];
	var sk_deltaRotation = (-angle_difference(-darctan2(sk_target_m01,sk_target_m00),-darctan2(sk_b,sk_a))+argument7*sk_target_reflect)*sk_rotationMix;
	var sk_cosine = dcos(sk_deltaRotation);
	var sk_sine = -dsin(sk_deltaRotation);
	sk_bone[@ sk_data_bone.m00] = sk_cosine*sk_a + sk_sine*sk_b;
	sk_bone[@ sk_data_bone.m01] = -sk_sine*sk_a + sk_cosine*sk_b;
	sk_bone[@ sk_data_bone.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ sk_data_bone.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set flag
if(sk_updated){
	sk_bone[@ sk_data_bone.invalidAppliedTransform] = true;
}

#define sk_bone_interpolate_relative_local
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param target
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
if(sk_bone[sk_data_bone.invalidAppliedTransform]){
	sk_bone_update_applied(sk_bone);
}
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone[@ sk_data_bone.appliedX] += (sk_target[sk_data_bone.appliedX]+argument2)*sk_translateMix;
	sk_bone[@ sk_data_bone.appliedY] += (sk_target[sk_data_bone.appliedY]+argument3)*sk_translateMix;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone[@ sk_data_bone.appliedXScale] *= lerp(1,sk_target[sk_data_bone.appliedXScale]+argument4,sk_scaleMix);
	sk_bone[@ sk_data_bone.appliedYScale] *= lerp(1,sk_target[sk_data_bone.appliedYScale]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone[@ sk_data_bone.appliedYShear] += (sk_target[sk_data_bone.appliedYShear]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone[@ sk_data_bone.appliedRotation] += (sk_target[sk_data_bone.appliedRotation]+argument7)*sk_rotationMix;
}
// apply
sk_bone_update(sk_bone);

#define sk_bone_interpolate_relative_world
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param target
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
var sk_updated = false;
// determine whether the target bone has a negative scale
var sk_target_m00 = sk_target[sk_data_bone.m00];
var sk_target_m01 = sk_target[sk_data_bone.m01];
var sk_target_m10 = sk_target[sk_data_bone.m10];
var sk_target_m11 = sk_target[sk_data_bone.m11];
var sk_target_reflect = ((sk_target_m00*sk_target_m11 - sk_target_m01*sk_target_m10)<=0) ? 1 : -1;
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	var sk_targetX = sk_target[sk_data_bone.worldX]+sk_target_m00*argument2+sk_target_m10*argument3;
	var sk_targetY = sk_target[sk_data_bone.worldY]+sk_target_m01*argument2+sk_target_m11*argument3;
	sk_bone[@ sk_data_bone.worldX] = sk_bone[sk_data_bone.worldX]+sk_targetX*sk_translateMix;
	sk_bone[@ sk_data_bone.worldY] = sk_bone[sk_data_bone.worldY]+sk_targetY*sk_translateMix;
	sk_updated = true;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	var sk_xscale = lerp(1,point_distance(0,0,sk_target_m00,sk_target_m01)+argument4,sk_scaleMix);
	var sk_yscale = lerp(1,point_distance(0,0,sk_target_m10,sk_target_m11)+argument5,sk_scaleMix);
	sk_bone[@ sk_data_bone.m00] = sk_bone[sk_data_bone.m00]*sk_xscale;
	sk_bone[@ sk_data_bone.m01] = sk_bone[sk_data_bone.m01]*sk_xscale;
	sk_bone[@ sk_data_bone.m10] = sk_bone[sk_data_bone.m10]*sk_yscale;
	sk_bone[@ sk_data_bone.m11] = sk_bone[sk_data_bone.m11]*sk_yscale;
	sk_updated = true;
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	var sk_deltaShear = (-angle_difference(-darctan2(sk_target_m11,sk_target_m10),-darctan2(sk_target_m01,sk_target_m00))-90+argument6*sk_target_reflect)*sk_shearMix;
	var sk_cosine = dcos(sk_deltaShear);
	var sk_sine = -dsin(sk_deltaShear);
	var sk_dx = sk_bone[sk_data_bone.m10];
	var sk_dy = sk_bone[sk_data_bone.m11];
	sk_bone[@ sk_data_bone.m10] = sk_cosine*sk_dx + sk_sine*sk_dy;
	sk_bone[@ sk_data_bone.m11] = -sk_sine*sk_dx + sk_cosine*sk_dy;
	sk_updated = true;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	var sk_deltaRotation = (-angle_difference(-darctan2(sk_target_m01,sk_target_m00),0)+argument7*sk_target_reflect)*sk_rotationMix;
	var sk_cosine = dcos(sk_deltaRotation);
	var sk_sine = -dsin(sk_deltaRotation);
	var sk_a = sk_bone[sk_data_bone.m00];
	var sk_b = sk_bone[sk_data_bone.m01];
	var sk_c = sk_bone[sk_data_bone.m10];
	var sk_d = sk_bone[sk_data_bone.m11];
	sk_bone[@ sk_data_bone.m00] = sk_cosine*sk_a + sk_sine*sk_b;
	sk_bone[@ sk_data_bone.m01] = -sk_sine*sk_a + sk_cosine*sk_b;
	sk_bone[@ sk_data_bone.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ sk_data_bone.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set flag
if(sk_updated){
	sk_bone[@ sk_data_bone.invalidAppliedTransform] = true;
}

#define sk_bone_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied bone
/// @param bone
array_copy(argument0,sk_data_bone.appliedX,argument0,sk_data_bone.setupX,sk_data_bone.appliedX-sk_data_bone.setupX);
argument0[@ sk_data_bone.invalidAppliedTransform] = false;

#define sk_bone_set_length
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc sets a property
/// @param bone
/// @param length
argument0[@ sk_data_bone.length] = max(real(argument1),1);

#define sk_bone_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc sets a property
/// @param bone
/// @param name
argument0[@ sk_data_bone.name] = string(argument1);

#define sk_bone_set_parent
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc sets a property
/// @param bone
/// @param parent
argument0[@ sk_data_bone.parent] = sk_bone_exists(argument1) ? argument1 : undefined;

#define sk_bone_set_pose
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc builds the setup data for this bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
argument0[@ sk_data_bone.setupX] = real(argument1);
argument0[@ sk_data_bone.setupY] = real(argument2);
argument0[@ sk_data_bone.setupXScale] = is_real(argument8) ? argument3 : 1;
argument0[@ sk_data_bone.setupYScale] = is_real(argument8) ? argument4 : 1;
argument0[@ sk_data_bone.setupXShear] = real(argument5);
argument0[@ sk_data_bone.setupYShear] = real(argument6);
argument0[@ sk_data_bone.setupRotation] = real(argument7);
argument0[@ sk_data_bone.setupTransformMode] = real(argument8);

#define sk_bone_set_pose_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc builds the applied data for this bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
argument0[@ sk_data_bone.appliedX] = real(argument1);
argument0[@ sk_data_bone.appliedY] = real(argument2);
argument0[@ sk_data_bone.appliedXScale] = is_real(argument8) ? argument3 : 1;
argument0[@ sk_data_bone.appliedYScale] = is_real(argument8) ? argument4 : 1;
argument0[@ sk_data_bone.appliedXShear] = real(argument5);
argument0[@ sk_data_bone.appliedYShear] = real(argument6);
argument0[@ sk_data_bone.appliedRotation] = real(argument7);
argument0[@ sk_data_bone.appliedTransformMode] = real(argument8);

#define sk_bone_transform_position
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc takes a 2d vector and transforms it
/// @param bone
/// @param x
/// @param y
return [
	argument1[sk_data_bone.worldX]+argument0[sk_data_bone.m00]*argument1+argument0[sk_data_bone.m10]*argument2,
	argument0[sk_data_bone.worldY]+argument0[sk_data_bone.m01]*argument1+argument0[sk_data_bone.m11]*argument2
];

#define sk_bone_transform_rotation
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc converts direction into a vector and transforms it
/// @param bone
/// @param angle
var sk_dr = argument1;
var sk_pa = argument0[sk_data_bone.m00];
var sk_pb = argument0[sk_data_bone.m01];
var sk_pc = argument0[sk_data_bone.m10];
var sk_pd = argument0[sk_data_bone.m11];
var sk_a = dcos(sk_dr);
var sk_b = -dsin(sk_dr);
return -darctan2((sk_pb*sk_a)+(sk_pd*sk_b),(sk_pa*sk_a)+(sk_pc*sk_b));

#define sk_bone_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc update world transform of supplied bone
/// @param bone
var sk_x = argument0[sk_data_bone.appliedX];
var sk_y = argument0[sk_data_bone.appliedY];
var sk_xscale = argument0[sk_data_bone.appliedXScale];
var sk_yscale = argument0[sk_data_bone.appliedYScale];
var sk_xshear = argument0[sk_data_bone.appliedXShear];
var sk_yshear = argument0[sk_data_bone.appliedYShear];
var sk_rotation = argument0[sk_data_bone.appliedRotation];
var sk_transform = argument0[sk_data_bone.appliedTransformMode];
// get parent data
var sk_parent = argument0[sk_data_bone.parent];
if(sk_parent!=undefined){
	// get parent matrix
	var sk_pa = sk_parent[sk_data_bone.m00];
	var sk_pb = sk_parent[sk_data_bone.m01];
	var sk_pc = sk_parent[sk_data_bone.m10];
	var sk_pd = sk_parent[sk_data_bone.m11];
	// calculate translation transforms
	if(sk_transform&SK_TRANSFORM_MODE_TRANSLATE){
		// inherit translation
		argument0[@ sk_data_bone.worldX] = sk_parent[sk_data_bone.worldX]+sk_pa*sk_x+sk_pc*sk_y;
		argument0[@ sk_data_bone.worldY] = sk_parent[sk_data_bone.worldY]+sk_pb*sk_x+sk_pd*sk_y;
	} else {
		// don't inherit translation
		argument0[@ sk_data_bone.worldX] = sk_x;
		argument0[@ sk_data_bone.worldY] = sk_y;
	}
	sk_transform &= ~SK_TRANSFORM_MODE_TRANSLATE; // disable translation in transform mode
	// correct skew transforms
	var sk_skew = sk_transform&SK_TRANSFORM_MODE_SKEW;
	if(!sk_skew){
		if(sk_transform&SK_TRANSFORM_MODE_SCALE){ // non skewing transforms (scales are multiplied)
			// multiply current applied scale by parent scale
			sk_transform &= ~SK_TRANSFORM_MODE_SCALE;
			sk_xscale *= point_distance(0,0,sk_pa,sk_pb);
			sk_yscale *= point_distance(0,0,sk_pc,sk_pd);
			if(sk_pa*sk_pd-sk_pb*sk_pc < 0){
				// (?)spriter compatibility(?)
				sk_yscale = -sk_yscale;
				sk_rotation = -sk_rotation;
			}
		}
	}
	sk_transform &= ~SK_TRANSFORM_MODE_SKEW; // disable skewing in transform mode
	// calculate matrix transforms
	switch(sk_transform){
		case SK_TRANSFORM_MODE_SCALE|SK_TRANSFORM_MODE_ROTATE:
			var sk_rotationX = sk_rotation+sk_xshear;
			var sk_rotationY = sk_rotation+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_data_bone.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
			argument0[@ sk_data_bone.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
			argument0[@ sk_data_bone.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
			argument0[@ sk_data_bone.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
		break;
		case SK_TRANSFORM_MODE_ROTATE:
			// same as normal, but cancel out scale
			var sk_rotation_final;
			if(sk_skew){
				var sk_cosine = dcos(sk_rotation);
				var sk_sine = -dsin(sk_rotation);
				sk_rotation_final = -darctan2( (sk_pb*sk_cosine)+(sk_pd*sk_sine), (sk_pa*sk_cosine)+(sk_pc*sk_sine) );
			} else {
				sk_rotation_final = sk_rotation-darctan2(sk_pb,sk_pa);
			}
			var sk_rotationX = sk_rotation_final+sk_xshear;
			var sk_rotationY = sk_rotation_final+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_data_bone.m00] = sk_a;
			argument0[@ sk_data_bone.m01] = sk_b;
			argument0[@ sk_data_bone.m10] = sk_c;
			argument0[@ sk_data_bone.m11] = sk_d;
		break;
		case SK_TRANSFORM_MODE_SCALE:
			// same as normal, but cancel out rotation
			var sk_parent_determinant = sk_pa*sk_pd - sk_pb*sk_pc;
			var sk_parent_rotation = -darctan2(sk_pb,sk_pa);
			var sk_rotationX = sk_rotation+sk_xshear-sk_parent_rotation;
			var sk_rotationY = sk_rotation+sk_yshear+90-sk_parent_rotation;
			if(sk_parent_determinant<0){
				sk_rotationX = -sk_rotationX;
				sk_rotationY = -sk_rotationY;
			}
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			argument0[@ sk_data_bone.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
			argument0[@ sk_data_bone.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
			argument0[@ sk_data_bone.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
			argument0[@ sk_data_bone.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
		break;
		case SK_TRANSFORM_MODE_NONE:
			// don't inherit anything; use applied transform
			var sk_rotationX = sk_rotation+sk_xshear;
			var sk_rotationY = sk_rotation+sk_yshear+90;
			var sk_a = dcos(sk_rotationX)*sk_xscale;
			var sk_b = -dsin(sk_rotationX)*sk_xscale;
			var sk_c = dcos(sk_rotationY)*-sk_yscale;
			var sk_d = -dsin(sk_rotationY)*-sk_yscale;
			// set global flip
			argument0[@ sk_data_bone.m00] = sk_a;
			argument0[@ sk_data_bone.m01] = sk_b;
			argument0[@ sk_data_bone.m10] = sk_c;
			argument0[@ sk_data_bone.m11] = sk_d;
		break;
	}
}else{
	// parent does not exist
	var sk_rotationX = sk_rotation+sk_xshear;
	var sk_rotationY = sk_rotation+sk_yshear+90;
	// set world matrix
	var sk_a = dcos(sk_rotationX)*sk_xscale;
	var sk_b = -dsin(sk_rotationX)*sk_xscale;
	var sk_c = dcos(sk_rotationY)*-sk_yscale;
	var sk_d = -dsin(sk_rotationY)*-sk_yscale;
	// set transforms
	argument0[@ sk_data_bone.m00] = sk_a;
	argument0[@ sk_data_bone.m01] = sk_b;
	argument0[@ sk_data_bone.m10] = sk_c;
	argument0[@ sk_data_bone.m11] = sk_d;
	argument0[@ sk_data_bone.worldX] = sk_x;
	argument0[@ sk_data_bone.worldY] = sk_y;
}
argument0[@ sk_data_bone.invalidAppliedTransform] = false;

#define sk_bone_update_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
var sk_mx = argument0[sk_data_bone.worldX];
var sk_my = argument0[sk_data_bone.worldY];
var sk_m00 = argument0[sk_data_bone.m00];
var sk_m01 = argument0[sk_data_bone.m01];
var sk_m10 = argument0[sk_data_bone.m10];
var sk_m11 = argument0[sk_data_bone.m11];
var sk_parent = argument0[sk_data_bone.parent];
if(sk_parent!=undefined){
	// calculate the parent's inverse rotation matrix
	var sk_parent_m00 = sk_parent[sk_data_bone.m00];
	var sk_parent_m01 = sk_parent[sk_data_bone.m01];
	var sk_parent_m10 = sk_parent[sk_data_bone.m10];
	var sk_parent_m11 = sk_parent[sk_data_bone.m11];
	var sk_determinant = sk_parent_m00*sk_parent_m11 - sk_parent_m01*sk_parent_m10;
	if(abs(sk_determinant)<0.001){
		// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
		return;
	}
	sk_determinant = 1/sk_determinant;
	var sk_im00 = sk_parent_m11*sk_determinant;
	var sk_im01 = -sk_parent_m01*sk_determinant;
	var sk_im10 = -sk_parent_m10*sk_determinant;
	var sk_im11 = sk_parent_m00*sk_determinant;
	// multiply inverse matrix by child matrix to get local transformation matrix
	var sk_xx = sk_mx-sk_parent[sk_data_bone.worldX];
	var sk_yy = sk_my-sk_parent[sk_data_bone.worldY];
	var sk_a = sk_m00; var sk_b = sk_m01;
	var sk_c = sk_m10; var sk_d = sk_m11;
	sk_mx = sk_im00*sk_xx+sk_im10*sk_yy;
	sk_my = sk_im01*sk_xx+sk_im11*sk_yy;
	sk_m00 = sk_im00*sk_a+sk_im10*sk_b;
	sk_m01 = sk_im01*sk_a+sk_im11*sk_b;
	sk_m10 = sk_im00*sk_c+sk_im10*sk_d;
	sk_m11 = sk_im01*sk_c+sk_im11*sk_d;
}
var sk_rotation = -darctan2(sk_m01,sk_m00);
sk_bone_set_pose_applied(
	argument0,
	sk_mx,
	sk_my,
	point_distance(0,0,sk_m00,sk_m01),
	point_distance(0,0,sk_m10,sk_m11),
	0,
	angle_difference(-darctan2(sk_m11,sk_m10),sk_rotation-90),
	sk_rotation,
	SK_TRANSFORM_MODE_NORMAL
);
// bad applied transform has been corrected
argument0[@ sk_data_bone.invalidAppliedTransform] = false;

#define sk_bone_update_other
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc update world transform of supplied bone relative to a supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[sk_data_bone.parent];
sk_bone_set_parent(argument0,argument1);
sk_bone_update(argument0);
argument0[@ sk_data_bone.parent] = sk_parent;
argument0[@ sk_data_bone.invalidAppliedTransform] = true;

#define sk_bone_update_other_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[sk_data_bone.parent];
sk_bone_set_parent(argument0,argument1);
sk_bone_update_applied(argument0);
argument0[@ sk_data_bone.parent] = sk_parent;
argument0[@ sk_data_bone.invalidAppliedTransform] = true;

#define sk_colour_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_colour_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_COLOUR_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_COLOUR_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_COLOUR_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_colour_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_COLOUR_KEYFRAME_EASE]);
var sk_colour_rgb = merge_colour(sk_keyframes[| sk_keyframeA_id+SK_COLOUR_KEYFRAME_COLOUR],sk_keyframes[| sk_keyframeB_id+SK_COLOUR_KEYFRAME_COLOUR],sk_interpolation);
var sk_colour_a = lerp(sk_keyframes[| sk_keyframeA_id+SK_COLOUR_KEYFRAME_ALPHA],sk_keyframes[| sk_keyframeB_id+SK_COLOUR_KEYFRAME_ALPHA],sk_interpolation);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND: case SK_MIX_ADD: 
		sk_target[@ sk_data_slot.appliedColour] = merge_colour(sk_target[sk_data_slot.appliedColour],sk_colour_rgb,sk_alpha);
		sk_target[@ sk_data_slot.appliedAlpha] = lerp(sk_target[sk_data_slot.appliedAlpha],sk_colour_a,sk_alpha);
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_slot.setupColour] = merge_colour(sk_target[sk_data_slot.setupColour],sk_colour_rgb,sk_alpha);
		sk_target[@ sk_data_slot.setupAlpha] = lerp(sk_target[sk_data_slot.setupAlpha],sk_colour_a,sk_alpha);
	break;
}

#define sk_colour_timeline_create
/// @desc create
/// @param [slot]
var sk_obj = sk_object_create(SK_TYPE_COLOUR_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_colour_timeline_set_slot(sk_obj,argument[0]);
return sk_obj;

#define sk_colour_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_colour_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_COLOUR_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_colour_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_colour_timeline.keyframes]);

#define sk_colour_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_colour_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_COLOUR_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_COLOUR_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_TIME]);
}

#define sk_colour_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_colour_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_COLOUR_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_COLOUR_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_COLOUR] = real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_COLOUR]);
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_ALPHA] = is_real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_ALPHA]) ? argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_ALPHA] : 1;
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_EASE]);
}

#define sk_colour_timeline_set_slot
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param slot
argument0[@ sk_data_colour_timeline.target] = sk_slot_exists(argument1) ? argument1 : undefined;

#define sk_drawOrder_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_drawOrder_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_DRAW_ORDER_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_DRAW_ORDER_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_DRAW_ORDER_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_drawOrder_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	var sk_tuple = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_DRAW_ORDER_KEYFRAME_TUPLE];
	if(sk_tuple==undefined) then return;
	// apply
	__sk_shift_value_list(sk_target,sk_tuple);
}

#define sk_drawOrder_timeline_create
/// @desc create
/// @param [armature]
var sk_obj = sk_object_create(SK_TYPE_DRAW_ORDER_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_drawOrder_timeline_set_target_armature(sk_obj,argument[0]);
return sk_obj;

#define sk_drawOrder_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_drawOrder_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_DRAW_ORDER_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_drawOrder_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_drawOrder_timeline.keyframes]);

#define sk_drawOrder_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_drawOrder_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_DRAW_ORDER_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_DRAW_ORDER_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TIME]);
}

#define sk_drawOrder_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_drawOrder_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_DRAW_ORDER_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_DRAW_ORDER_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_DRAW_ORDER_KEYFRAME_TIME]);
	var sk_tuple = argument1[| sk_frame_id+SK_DRAW_ORDER_KEYFRAME_TUPLE];
	if(is_real(sk_tuple)){
		var sk_target = ds_list_create();
		sk_keyframes[| sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TUPLE] = sk_target;
		ds_list_mark_as_list(sk_keyframes,sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TUPLE);
		var sk_tuple_last = ds_list_size(sk_tuple)-2;
		for(var sk_tuple_id = 0; sk_tuple_id<=sk_tuple_last; sk_tuple_id++){
			var sk_tuple_slot = sk_tuple[| sk_tuple_id+0];
			var sk_tuple_offset = sk_tuple[| sk_tuple_id+1];
			if(sk_slot_exists(sk_tuple_slot)){
				ds_list_add(
					sk_target,
					sk_tuple_slot,
					real(sk_tuple_offset)
				);
			}
		}
	}
}

#define sk_drawOrder_timeline_set_target
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param id
argument0[@ sk_data_drawOrder_timeline.target] = is_real(argument1) ? argument1 : undefined;

#define sk_drawOrder_timeline_set_target_armature
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param armature
argument0[@ sk_data_drawOrder_timeline.target] = sk_armature_exists(argument1) ? argument1[sk_data_armature.drawOrder] : undefined;

#define sk_ease
/// @desc applied an easing function
/// @param amount
/// @param ease
switch(argument1){
	case SK_EASE_NONE:
		return 0;
	break;
	case SK_EASE_LINEAR:
		return argument0;
	break;
	case SK_EASE_IN:
		return (argument0*argument0*(3-argument0)*0.5);
	break;
	case SK_EASE_OUT:
		var sk_r = clamp(argument0+1,1,2);
		return (sk_r*sk_r*(3-sk_r)*0.5)-1;
	break;
	case SK_EASE_SMOOTHSTEP:
		return (argument0*argument0*(3-2*argument0));
	break;
	case SK_EASE_SMOOTHSTEP_INV:
		return ((2*argument0)-(argument0*argument0*(3-2*argument0)));
	break;
	case SK_EASE_INSTANT:
		return 1;
	break;
}
return argument0;

#define sk_ease_function_from_bezier
/// @desc aproximates a bezier curve
/// @param x1
/// @param y1
/// @param x2
/// @param y2
var sk_x1 = clamp(argument0,0,1)+1; // clamping values between 0 and 1, then shifting up by 1 confirms all gradients are defined (no divide by zero or negative cases)
var sk_y1 = clamp(argument1,0,1)+1;
var sk_x2 = clamp(argument2,0,1)+1;
var sk_y2 = clamp(argument3,0,1)+1;
var sk_g1 = sk_x1/sk_y1;
var sk_g2 = sk_x2/sk_y2;
if(abs(sk_g1-1)<0.01){
	// either easing in, out, or the interpolation is linear
	if(abs(sk_g2-1)<0.01){
		return SK_EASE_LINEAR;
	}else if(sk_g2>1){
		return SK_EASE_IN;
	}else{
		return SK_EASE_OUT;
	}
} else if(sk_g1>1){
	// either smoothstep, or easing in
	if((abs(sk_g2-1)<0.01)||(sk_g2>1)){
		return SK_EASE_IN;
	}else{
		return SK_EASE_SMOOTHSTEP;
	}
} else {
	// either inverse smoothstep, or easing out
	if((abs(sk_g2-1)<0.01)||(sk_g2<1)){
		return SK_EASE_OUT;
	}else{
		return SK_EASE_SMOOTHSTEP_INV;
	}
}

#define sk_event_create
/// @desc create
/// @param name
/// @param [bone
/// @param string
/// @param real
/// @param int
/// @param sound]
var sk_obj = sk_object_create(SK_TYPE_EVENT);
sk_event_set_name(sk_obj,argument[0]);
if(argument_count>5) then sk_event_set_data(sk_obj,argument[1],argument[2],argument[3],argument[4],argument[5]);
return sk_obj;

#define sk_event_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc destroys
/// @param event
sk_object_destroy(argument0);

#define sk_event_exists
/// @desc exists
/// @param event
return(sk_object_exists(argument0,SK_TYPE_EVENT));

#define sk_event_get_bone
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param event
return argument0[sk_data_event.appliedBone];

#define sk_event_get_int
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param event
return argument0[sk_data_event.appliedInt];

#define sk_event_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param event
return argument0[sk_data_event.name];

#define sk_event_get_real
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param event
return argument0[sk_data_event.appliedReal];

#define sk_event_get_sound
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param event
return argument0[sk_data_event.appliedSound];

#define sk_event_get_string
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param event
return argument0[sk_data_event.appliedString];

#define sk_event_set_data
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc sets a property
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
argument0[@ sk_data_event.setupBone] = sk_bone_exists(argument1) ? argument1 : undefined;
argument0[@ sk_data_event.setupString] = string(argument2);
argument0[@ sk_data_event.setupReal] = real(argument3);
argument0[@ sk_data_event.setupInt] = int64(floor(argument4));
argument0[@ sk_data_event.setupSound] = (is_real(argument5)&&audio_exists(argument5)) ? argument5 : -1;

#define sk_event_set_data_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc sets a property
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
argument0[@ sk_data_event.appliedBone] = sk_bone_exists(argument1) ? argument1 : argument0[sk_data_event.setupBone];
argument0[@ sk_data_event.appliedString] = is_string(argument2) ? argument2 : argument0[sk_data_event.setupString];
argument0[@ sk_data_event.appliedReal] = is_real(argument3) ? argument3 : argument0[sk_data_event.setupReal];
argument0[@ sk_data_event.appliedInt] = (is_real(argument4)||is_int32(argument4)) ? argument4 : argument0[sk_data_event.setupInt];
argument0[@ sk_data_event.appliedSound] = (is_real(argument5)&&audio_exists(argument5)) ? argument5 : argument0[sk_data_event.setupSound];

#define sk_event_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc sets a property
/// @param event
/// @param name
argument0[@ sk_data_event.name] = string(argument1);

#define sk_event_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_event_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_event_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	if(sk_events!=undefined){
		var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_EVENT_KEYFRAME_ENTRIES;
		var sk_keyframe_id = sk_keyframePrevious_id;
		while(sk_keyframe_id!=sk_keyframeA_id){
			sk_keyframe_id += SK_EVENT_KEYFRAME_ENTRIES;
			if(sk_keyframe_id>sk_keyframe_last){
				sk_keyframe_id = 0;
			}
			var sk_bone = sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_BONE];
			var sk_string = sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_STRING];
			var sk_real = sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_REAL];
			var sk_int = sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_INT];
			var sk_sound = sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_SOUND];
			// apply
			switch(sk_mixPose){
				case SK_MIX_BLEND: case SK_MIX_ADD:
					sk_event_set_data_applied(sk_target,sk_bone,sk_string,sk_real,sk_int,sk_sound);
				break;
				case SK_MIX_OVERWRITE:
					sk_event_set_data(sk_target,sk_bone,sk_string,sk_real,sk_int,sk_sound);
				break;
			}
			ds_list_add(
				sk_events,[
					sk_target[sk_data_event.name],
					sk_target[sk_data_event.appliedBone],
					sk_target[sk_data_event.appliedString],
					sk_target[sk_data_event.appliedReal],
					sk_target[sk_data_event.appliedInt],
					sk_target[sk_data_event.appliedSound]
				]
			);
		}
	}
}

#define sk_event_timeline_create
/// @desc create
/// @param [event]
var sk_obj = sk_object_create(SK_TYPE_EVENT_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_event_timeline_set_event(sk_obj,argument[0]);
return sk_obj;

#define sk_event_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_event_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_EVENT_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_event_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_event_timeline.keyframes]);

#define sk_event_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_event_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_EVENT_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_EVENT_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_TIME]);
}

#define sk_event_timeline_set_event
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_event_timeline.target] = sk_event_exists(argument1) ? argument1 : undefined;

#define sk_event_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_event_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_EVENT_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_EVENT_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_EVENT_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_BONE] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_BONE];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_STRING] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_STRING];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_REAL] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_REAL];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_INT] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_INT];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_SOUND] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_SOUND];
}

#define sk_ik_constraint_cache
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sort constraint in hierarchy
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	// sort bones
	var sk_joint = argument0[sk_data_ik_constraint.joint];
	var sk_effector = argument0[sk_data_ik_constraint.effector];
	if(sk_joint!=undefined) then sk_bone_cache(sk_joint,argument1);
	if(sk_effector!=undefined) then sk_bone_cache(sk_effector,argument1);
	// add self
	ds_list_add(argument1,argument0);
}

#define sk_ik_constraint_create
/// @desc create
/// @param name
/// @param [joint
/// @param effector
/// @param chain]
var sk_obj = sk_object_create(SK_TYPE_IK_CONSTRAINT,SK_INTERFACE_UPDATABLE);
sk_ik_constraint_set_name(sk_obj,argument[0]);
if(argument_count>3) then sk_ik_constraint_set_bones(sk_obj,argument[1],argument[2],argument[3]);
return sk_obj;

#define sk_ik_constraint_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc destroy
/// @param constraint
sk_object_destroy(argument0);

#define sk_ik_constraint_exists
/// @desc exists
/// @param constraint
return sk_object_exists(argument0,SK_TYPE_IK_CONSTRAINT,SK_INTERFACE_UPDATABLE);

#define sk_ik_constraint_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param constraint
return argument0[sk_data_ik_constraint.name];

#define sk_ik_constraint_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied constraint
/// @param constraint
array_copy(argument0,sk_data_ik_constraint.appliedBendDir,argument0,sk_data_ik_constraint.setupBendDir,sk_data_ik_constraint.appliedBendDir-sk_data_ik_constraint.setupBendDir);

#define sk_ik_constraint_set_bones
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param joint
/// @param target
/// @param chain
argument0[@ sk_data_ik_constraint.joint] = sk_bone_exists(argument1) ? argument1 : undefined;
argument0[@ sk_data_ik_constraint.effector] = sk_bone_exists(argument2) ? argument2 : undefined;
argument0[@ sk_data_ik_constraint.chain] = bool(argument3);

#define sk_ik_constraint_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param name
argument0[@ sk_data_ik_constraint.name] = string(argument1);

#define sk_ik_constraint_set_pose
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ sk_data_ik_constraint.setupBendDir] = (argument1==SK_BEND_POSITIVE) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
argument0[@ sk_data_ik_constraint.setupWeight] = is_real(argument2) ? argument2 : 1;

#define sk_ik_constraint_set_pose_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ sk_data_ik_constraint.appliedBendDir] = (argument1==SK_BEND_POSITIVE) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
argument0[@ sk_data_ik_constraint.appliedWeight] = is_real(argument2) ? argument2 : 1;

#define sk_ik_constraint_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc applys IK between a bone and an end effector
/// @param constraint
var sk_alpha = argument0[sk_data_ik_constraint.appliedWeight];
if(sk_alpha<0.01) then return;
var sk_bone_effector = argument0[sk_data_ik_constraint.effector];
var sk_bone_joint = argument0[sk_data_ik_constraint.joint];
if((sk_bone_effector!=undefined)&&(sk_bone_joint!=undefined)){
	var sk_targetX = sk_bone_effector[sk_data_bone.worldX];
	var sk_targetY = sk_bone_effector[sk_data_bone.worldY];
	if(argument0[sk_data_ik_constraint.chain]){
		sk_bone_ik_chain(sk_bone_joint,sk_targetX,sk_targetY,argument0[sk_data_ik_constraint.appliedBendDir],sk_alpha);
	} else {
		sk_bone_ik(sk_bone_joint,sk_targetX,sk_targetY,sk_alpha);
	}
}

#define sk_ik_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_ik_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_ik_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_IK_KEYFRAME_EASE]);
var sk_bendDir = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_IK_KEYFRAME_BEND];
var sk_weight = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_IK_KEYFRAME_WEIGHT],
	sk_keyframes[| sk_keyframeB_id+SK_IK_KEYFRAME_WEIGHT],
	sk_interpolation
);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND: case SK_MIX_ADD:
		if(sk_alpha>0.5) then sk_target[@ sk_data_ik_constraint.appliedBendDir] = sk_bendDir;
		sk_target[@ sk_data_ik_constraint.appliedWeight] = lerp(sk_target[sk_data_ik_constraint.appliedWeight],sk_weight,sk_alpha);
	break;
	case SK_MIX_OVERWRITE:
		if(sk_alpha>0.5) then sk_target[@ sk_data_ik_constraint.setupBendDir] = sk_bendDir;
		sk_target[@ sk_data_ik_constraint.setupWeight] = lerp(sk_target[sk_data_ik_constraint.setupWeight],sk_weight,sk_alpha);
	break;
}

#define sk_ik_timeline_create
/// @desc create
/// @param [constraint]
var sk_obj = sk_object_create(SK_TYPE_IK_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_ik_timeline_set_constraint(sk_obj,argument[0]);
return sk_obj;

#define sk_ik_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_ik_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_IK_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_ik_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_ik_timeline.keyframes]);

#define sk_ik_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_ik_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_IK_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_IK_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_IK_KEYFRAME_TIME]);
}

#define sk_ik_timeline_set_constraint
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param constraint
argument0[@ sk_data_ik_timeline.target] = sk_ik_constraint_exists(argument1) ? argument1 : undefined;

#define sk_ik_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_ik_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_IK_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_IK_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_IK_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_IK_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_IK_KEYFRAME_BEND] = (argument1[| sk_frame_id+SK_IK_KEYFRAME_BEND]==SK_BEND_POSITIVE) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
	sk_keyframes[| sk_keyframe_id+SK_IK_KEYFRAME_WEIGHT] = is_real(argument1[| sk_frame_id+SK_IK_KEYFRAME_WEIGHT]) ? argument1[| sk_frame_id+SK_IK_KEYFRAME_WEIGHT] : 1;
	sk_keyframes[| sk_keyframe_id+SK_IK_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_IK_KEYFRAME_EASE]);
}

#define sk_interface_script_get_index
/// @desc returns the script id if it exists, otherwise defaults to __sk_empty_script
/// @param interface
/// @param function
var sk_script_path = "__sk_"+string(argument0)+"_"+string(argument1);
return asset_get_index((asset_get_type(sk_script_path)==asset_script) ? sk_script_path : "__sk_empty_script");

#define sk_object_create
gml_pragma("global",@'
	global.sk_object_activeObjects = ds_list_create();
	global.sk_object_objectData = ds_list_create();
');
/// @desc creates an object
/// @param type
/// @param [interface]
var sk_obj = [];
var sk_type = argument[0];
var sk_interface = (argument_count>1) ? argument[1] : undefined;
ds_list_add(global.sk_object_activeObjects,sk_obj);
ds_list_add(global.sk_object_objectData,[sk_type,sk_interface]);
script_execute(sk_type_script_get_index(sk_type,"init",true),sk_obj);
script_execute(sk_interface_script_get_index(sk_interface,"interface_implement"),sk_obj);
return sk_obj;

#define sk_object_destroy
/// @desc destroys an object
/// @param variable
script_execute(sk_type_script_get_index(sk_object_type(argument0),"dispose",true),argument0);
var sk_id = ds_list_find_index(global.sk_object_activeObjects,argument0);
ds_list_delete(global.sk_object_activeObjects,sk_id);
ds_list_delete(global.sk_object_objectData,sk_id);

#define sk_object_exists
/// @desc returns whether the value is an object
/// @param variable
/// @param [type]
/// @param [interface]
var sk_exists = false;
var sk_id = ds_list_find_index(global.sk_object_activeObjects,argument[0]);
if(sk_id!=-1){	
	sk_exists = true;
	if((argument_count>1)&&(argument[1]!=undefined)) then sk_exists = sk_exists&&(sk_object_type(argument[0])==argument[1]);
	if((argument_count>2)&&(argument[2]!=undefined)) then sk_exists = sk_exists&&(sk_object_interface(argument[0])==argument[2]);
}
return sk_exists;

#define sk_object_interface
/// @desc returns the interface of the object
/// @param variable
var sk_tuple = global.sk_object_objectData[| ds_list_find_index(global.sk_object_activeObjects,argument0)];
return sk_tuple[1];

#define sk_object_type
/// @desc returns the type of object
/// @param variable
var sk_tuple = global.sk_object_objectData[| ds_list_find_index(global.sk_object_activeObjects,argument0)];
return sk_tuple[0];

#define sk_parent_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_parent_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_PARENT_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_PARENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_PARENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_parent_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	var sk_bone = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_PARENT_KEYFRAME_BONE];
	// apply
	switch(sk_mixPose){
		case SK_MIX_BLEND: case SK_MIX_ADD:
			sk_target[@ sk_data_slot.appliedBone] = sk_bone;
		break;
		case SK_MIX_OVERWRITE:
			sk_target[@ sk_data_slot.setupBone] = sk_bone;
		break;
	}
}

#define sk_parent_timeline_create
/// @desc create
/// @param [slot]
var sk_obj = sk_object_create(SK_TYPE_PARENT_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_parent_timeline_set_slot(sk_obj,argument[0]);
return sk_obj;

#define sk_parent_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_parent_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_PARENT_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_parent_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_parent_timeline.keyframes]);

#define sk_parent_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_parent_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_PARENT_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_PARENT_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_PARENT_KEYFRAME_TIME]);
}

#define sk_parent_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_parent_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_PARENT_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_PARENT_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_PARENT_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_PARENT_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_PARENT_KEYFRAME_BONE] = sk_bone_exists(argument1[| sk_frame_id+SK_PARENT_KEYFRAME_BONE]) ? argument1[| sk_frame_id+SK_PARENT_KEYFRAME_BONE] : undefined;
}

#define sk_parent_timeline_set_slot
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param slot
argument0[@ sk_data_parent_timeline.target] = sk_slot_exists(argument1) ? argument1 : undefined;

#define sk_physics_constraint_cache
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	var sk_anchor = argument0[sk_data_physics_constraint.anchor];
	var sk_effector = argument0[sk_data_physics_constraint.effector];
	var sk_system = argument0[sk_data_physics_constraint.system];
	var sk_bone_count = ds_list_size(sk_system);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		sk_bone_cache(sk_system[| sk_bone_id],argument1);
	}
	// sort effectors
	if(sk_anchor!=undefined) then sk_bone_cache(sk_anchor,argument1);
	if(sk_effector!=undefined) then sk_bone_cache(sk_effector,argument1);
	// add self
	ds_list_add(argument1,argument0);
}

#define sk_physics_constraint_create
/// @desc create
/// @param name
/// @param [anchor
/// @param target]
var sk_obj = sk_object_create(SK_TYPE_PHYSICS_CONSTRAINT,SK_INTERFACE_UPDATABLE);
sk_physics_constraint_set_name(sk_obj,argument[0]);
if(argument_count>2) then sk_physics_constraint_set_bones(sk_obj,argument[1],argument[2]);
return sk_obj;

#define sk_physics_constraint_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc destroy
/// @param constraint
sk_object_destroy(argument0);

#define sk_physics_constraint_exists
/// @desc exists
/// @param constraint
return sk_object_exists(argument0,SK_TYPE_PHYSICS_CONSTRAINT,SK_INTERFACE_UPDATABLE);

#define sk_physics_constraint_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param constraint
return argument0[sk_data_physics_constraint.name];

#define sk_physics_constraint_get_system
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param constraint
/// @param id
ds_list_copy(argument1,argument0[sk_data_physics_constraint.system]);

#define sk_physics_constraint_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied constraint
/// @param constraint
array_copy(argument0,sk_data_physics_constraint.appliedXGravity,argument0,sk_data_physics_constraint.setupXGravity,sk_data_physics_constraint.appliedXGravity-sk_data_physics_constraint.setupXGravity);

#define sk_physics_constraint_set_bones
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param anchor
/// @param effector
argument0[@ sk_data_physics_constraint.anchor] = sk_bone_exists(argument1) ? argument1 : undefined;
argument0[@ sk_data_physics_constraint.effector] = sk_bone_exists(argument2) ? argument2 : undefined;

#define sk_physics_constraint_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param name
argument0[@ sk_data_physics_constraint.name] = string(argument1);

#define sk_physics_constraint_set_pose
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param dir
/// @param drive_amount
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ sk_data_physics_constraint.setupXGravity] = sk_magnitude*dcos(sk_direction);
argument0[@ sk_data_physics_constraint.setupXGravity] = -sk_magnitude*dsin(sk_direction);
argument0[@ sk_data_physics_constraint.setupDrive] = is_real(argument3) ? clamp(argument3,0,1) : 1;

#define sk_physics_constraint_set_pose_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param dir
/// @param drive_amount
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ sk_data_physics_constraint.appliedXGravity] = sk_magnitude*dcos(sk_direction);
argument0[@ sk_data_physics_constraint.appliedXGravity] = -sk_magnitude*dsin(sk_direction);
argument0[@ sk_data_physics_constraint.appliedDrive] = is_real(argument2) ? clamp(argument2,0,1) : 1;

#define sk_physics_constraint_set_rigid
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param enable
argument0[@ sk_data_physics_constraint.rigid] = bool(argument1);

#define sk_physics_constraint_set_system
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param id
var sk_system = argument0[sk_data_physics_constraint.system];
ds_list_clear(sk_system);
var sk_bone_count = ds_list_size(argument1);
for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
	var sk_bone = argument1[| sk_bone_id];
	if(sk_bone_exists(sk_bone)){
		ds_list_add(sk_system,sk_bone);
	}
}

#define sk_physics_constraint_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc apply
/// @param constraint
var sk_phys_state = global.sk_physics_environment_state;
// get data
var sk_phys_anchor = argument0[sk_data_physics_constraint.anchor];
var sk_phys_system = argument0[sk_data_physics_constraint.system];
var sk_phys_effector = argument0[sk_data_physics_constraint.effector];
var sk_phys_rigidBody = argument0[sk_data_physics_constraint.rigid];
var sk_phys_dx = global.sk_physics_environment_displacement_x;
var sk_phys_dy = global.sk_physics_environment_displacement_y;
var sk_phys_gx = argument0[sk_data_physics_constraint.appliedXGravity]+global.sk_physics_environment_gravity_x;
var sk_phys_gy = argument0[sk_data_physics_constraint.appliedYGravity]+global.sk_physics_environment_gravity_y;
var sk_phys_drive = argument0[sk_data_physics_constraint.appliedDrive]*global.sk_physics_environment_drive;
var sk_bone_count = ds_list_size(sk_phys_system);
if(sk_phys_anchor!=undefined){
	// constrain bones to effector
	if(sk_phys_effector!=undefined){
		var sk_phys_target_x = sk_phys_effector[sk_data_bone.worldX];
		var sk_phys_target_y = sk_phys_effector[sk_data_bone.worldY];
		var sk_phys_target_length = 0;
		for(var sk_bone_id = sk_bone_count-1; sk_bone_id >= 0; sk_bone_id--){
			var sk_bone = sk_phys_system[| sk_bone_id];
			// get current bone's physics state
			var sk_phys_state_id = ds_list_find_index(sk_phys_state,sk_bone);
			if(sk_phys_state_id==-1){
				sk_phys_state_id = ds_list_size(sk_phys_state);
				sk_phys_state[| sk_phys_state_id+0] = sk_bone;
				sk_phys_state[| sk_phys_state_id+1] = 0; // x
				sk_phys_state[| sk_phys_state_id+2] = 0; // y
				sk_phys_state[| sk_phys_state_id+3] = 0; // xprevious
				sk_phys_state[| sk_phys_state_id+4] = 0; // yprevious
			}
			// apply FABRIK inverse kinematics towards effector
			var sk_dx = sk_phys_state[| sk_phys_state_id+1]-sk_phys_target_x;
			var sk_dy = sk_phys_state[| sk_phys_state_id+2]-sk_phys_target_y;
			var sk_dd = max(point_distance(0,0,sk_dx,sk_dy),0.01);
			if(sk_phys_rigidBody||(sk_dd>sk_phys_target_length)){
				var sk_du = sk_phys_target_length/sk_dd;
				sk_dx *= sk_du; // constrain length
				sk_dy *= sk_du;
				sk_dd = sk_phys_target_length;
			}
			// set new target position
			sk_phys_target_x = sk_phys_target_x+sk_dx;
			sk_phys_target_y = sk_phys_target_y+sk_dy;
			sk_phys_state[| sk_phys_state_id+1] = sk_phys_target_x;
			sk_phys_state[| sk_phys_state_id+2] = sk_phys_target_y;
			// update joint length for next bone
			sk_phys_target_length = sk_bone[sk_data_bone.length]*abs(point_distance(0,0,sk_bone[sk_data_bone.m00],sk_bone[sk_data_bone.m01]));
		}
	}
	// constrain to anchor
	var sk_phys_pivot_x = sk_phys_anchor[sk_data_bone.worldX];
	var sk_phys_pivot_y = sk_phys_anchor[sk_data_bone.worldY];
	for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
		var sk_bone = sk_phys_system[| sk_bone_id];
		// get the current bones joint length
		var sk_bone_m00 = sk_bone[sk_data_bone.m00];
		var sk_bone_m01 = sk_bone[sk_data_bone.m01];
		var sk_bone_m10 = sk_bone[sk_data_bone.m10];
		var sk_bone_m11 = sk_bone[sk_data_bone.m11];
		var sk_bone_determinant = (sk_bone_m00*sk_bone_m11)-(sk_bone_m01*sk_bone_m10);
		var sk_bone_xsc = abs(point_distance(0,0,sk_bone_m00,sk_bone_m01));
		var sk_bone_ysc = abs(point_distance(0,0,sk_bone_m10,sk_bone_m11));
		var sk_bone_ysh = -angle_difference(-darctan2(sk_bone_m11,sk_bone_m10),-darctan2(sk_bone_m01,sk_bone_m00));
		if(sk_bone_determinant<0) then sk_bone_ysc = -sk_bone_ysc;
		var sk_phys_joint_length = sk_bone[sk_data_bone.length]*sk_bone_xsc;
		// get current bone's physics state
		var sk_phys_state_id = ds_list_find_index(sk_phys_state,sk_bone);
		if(sk_phys_state_id==-1){
			sk_phys_state_id = ds_list_size(sk_phys_state);
			sk_phys_state[| sk_phys_state_id+0] = sk_bone;
			sk_phys_state[| sk_phys_state_id+1] = 0; // x
			sk_phys_state[| sk_phys_state_id+2] = 0; // y
			sk_phys_state[| sk_phys_state_id+3] = 0; // xprevious
			sk_phys_state[| sk_phys_state_id+4] = 0; // yprevious
		}
		// apply VERLET integration to this state
		var sk_phys_x = sk_phys_state[| sk_phys_state_id+1];
		var sk_phys_y = sk_phys_state[| sk_phys_state_id+2];
		var sk_phys_vx = (sk_phys_x-sk_phys_dx-sk_phys_state[| sk_phys_state_id+3])*sk_phys_drive;
		var sk_phys_vy = (sk_phys_y-sk_phys_dy-sk_phys_state[| sk_phys_state_id+4])*sk_phys_drive;
		sk_phys_state[| sk_phys_state_id+3] = sk_phys_x;
		sk_phys_state[| sk_phys_state_id+4] = sk_phys_y;
		sk_phys_x += sk_phys_vx+sk_phys_gx;
		sk_phys_y += sk_phys_vy+sk_phys_gy;
		// apply FABRIK inverse kinematics towards pivot
		var sk_dx = sk_phys_x-sk_phys_pivot_x;
		var sk_dy = sk_phys_y-sk_phys_pivot_y;
		var sk_dd = max(point_distance(0,0,sk_dx,sk_dy),0.01);
		if(sk_phys_rigidBody||(sk_dd>sk_phys_joint_length)){
			var sk_du = sk_phys_joint_length/sk_dd;
			sk_dx *= sk_du; // constrain length
			sk_dy *= sk_du;
			sk_dd = sk_phys_joint_length;
		}
		// update bone transform
		sk_bone_xsc *= sk_dd/sk_phys_joint_length;
		var sk_bone_rot = -darctan2(sk_dy,sk_dx);
		var sk_bone_rot_y = sk_bone_rot+90;
		sk_bone[@ sk_data_bone.worldX] = sk_phys_pivot_x;
		sk_bone[@ sk_data_bone.worldY] = sk_phys_pivot_y;
		sk_bone[@ sk_data_bone.m00] = dcos(sk_bone_rot)*sk_bone_xsc;
		sk_bone[@ sk_data_bone.m01] = -dsin(sk_bone_rot)*sk_bone_xsc;
		sk_bone[@ sk_data_bone.m10] = dcos(sk_bone_rot_y)*sk_bone_ysc;
		sk_bone[@ sk_data_bone.m11] = -dsin(sk_bone_rot_y)*sk_bone_ysc;
		sk_bone[@ sk_data_bone.invalidAppliedTransform] = true;
		// set new pivot
		sk_phys_pivot_x += sk_dx;
		sk_phys_pivot_y += sk_dy;
		sk_phys_state[| sk_phys_state_id+1] = sk_phys_pivot_x;
		sk_phys_state[| sk_phys_state_id+2] = sk_phys_pivot_y;
	}
}

#define sk_physics_environment_activate
gml_pragma("global",@'
	global.sk_physics_environment_states = ds_map_create();
	sk_physics_environment_activate("default",0,0);
');
/// @desc sets the current physics state
/// @param id
/// @param dx
/// @param dy
var sk_state = global.sk_physics_environment_states[? argument0];
if(sk_state==undefined){
	sk_state = ds_list_create();
	ds_map_add_list(global.sk_physics_environment_states,argument0,sk_state);
}
global.sk_physics_environment_state = sk_state;
global.sk_physics_environment_displacement_x = real(argument1);
global.sk_physics_environment_displacement_y = real(argument2);

#define sk_physics_environment_free
/// @desc clears the physics state
/// @param id
var sk_state = global.sk_physics_environment_states[? argument0];
if(sk_state!=undefined){
	ds_list_destroy(sk_state);
	ds_map_delete(global.sk_physics_environment_states,argument0);
}

#define sk_physics_environment_set_drive
gml_pragma("global","sk_physics_environment_set_drive(1);");
/// @desc sets the current physics drive
/// @param amount
global.sk_physics_environment_drive = is_real(argument0) ? clamp(argument0,0,1) : 1;

#define sk_physics_environment_set_gravity
gml_pragma("global","sk_physics_environment_set_gravity(0,0);");
/// @desc sets the current physics gravity
/// @param gravity
/// @param direction
var sk_magnitude = real(argument0);
var sk_direction = real(argument1);
global.sk_physics_environment_gravity_x = sk_magnitude*dcos(sk_direction);
global.sk_physics_environment_gravity_y = -sk_magnitude*dsin(sk_direction);

#define sk_plane_attachment_create
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_create(SK_TYPE_PLANE_ATTACHMENT,SK_INTERFACE_ATTACHMENT);
sk_plane_attachment_set_name(sk_obj,argument[0]);
return sk_obj;

#define sk_plane_attachment_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc destroy
/// @param bone
sk_object_destroy(argument0);

#define sk_plane_attachment_exists
/// @desc exists
/// @param attachment
return sk_object_exists(argument0,SK_TYPE_PLANE_ATTACHMENT,SK_INTERFACE_ATTACHMENT);

#define sk_plane_attachment_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param attachment
return argument0[sk_data_plane_attachment.name];

#define sk_plane_attachment_set_atlas
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc extracts region data from the supplied texture atlas
/// @param attachment
/// @param atlas
argument0[@ sk_data_plane_attachment.regionData] = sk_atlas_get_region(argument1,argument0[sk_data_plane_attachment.regionKey]);

#define sk_plane_attachment_set_matrix
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
argument0[@ sk_data_plane_attachment.X] = real(argument1);
argument0[@ sk_data_plane_attachment.Y] = real(argument2);
var sk_xscale = is_real(argument3) ? argument3 : 1;
var sk_yscale = is_real(argument4) ? argument4 : 1;
var sk_rotation = real(argument7);
var sk_rotationX = sk_rotation+real(argument5);
var sk_rotationY = sk_rotation+real(argument6)+90;
argument0[@ sk_data_plane_attachment.m00] = dcos(sk_rotationX)*sk_xscale;
argument0[@ sk_data_plane_attachment.m01] = -dsin(sk_rotationX)*sk_xscale;
argument0[@ sk_data_plane_attachment.m10] = dcos(sk_rotationY)*-sk_yscale;
argument0[@ sk_data_plane_attachment.m11] = -dsin(sk_rotationY)*-sk_yscale;

#define sk_plane_attachment_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param name
argument0[@ sk_data_plane_attachment.name] = string(argument1);

#define sk_plane_attachment_set_regionKey
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param key
argument0[@ sk_data_plane_attachment.regionKey] = argument1;

#define sk_plane_attachment_vertex_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc adds the plane verticies to the supplied vbuffer
/// @param attachment
/// @param vbuff
/// @param bone
/// @param colour
/// @param alpha
var sk_region = argument0[sk_data_plane_attachment.regionData];
if(sk_region!=undefined){
	// obtain world transform by multiplying attachment matrix by bone matrix
	var sk_att_dx = argument0[sk_data_plane_attachment.X];
	var sk_att_dy = argument0[sk_data_plane_attachment.Y];
	var sk_att_m00 = argument0[sk_data_plane_attachment.m00]; // x component of x
	var sk_att_m01 = argument0[sk_data_plane_attachment.m01]; // y component of x
	var sk_att_m10 = argument0[sk_data_plane_attachment.m10]; // x component of y
	var sk_att_m11 = argument0[sk_data_plane_attachment.m11]; // y component of y
	var sk_bone_x = argument2[sk_data_bone.worldX];
	var sk_bone_y = argument2[sk_data_bone.worldY];
	var sk_bone_m00 = argument2[sk_data_bone.m00];
	var sk_bone_m01 = argument2[sk_data_bone.m01];
	var sk_bone_m10 = argument2[sk_data_bone.m10];
	var sk_bone_m11 = argument2[sk_data_bone.m11];
	var sk_world_x = sk_bone_x+sk_att_dx*sk_bone_m00+sk_att_dy*sk_bone_m10;
	var sk_world_y = sk_bone_y+sk_att_dx*sk_bone_m01+sk_att_dy*sk_bone_m11;
	var sk_world_m00 = (sk_att_m00*sk_bone_m00)+(sk_att_m01*sk_bone_m10);
	var sk_world_m01 = (sk_att_m00*sk_bone_m01)+(sk_att_m01*sk_bone_m11);
	var sk_world_m10 = (sk_att_m10*sk_bone_m00)+(sk_att_m11*sk_bone_m10);
	var sk_world_m11 = (sk_att_m10*sk_bone_m01)+(sk_att_m11*sk_bone_m11);
	// get region boundaries
	var sk_region_ULX = sk_region[0];
	var sk_region_ULY = sk_region[1];
	var sk_region_URX = sk_region[2];
	var sk_region_URY = sk_region[3];
	var sk_region_BLX = sk_region[4];
	var sk_region_BLY = sk_region[5];
	var sk_region_BRX = sk_region[6];
	var sk_region_BRY = sk_region[7];
	var sk_region_left = -sk_region[8];
	var sk_region_top = -sk_region[9];
	var sk_region_right = sk_region_left+sk_region[10];
	var sk_region_bottom = sk_region_top+sk_region[11];
	// get verts
	var sk_x1 = sk_world_x+sk_world_m00*sk_region_left+sk_world_m10*sk_region_top; // top left
	var sk_y1 = sk_world_y+sk_world_m01*sk_region_left+sk_world_m11*sk_region_top;
	var sk_x2 = sk_world_x+sk_world_m00*sk_region_right+sk_world_m10*sk_region_top; // top right
	var sk_y2 = sk_world_y+sk_world_m01*sk_region_right+sk_world_m11*sk_region_top;
	var sk_x3 = sk_world_x+sk_world_m00*sk_region_right+sk_world_m10*sk_region_bottom; // bottom right
	var sk_y3 = sk_world_y+sk_world_m01*sk_region_right+sk_world_m11*sk_region_bottom;
	var sk_x4 = sk_world_x+sk_world_m00*sk_region_left+sk_world_m10*sk_region_bottom; // bottom left
	var sk_y4 = sk_world_y+sk_world_m01*sk_region_left+sk_world_m11*sk_region_bottom;
	// add verticies to buffer
	vertex_position(argument1,sk_x1,sk_y1); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_ULX,sk_region_ULY);
	vertex_position(argument1,sk_x2,sk_y2); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_URX,sk_region_URY);
	vertex_position(argument1,sk_x4,sk_y4); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_BLX,sk_region_BLY);
	vertex_position(argument1,sk_x4,sk_y4); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_BLX,sk_region_BLY);
	vertex_position(argument1,sk_x2,sk_y2); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_URX,sk_region_URY);
	vertex_position(argument1,sk_x3,sk_y3); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_BRX,sk_region_BRY);
}

#define sk_point_attachment_create
/// @desc creates a new object and returns its reference
/// @param name
/// @param [x
/// @param y
/// @param rotation]
var sk_obj = sk_object_create(SK_TYPE_POINT_ATTACHMENT,SK_INTERFACE_ATTACHMENT);
sk_point_attachment_set_name(sk_obj,argument[0]);
if(argument_count>3) then sk_point_attachment_set_offsets(sk_obj,argument[1],argument[2],argument[3]);
return sk_obj;

#define sk_point_attachment_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc destroy
/// @param attachment
sk_object_destroy(argument0);

#define sk_point_attachment_exists
/// @desc exists
/// @param attachment
return sk_object_exists(argument0,SK_TYPE_POINT_ATTACHMENT,SK_INTERFACE_ATTACHMENT);

#define sk_point_attachment_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param attachment
return argument0[sk_data_point_attachment.name];

#define sk_point_attachment_get_rotation
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param attachment
return argument0[sk_data_point_attachment.worldRotation];

#define sk_point_attachment_get_x
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param attachment
return argument0[sk_data_point_attachment.worldX];

#define sk_point_attachment_get_y
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param attachment
return argument0[sk_data_point_attachment.worldY];

#define sk_point_attachment_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param name
argument0[@ sk_data_point_attachment.name] = string(argument1);

#define sk_point_attachment_set_offsets
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param x
/// @param y
/// @param rotation
argument0[@ sk_data_point_attachment.offsetX] = real(argument1);
argument0[@ sk_data_point_attachment.offsetY] = real(argument2);
argument0[@ sk_data_point_attachment.offsetRotation] = -angle_difference(0,real(argument3));

#define sk_point_attachment_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc wrapper for computing the point transform for this attachment
/// @param attachment
/// @param bone
var sk_pos = sk_bone_transform_position(
	argument1,
	argument0[sk_data_point_attachment.offsetX],
	argument0[sk_data_point_attachment.offsetY]
);
var sk_rotation = sk_bone_transform_rotation(
	argument1,
	argument0[sk_data_point_attachment.offsetRotation]
);
argument0[@ sk_data_point_attachment.worldX] = sk_pos[0];
argument0[@ sk_data_point_attachment.worldY] = sk_pos[1];
argument0[@ sk_data_point_attachment.worldRotation] = sk_rotation;

#define sk_point_attachment_vertex_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc wrapper for computing the point transform for this attachment
/// @param attachment
/// @param vbuff
/// @param bone
/// @param colour
/// @param alpha
var sk_vbuff = argument1;
var sk_colour = argument3;
var sk_alpha = argument4;
sk_point_attachment_update(argument0,argument2);

#define sk_renderable_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_renderable_exists(argument0);
/// @desc destroy
/// @param variable
sk_object_destroy(argument0);

#define sk_renderable_exists
gml_pragma("forceinline");
/// @desc exists
/// @param variable
return sk_object_exists(argument0,undefined,SK_INTERFACE_RENDERABLE);

#define sk_renderable_get_attachments
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_renderable_exists(argument0);
/// @desc calls an internal script
/// @param variable
/// @param id
script_execute(argument0[1,2],argument0,argument1);

#define sk_renderable_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_renderable_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
script_execute(argument0[1,0],argument0);

#define sk_renderable_set_attachments
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_renderable_exists(argument0);
/// @desc calls an internal script
/// @param variable
/// @param id
script_execute(argument0[1,3],argument0,argument1);

#define sk_renderable_vertex_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_renderable_exists(argument0);
/// @desc calls an internal script
/// @param variable
/// @param vbuff
script_execute(argument0[1,1],argument0,argument1);

#define sk_rotate_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_rotate_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_ROTATE_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_ROTATE_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_ROTATE_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_rotate_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_ROTATE_KEYFRAME_EASE]);
var sk_r = -angle_difference(0,sk_keyframes[| sk_keyframeA_id+SK_ROTATE_KEYFRAME_ANGLE]);
sk_r += sk_interpolation*(
	-angle_difference(sk_r,sk_keyframes[| sk_keyframeB_id+SK_ROTATE_KEYFRAME_ANGLE])
	+360*sk_keyframes[| sk_keyframeA_id+SK_ROTATE_KEYFRAME_CYCLES]
);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND:
		var sk_rotation = sk_target[sk_data_bone.appliedRotation];
		sk_target[@ sk_data_bone.appliedRotation] = sk_rotation-angle_difference(sk_rotation,sk_target[sk_data_bone.setupRotation]+sk_r)*sk_alpha;
	break;
	case SK_MIX_ADD: 
		sk_target[@ sk_data_bone.appliedRotation] += sk_r*sk_alpha;
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupRotation] += sk_r*sk_alpha;
	break;
}

#define sk_rotate_timeline_create
/// @desc create
/// @param [bone]
var sk_obj = sk_object_create(SK_TYPE_ROTATE_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_rotate_timeline_set_bone(sk_obj,argument[0]);
return sk_obj;

#define sk_rotate_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_rotate_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_ROTATE_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_rotate_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_rotate_timeline.keyframes]);

#define sk_rotate_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_rotate_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_ROTATE_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_ROTATE_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_ROTATE_KEYFRAME_TIME]);
}

#define sk_rotate_timeline_set_bone
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_rotate_timeline.target] = sk_bone_exists(argument1) ? argument1 : undefined;

#define sk_rotate_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_rotate_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_ROTATE_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_ROTATE_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_ROTATE_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_ROTATE_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_ROTATE_KEYFRAME_ANGLE] = real(argument1[| sk_frame_id+SK_ROTATE_KEYFRAME_ANGLE]);
	sk_keyframes[| sk_keyframe_id+SK_ROTATE_KEYFRAME_CYCLES] = real(argument1[| sk_frame_id+SK_ROTATE_KEYFRAME_CYCLES]);
	sk_keyframes[| sk_keyframe_id+SK_ROTATE_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_ROTATE_KEYFRAME_EASE]);
}

#define sk_scale_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_rotate_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_SCALE_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_SCALE_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_SCALE_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_rotate_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_SCALE_KEYFRAME_EASE]);
var sk_x = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SCALE_KEYFRAME_X],
	sk_keyframes[| sk_keyframeB_id+SK_SCALE_KEYFRAME_X],
	sk_interpolation
);
var sk_y = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SCALE_KEYFRAME_Y],
	sk_keyframes[| sk_keyframeB_id+SK_SCALE_KEYFRAME_Y],
	sk_interpolation
);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND:
		sk_target[@ sk_data_bone.appliedXScale] = lerp(sk_target[sk_data_bone.appliedXScale],sk_target[sk_data_bone.setupXScale]+sk_x,sk_alpha);
		sk_target[@ sk_data_bone.appliedYScale] = lerp(sk_target[sk_data_bone.appliedYScale],sk_target[sk_data_bone.setupYScale]+sk_y,sk_alpha);
	break;
	case SK_MIX_ADD:
		sk_target[@ sk_data_bone.appliedXScale] = sk_target[sk_data_bone.appliedXScale]*lerp(1,sk_x,sk_alpha);
		sk_target[@ sk_data_bone.appliedYScale] = sk_target[sk_data_bone.appliedYScale]*lerp(1,sk_y,sk_alpha);
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupXScale] = sk_target[sk_data_bone.setupXScale]*lerp(1,sk_x,sk_alpha);
		sk_target[@ sk_data_bone.setupYScale] = sk_target[sk_data_bone.setupYScale]*lerp(1,sk_y,sk_alpha);
	break;
}

#define sk_scale_timeline_create
/// @desc create
/// @param [bone]
var sk_obj = sk_object_create(SK_TYPE_SCALE_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_scale_timeline_set_bone(sk_obj,argument[0]);
return sk_obj;

#define sk_scale_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_scale_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_SCALE_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_scale_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_scale_timeline.keyframes]);

#define sk_scale_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_scale_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_SCALE_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_SCALE_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_SCALE_KEYFRAME_TIME]);
}

#define sk_scale_timeline_set_bone
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_scale_timeline.target] = sk_bone_exists(argument1) ? argument1 : undefined;

#define sk_scale_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_scale_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_scale_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_SCALE_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_SCALE_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_SCALE_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_SCALE_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_SCALE_KEYFRAME_X] = is_real(argument1[| sk_frame_id+SK_SCALE_KEYFRAME_X]) ? argument1[| sk_frame_id+SK_SCALE_KEYFRAME_X] : 1;
	sk_keyframes[| sk_keyframe_id+SK_SCALE_KEYFRAME_Y] = is_real(argument1[| sk_frame_id+SK_SCALE_KEYFRAME_Y]) ? argument1[| sk_frame_id+SK_SCALE_KEYFRAME_Y] : 1;
	sk_keyframes[| sk_keyframe_id+SK_SCALE_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_SCALE_KEYFRAME_EASE]);
}

#define sk_shear_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_shear_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_SHEAR_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_SHEAR_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_SHEAR_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_shear_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_SHEAR_KEYFRAME_EASE]);
var sk_x = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SHEAR_KEYFRAME_X],
	sk_keyframes[| sk_keyframeB_id+SK_SHEAR_KEYFRAME_X],
	sk_interpolation
);
var sk_y = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_SHEAR_KEYFRAME_Y],
	sk_keyframes[| sk_keyframeB_id+SK_SHEAR_KEYFRAME_Y],
	sk_interpolation
);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND:
		var sk_xshear = sk_target[sk_data_bone.appliedXShear];
		var sk_yshear = sk_target[sk_data_bone.appliedYShear];
		sk_target[@ sk_data_bone.appliedXShear] = sk_xshear-angle_difference(sk_xshear,sk_target[sk_data_bone.setupXShear]+sk_x)*sk_alpha;
		sk_target[@ sk_data_bone.appliedYShear] = sk_yshear-angle_difference(sk_yshear,sk_target[sk_data_bone.setupYShear]+sk_y)*sk_alpha;
	break;
	case SK_MIX_ADD: 
		sk_target[@ sk_data_bone.appliedXShear] = sk_target[sk_data_bone.appliedXShear]+sk_x*sk_alpha;
		sk_target[@ sk_data_bone.appliedYShear] = sk_target[sk_data_bone.appliedYShear]+sk_y*sk_alpha;
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupXShear] = sk_target[sk_data_bone.setupXShear]+sk_x*sk_alpha;
		sk_target[@ sk_data_bone.setupYShear] = sk_target[sk_data_bone.setupYShear]+sk_y*sk_alpha;
	break;
}

#define sk_shear_timeline_create
/// @desc create
/// @param [bone]
var sk_obj = sk_object_create(SK_TYPE_SHEAR_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_shear_timeline_set_bone(sk_obj,argument[0]);
return sk_obj;

#define sk_shear_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_shear_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_SHEAR_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_shear_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_shear_timeline.keyframes]);

#define sk_shear_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_shear_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_SHEAR_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_SHEAR_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_TIME]);
}

#define sk_shear_timeline_set_bone
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_shear_timeline.target] = sk_bone_exists(argument1) ? argument1 : undefined;

#define sk_shear_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_shear_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_SHEAR_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_SHEAR_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_X] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_X]);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_Y] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_Y]);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_EASE]);
}

#define sk_skin_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc Attachments from the new skin are attached to the corresponding slots in the form of a list known as the "displayData"
/// @param skin
/// @param clear
var sk_displays = argument0[sk_data_skin.displays];
var sk_display_last = ds_list_size(sk_displays);
var sk_display_id;
if(argument1){
	// clear previous slot attachments
	var sk_empty_map = ds_map_create();
	for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id++){
		var sk_display = sk_displays[| sk_display_id];
		sk_renderable_set_attachments(sk_display[0],sk_empty_map);
	}
	ds_map_destroy(sk_empty_map);
}
// add new attachments
var sk_attachment_map = ds_map_create();
for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id++){
	var sk_display = sk_displays[| sk_display_id];
	var sk_slot = sk_display[0];
	// add final attachment to slot
	sk_renderable_get_attachments(sk_slot,sk_attachment_map);
	sk_attachment_map[? sk_display[2]] = sk_display[1];
	sk_renderable_set_attachments(sk_slot,sk_attachment_map);
}
ds_map_destroy(sk_attachment_map);

#define sk_skin_create
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_create(SK_TYPE_SKIN);
sk_skin_set_name(sk_obj,argument0);
return sk_obj;

#define sk_skin_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc destroy
/// @param skin
sk_object_destroy(argument0);

#define sk_skin_exists
/// @desc exists
/// @param skin
return sk_object_exists(argument0,SK_TYPE_SKIN);

#define sk_skin_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param skin
return argument0[sk_data_skin.name];

#define sk_skin_record_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc append display data to the skin
/// @param skin
/// @param slot
/// @param attachment
/// @param key
if(sk_renderable_exists(argument1)){
	ds_list_add(argument0[sk_data_skin.displays],[
		argument1,
		sk_attachment_exists(argument2) ? argument2 : undefined,
		argument3
	]);
}

#define sk_skin_record_exists
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc determines whether the record exists
/// @param skin
/// @param slot
/// @param key
var sk_displays = argument0[sk_data_skin.displays];
var sk_display_count = ds_list_size(sk_displays);
for(var sk_display_id = 0; sk_display_id<sk_display_count; sk_display_id++){
	var sk_display = sk_displays[| sk_display_id];
	if((sk_display[0]==argument1)&&(sk_display[2]==argument2)){
		return true;
	}
}
return false;

#define sk_skin_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc sets a property
/// @param skin
/// @param name
argument0[@ sk_data_skin.name] = string(argument1);

#define sk_slot_attachment_get_key
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc returns whether the slot has the supplied attachment in its map
/// @param slot
/// @param attachment
var sk_availableAttachments = argument0[sk_data_slot.availableAttachments];
var sk_key = ds_map_find_first(sk_availableAttachments);
repeat(ds_map_size(sk_availableAttachments)){
	var sk_attachment = sk_availableAttachments[? sk_key];
	if(sk_attachment==argument1){
		return sk_key;
	}
	// next
	sk_key = ds_map_find_next(argument1,sk_key);
}
return undefined;

#define sk_slot_create
/// @desc create
/// @param name
var sk_obj = sk_object_create(SK_TYPE_SLOT,SK_INTERFACE_RENDERABLE);
sk_slot_set_name(sk_obj,argument[0]);
return sk_obj;

#define sk_slot_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc destroy
/// @param slot
sk_object_destroy(argument0);

#define sk_slot_exists
/// @desc exists
/// @param slot
return sk_object_exists(argument0,SK_TYPE_SLOT,SK_INTERFACE_RENDERABLE);

#define sk_slot_get_alpha
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param slot
return argument0[sk_data_slot.appliedAlpha];

#define sk_slot_get_attachment
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param slot
return argument0[sk_data_slot.appliedAttachment];

#define sk_slot_get_attachments
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc copies the availbale attacment map
/// @param slot
/// @param id
ds_map_copy(argument1,argument0[sk_data_slot.availableAttachments]);

#define sk_slot_get_bone
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param slot
return argument0[sk_data_slot.appliedBone];

#define sk_slot_get_colour
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param slot
return argument0[sk_data_slot.appliedColour];

#define sk_slot_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param slot
return argument0[sk_data_slot.name];

#define sk_slot_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc setup
/// @param slot
array_copy(argument0,sk_data_slot.appliedColour,argument0,sk_data_slot.setupColour,sk_data_slot.appliedColour-sk_data_slot.setupColour);

#define sk_slot_set_attachments
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc sets the availbale attacment map
/// @param slot
/// @param id
var sk_availableAttachments = argument0[sk_data_slot.availableAttachments];
ds_map_clear(sk_availableAttachments);
var sk_key = ds_map_find_first(argument1);
repeat(ds_map_size(argument1)){
	var sk_attachment = argument1[? sk_key];
	if(sk_attachment_exists(sk_attachment)){
		sk_availableAttachments[? sk_key] = sk_attachment;
	}
	// next
	sk_key = ds_map_find_next(argument1,sk_key);
}
argument0[@ sk_data_slot.setupAttachment] = ds_map_find_value(sk_availableAttachments,argument0[sk_data_slot.setupAttachmentKey]);

#define sk_slot_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc sets a property
/// @param slot
/// @param name
argument0[@ sk_data_slot.name] = string(argument1);

#define sk_slot_set_pose
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc sets a property
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment_or_key
argument0[@ sk_data_slot.setupColour] = real(argument1);
argument0[@ sk_data_slot.setupAlpha] = real(argument2);
argument0[@ sk_data_slot.setupBone] = sk_bone_exists(argument3) ? argument3 : undefined;
var sk_key = sk_attachment_exists(argument4) ? sk_slot_attachment_get_key(argument0,argument4) : argument4;
argument0[@ sk_data_slot.setupAttachmentKey] = sk_key;
argument0[@ sk_data_slot.setupAttachment] = ds_map_find_value(argument0[sk_data_slot.availableAttachments],sk_key);

#define sk_slot_set_pose_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc sets a property
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment_or_key
argument0[@ sk_data_slot.appliedColour] = real(argument1);
argument0[@ sk_data_slot.appliedAlpha] = real(argument2);
argument0[@ sk_data_slot.appliedBone] = sk_bone_exists(argument3) ? argument3 : undefined;
argument0[@ sk_data_slot.appliedAttachment] = ds_map_find_value(argument0[sk_data_slot.availableAttachments],sk_attachment_exists(argument4) ? sk_slot_attachment_get_key(argument0,argument4) : argument4);

#define sk_slot_vertex_add
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc applies the slot to the vertex buffer
/// @param slot
/// @param vbuff
var sk_bone = argument0[sk_data_slot.appliedBone];
var sk_attachment = argument0[sk_data_slot.appliedAttachment];
if((sk_bone!=undefined)&&(sk_attachment!=undefined)){
	sk_attachment_vertex_add(sk_attachment,argument1,sk_bone,argument0[sk_data_slot.appliedColour],argument0[sk_data_slot.appliedAlpha]);
}

#define sk_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
script_execute(argument0[1,1],argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define sk_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_timeline_exists(argument0);
/// @desc destroy
/// @param variable
sk_object_destroy(argument0);

#define sk_timeline_exists
gml_pragma("forceinline");
/// @desc exists
/// @param variable
return sk_object_exists(argument0,undefined,SK_INTERFACE_TIMELINE);

#define sk_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
/// @param id
script_execute(argument0[1,0],argument0,argument1);

#define sk_transformation_constraint_cache
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	var sk_target = argument0[sk_data_transformation_constraint.target];
	var sk_children = argument0[sk_data_transformation_constraint.children];
	if(sk_target!=undefined) then sk_bone_cache(sk_target,argument1);
	// sort child bones
	var sk_child_count = ds_list_size(sk_children);
	for(var sk_child_id = 0; sk_child_id<sk_child_count; sk_child_id++){
		sk_bone_cache(sk_children[| sk_child_id],argument1);
	}
	// add self
	ds_list_add(argument1,argument0);
}

#define sk_transformation_constraint_create
/// @desc create
/// @param name
/// @param [target]
var sk_obj = sk_object_create(SK_TYPE_TRANSFORMATION_CONSTRAINT,SK_INTERFACE_UPDATABLE);
sk_ik_constraint_set_name(sk_obj,argument[0]);
if(argument_count>1) then sk_transformation_constraint_set_target(sk_obj,argument[1]);
return sk_obj;

#define sk_transformation_constraint_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc destroy
/// @param constraint
sk_object_destroy(argument0);

#define sk_transformation_constraint_exists
/// @desc exists
/// @param constraint
return sk_object_exists(argument0,SK_TYPE_TRANSFORMATION_CONSTRAINT,SK_INTERFACE_UPDATABLE);

#define sk_transformation_constraint_get_children
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param constraint
/// @param id
ds_list_copy(argument1,argument0[sk_data_transformation_constraint.children]);

#define sk_transformation_constraint_get_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param constraint
return argument0[sk_data_transformation_constraint.name];

#define sk_transformation_constraint_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied constraint
/// @param constraint
array_copy(argument0,sk_data_transformation_constraint.appliedMixTranslate,argument0,sk_data_transformation_constraint.setupMixTranslate,sk_data_transformation_constraint.appliedMixTranslate-sk_data_transformation_constraint.setupMixTranslate);

#define sk_transformation_constraint_set_children
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param id
var sk_children = argument0[sk_data_transformation_constraint.children];
ds_list_clear(sk_children);
var sk_child_count = ds_list_size(argument1);
for(var sk_child_id = 0; sk_child_id<sk_child_count; sk_child_id++){
	var sk_child = argument1[| sk_child_id];
	if(sk_bone_exists(sk_child)){
		ds_list_add(sk_children,sk_child);
	}
}

#define sk_transformation_constraint_set_name
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param name
argument0[@ sk_data_transformation_constraint.name] = string(argument1);

#define sk_transformation_constraint_set_offsets
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param yshear
/// @param rotation
argument0[@ sk_data_transformation_constraint.offsetX] = real(argument1);
argument0[@ sk_data_transformation_constraint.offsetY] = real(argument2);
argument0[@ sk_data_transformation_constraint.offsetXScale] = is_real(argument3) ? argument3 : 1;
argument0[@ sk_data_transformation_constraint.offsetYScale] = is_real(argument4) ? argument4 : 1;
argument0[@ sk_data_transformation_constraint.offsetShear] = -angle_difference(0,real(argument5));
argument0[@ sk_data_transformation_constraint.offsetRotation] = -angle_difference(0,real(argument6));

#define sk_transformation_constraint_set_pose
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
argument0[@ sk_data_transformation_constraint.setupMixTranslate] = real(argument1);
argument0[@ sk_data_transformation_constraint.setupMixScale] = real(argument2);
argument0[@ sk_data_transformation_constraint.setupMixShear] = real(argument3);
argument0[@ sk_data_transformation_constraint.setupMixRotate] = real(argument4);

#define sk_transformation_constraint_set_pose_applied
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
argument0[@ sk_data_transformation_constraint.appliedMixTranslate] = real(argument1);
argument0[@ sk_data_transformation_constraint.appliedMixScale] = real(argument2);
argument0[@ sk_data_transformation_constraint.appliedMixShear] = real(argument3);
argument0[@ sk_data_transformation_constraint.appliedMixRotate] = real(argument4);

#define sk_transformation_constraint_set_state
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param local
/// @param relative
argument0[@ sk_data_transformation_constraint.state] = real(
	(real(bool(argument1))<<0)|
	(real(bool(argument2))<<1)
);

#define sk_transformation_constraint_set_target
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ sk_data_transformation_constraint.target] = sk_bone_exists(argument1) ? argument1 : undefined;

#define sk_transformation_constraint_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc applys transformations between a set of bones and a universal parent bone
/// @param constraint
var sk_boneTarget = argument0[sk_data_transformation_constraint.target];
if(sk_boneTarget==undefined) then return;
var sk_bones = argument0[sk_data_transformation_constraint.children];
var sk_xoffset = argument0[sk_data_transformation_constraint.offsetX];
var sk_yoffset = argument0[sk_data_transformation_constraint.offsetY];
var sk_xscaleoffset = argument0[sk_data_transformation_constraint.offsetXScale];
var sk_yscaleoffset = argument0[sk_data_transformation_constraint.offsetYScale];
var sk_yshearoffset = argument0[sk_data_transformation_constraint.offsetShear];
var sk_rotationoffset = argument0[sk_data_transformation_constraint.offsetRotation];
var sk_translateMix = argument0[sk_data_transformation_constraint.appliedMixTranslate];
var sk_scaleMix = argument0[sk_data_transformation_constraint.appliedMixScale];
var sk_shearMix = argument0[sk_data_transformation_constraint.appliedMixShear];
var sk_rotateMix = argument0[sk_data_transformation_constraint.appliedMixRotate];
var sk_bone_count = ds_list_size(sk_bones);
switch(argument0[sk_data_transformation_constraint.state]){
	case (0<<0)|(0<<1): // not local; not relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_absolute_world(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case (1<<0)|(0<<1): // local; not relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_absolute_local(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case (0<<0)|(1<<1): // not local; relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_relative_world(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case (1<<0)|(1<<1): // local; relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_relative_local(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
}

#define sk_transformation_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_transformation_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_TRANSFORMATION_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_TRANSFORMATION_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_TRANSFORMATION_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_transformation_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_EASE]);
var sk_translate = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE],sk_interpolation);
var sk_scale = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE],sk_interpolation);
var sk_shear = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR],sk_interpolation);
var sk_rotate = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE],sk_interpolation);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND: case SK_MIX_ADD:
		sk_target[@ sk_data_transformation_constraint.appliedMixTranslate] = lerp(sk_target[sk_data_transformation_constraint.appliedMixTranslate],sk_translate,sk_alpha);
		sk_target[@ sk_data_transformation_constraint.appliedMixScale] = lerp(sk_target[sk_data_transformation_constraint.appliedMixScale],sk_scale,sk_alpha);
		sk_target[@ sk_data_transformation_constraint.appliedMixShear] = lerp(sk_target[sk_data_transformation_constraint.appliedMixShear],sk_shear,sk_alpha);
		sk_target[@ sk_data_transformation_constraint.appliedMixRotate] = lerp(sk_target[sk_data_transformation_constraint.appliedMixRotate],sk_rotate,sk_alpha);
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_transformation_constraint.setupMixTranslate] = lerp(sk_target[sk_data_transformation_constraint.setupMixTranslate],sk_translate,sk_alpha);
		sk_target[@ sk_data_transformation_constraint.setupMixScale] = lerp(sk_target[sk_data_transformation_constraint.setupMixScale],sk_scale,sk_alpha);
		sk_target[@ sk_data_transformation_constraint.setupMixShear] = lerp(sk_target[sk_data_transformation_constraint.setupMixShear],sk_shear,sk_alpha);
		sk_target[@ sk_data_transformation_constraint.setupMixRotate] = lerp(sk_target[sk_data_transformation_constraint.setupMixRotate],sk_rotate,sk_alpha);
	break;
}

#define sk_transformation_timeline_create
/// @desc create
/// @param [constraint]
var sk_obj = sk_object_create(SK_TYPE_TRANSFORMATION_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_transformation_timeline_set_constraint(sk_obj,argument[0]);
return sk_obj;

#define sk_transformation_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_transformation_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_TRANSFORMATION_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_transformation_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_transformation_timeline.keyframes]);

#define sk_transformation_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_transformation_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TRANSFORMATION_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_TRANSFORMATION_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_TIME]);
}

#define sk_transformation_timeline_set_constraint
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_transformation_timeline.target] = sk_transformation_constraint_exists(argument1) ? argument1 : undefined;

#define sk_transformation_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_transformation_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_TRANSFORMATION_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_TRANSFORMATION_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_EASE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_EASE]) ?  argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_EASE] : 1;
}

#define sk_translate_timeline_apply
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_translate_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_TRANSLATE_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_TRANSLATE_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_TRANSLATE_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_translate_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_TRANSLATE_KEYFRAME_EASE]);
var sk_x = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_TRANSLATE_KEYFRAME_X],
	sk_keyframes[| sk_keyframeB_id+SK_TRANSLATE_KEYFRAME_X],
	sk_interpolation
);
var sk_y = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_TRANSLATE_KEYFRAME_Y],
	sk_keyframes[| sk_keyframeB_id+SK_TRANSLATE_KEYFRAME_Y],
	sk_interpolation
);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND:
		sk_target[@ sk_data_bone.appliedX] = lerp(sk_target[sk_data_bone.appliedX],sk_target[sk_data_bone.setupX]+sk_x,sk_alpha);
		sk_target[@ sk_data_bone.appliedY] = lerp(sk_target[sk_data_bone.appliedY],sk_target[sk_data_bone.setupY]+sk_y,sk_alpha);
	break;
	case SK_MIX_ADD:
		sk_target[@ sk_data_bone.appliedX] = sk_target[sk_data_bone.appliedX]+sk_x*sk_alpha;
		sk_target[@ sk_data_bone.appliedY] = sk_target[sk_data_bone.appliedY]+sk_y*sk_alpha;
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_bone.setupX] = sk_target[sk_data_bone.setupX]+sk_x*sk_alpha;
		sk_target[@ sk_data_bone.setupY] = sk_target[sk_data_bone.setupY]+sk_y*sk_alpha;
	break;
}

#define sk_translate_timeline_create
/// @desc create
/// @param [bone]
var sk_obj = sk_object_create(SK_TYPE_TRANSLATE_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_translate_timeline_set_bone(sk_obj,argument[0]);
return sk_obj;

#define sk_translate_timeline_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
/// @desc destroy
/// @param timeline
sk_object_destroy(argument0);

#define sk_translate_timeline_exists
/// @desc exists
/// @param timeline
return sk_object_exists(argument0,SK_TYPE_TRANSLATE_TIMELINE,SK_INTERFACE_TIMELINE);

#define sk_translate_timeline_get_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_translate_timeline.keyframes]);

#define sk_translate_timeline_get_times
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_translate_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TRANSLATE_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_TRANSLATE_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_TRANSLATE_KEYFRAME_TIME]);
}

#define sk_translate_timeline_set_bone
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_translate_timeline.target] = sk_bone_exists(argument1) ? argument1 : undefined;

#define sk_translate_timeline_set_keyframes
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_translate_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_TRANSLATE_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_TRANSLATE_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_TRANSLATE_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_TRANSLATE_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_TRANSLATE_KEYFRAME_X] = real(argument1[| sk_frame_id+SK_TRANSLATE_KEYFRAME_X]);
	sk_keyframes[| sk_keyframe_id+SK_TRANSLATE_KEYFRAME_Y] = real(argument1[| sk_frame_id+SK_TRANSLATE_KEYFRAME_Y]);
	sk_keyframes[| sk_keyframe_id+SK_TRANSLATE_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_TRANSLATE_KEYFRAME_EASE]);
}

#define sk_type_script_get_index
/// @desc returns the script id if it exists, otherwise defaults to __sk_empty_script
/// @param type
/// @param function
/// @param [private]
var sk_script_path = (((argument_count>2)&&argument[2]) ? "__" : "")+"sk_"+string(argument[0])+"_"+string(argument[1]);
return asset_get_index((asset_get_type(sk_script_path)==asset_script) ? sk_script_path : "__sk_empty_script");

#define sk_updatable_cache
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_updatable_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
/// @param id
script_execute(argument0[1,2],argument0,argument1);

#define sk_updatable_destroy
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_updatable_exists(argument0);
/// @desc destroy
/// @param variable
sk_object_destroy(argument0);

#define sk_updatable_exists
gml_pragma("forceinline");
/// @desc exists
/// @param variable
return sk_object_exists(argument0,undefined,SK_INTERFACE_UPDATABLE);

#define sk_updatable_setup
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_updatable_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
script_execute(argument0[1,0],argument0);

#define sk_updatable_update
__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_updatable_exists(argument0);
gml_pragma("forceinline");
/// @desc calls an internal script
/// @param variable
script_execute(argument0[1,1],argument0);

#define vertex_begin_sk
gml_pragma("global",@"
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	global.sk_renderable_vformat = vertex_format_end();
");
/// @desc variant of vertex begin which automatically fills the format
/// @param vbuff
vertex_begin(argument0,global.sk_renderable_vformat);

#define vertex_end_sk
/// @desc wrapper for vertex end
/// @param vbuff
vertex_end(argument0);

#define __sk_animationState_dispose
/// @desc dispose
/// @param variable
ds_map_destroy(argument0[sk_data_animationState.animations]);
ds_map_destroy(argument0[sk_data_animationState.mixTable]);
ds_list_destroy(argument0[sk_data_animationState.animationQueue]);

#define __sk_animationState_init
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
sk_animationState_clear(argument0,undefined,false);

#define __sk_animation_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_animation.timelines]);
ds_list_destroy(argument0[sk_data_animation.mainline]);

#define __sk_animation_init
enum sk_data_animation{
	name,
	timelines,
	mainline,
	duration,loop
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_animation.timelines] = ds_list_create();
argument0[@ sk_data_animation.mainline] = ds_list_create();
sk_animation_set_name(argument0,undefined);
sk_animation_set_duration(argument0,0,false);

#define __sk_armature_dispose
/// @desc dispose
/// @param variable
var sk_list_bones = argument0[sk_data_armature.bones];
var sk_list_slots = argument0[sk_data_armature.slots];
var sk_list_skins = argument0[sk_data_armature.skins];
var sk_list_constraints = argument0[sk_data_armature.constraints];
var sk_list_animations = argument0[sk_data_armature.animations];
var sk_list_events = argument0[sk_data_armature.events];
var sk_list_attachments = argument0[sk_data_armature.attachments];
var sk_list_updateOrder = argument0[sk_data_armature.skins];
var sk_list_drawOrder = argument0[sk_data_armature.drawOrder];
var sk_lists = [
	sk_list_bones,
	sk_list_slots,
	sk_list_skins,
	sk_list_constraints,
	sk_list_animations,
	sk_list_events,
	sk_list_attachments
];
for(var sk_list_id = 0, sk_list_count = array_length_1d(sk_lists); sk_list_id<sk_list_count; sk_list_id++){
	var sk_list = sk_lists[sk_list_id];
	for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_list); sk_item_id<sk_item_count; sk_item_id++){
		var sk_item = sk_list[| sk_item_id];
		if(sk_list==sk_list_bones){
			sk_bone_destroy(sk_item);
		}else if(sk_list==sk_list_slots){
			sk_renderable_destroy(sk_item);
		}else if(sk_list==sk_list_constraints){
			sk_updatable_destroy(sk_item);
		}else if(sk_list==sk_list_skins){
			sk_skin_destroy(sk_item);
		}else if(sk_list==sk_list_animations){
			//sk_animation_destroy(sk_item);
		}else if(sk_list==sk_list_events){
			//sk_event_destroy(sk_item);
		}else if(sk_list==sk_list_attachments){
			sk_attachment_destroy(sk_item);
		}
	}
	ds_list_destroy(sk_list);
}
ds_list_destroy(sk_list_updateOrder);
ds_list_destroy(sk_list_drawOrder);

#define __sk_armature_init
enum sk_data_armature{
	bones,
	constraints,
	slots,
	animations,
	skins,defaultSkin,
	attachments,
	events,
	updateOrder,
	drawOrder
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_armature.bones] = ds_list_create();
argument0[@ sk_data_armature.constraints] = ds_list_create();
argument0[@ sk_data_armature.slots] = ds_list_create();
argument0[@ sk_data_armature.animations] = ds_list_create();
argument0[@ sk_data_armature.skins] = ds_list_create();
argument0[@ sk_data_armature.attachments] = ds_list_create();
argument0[@ sk_data_armature.events] = ds_list_create();
argument0[@ sk_data_armature.updateOrder] = ds_list_create();
argument0[@ sk_data_armature.drawOrder] = ds_list_create();

#define __sk_assert_skeletonObjectDoesNotExistException
/// @desc shows an error message if the value is true
/// @param assertion
if(argument0) then show_error("Skeleton object with reference does not exist.",true);

#define __sk_atlas_dispose
/// @desc dispose
/// @param variable
ds_map_destroy(argument0[sk_data_atlas.subtextures]);

#define __sk_atlas_init
enum sk_data_atlas{
	texturePage,
	UVLeft,UVTop,
	UVRight,UVBottom,
	subtextures
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_atlas.subtextures] = ds_map_create();
sk_atlas_set_page(argument0,-1,0);

#define __sk_attachment_interface_implement
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"vertex_add");

#define __sk_attachment_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_attachment_timeline.keyframes]);

#define __sk_attachment_timeline_init
enum sk_data_attachment_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_attachment_timeline.keyframes] = ds_list_create();
sk_attachment_timeline_set_slot(argument0,undefined);

#define __sk_bone_init
enum sk_data_bone{
	name,
	parent,
	length,
	setupX,setupY,setupXScale,setupYScale,setupXShear,setupYShear,setupRotation,setupTransformMode,
	appliedX,appliedY,appliedXScale,appliedYScale,appliedXShear,appliedYShear,appliedRotation,appliedTransformMode,
	worldX,worldY,
	m00,m01,m10,m11,
	invalidAppliedTransform
}
/// @desc initialise
/// @param variable
sk_bone_set_name(argument0,undefined);
sk_bone_set_parent(argument0,undefined);
sk_bone_set_length(argument0,100);
sk_bone_set_pose(argument0,0,0,1,1,0,0,0,SK_TRANSFORM_MODE_NORMAL);
sk_bone_setup(argument0);
sk_bone_update(argument0);

#define __sk_colour_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_colour_timeline.keyframes]);

#define __sk_colour_timeline_init
enum sk_data_colour_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_colour_timeline.keyframes] = ds_list_create();
sk_colour_timeline_set_slot(argument0,undefined);

#define __sk_drawOrder_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_drawOrder_timeline.keyframes]);

#define __sk_drawOrder_timeline_init
enum sk_data_drawOrder_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_drawOrder_timeline.keyframes] = ds_list_create();
sk_drawOrder_timeline_set_target(argument0,undefined);

#define __sk_empty_script
/// @desc an empty script which is called if no script was found
/// @param object
/// @param [args...]

#define __sk_event_init
enum sk_data_event{
	name,
	setupBone,setupString,setupReal,setupInt,setupSound,
	appliedBone,appliedString,appliedReal,appliedInt,appliedSound
}
/// @desc initialise
/// @param variable
sk_event_set_name(argument0,undefined);
sk_event_set_data(argument0,undefined,"",0.0,0,-1);
sk_event_set_data_applied(argument0,undefined,undefined,undefined,undefined,undefined);

#define __sk_event_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_event_timeline.keyframes]);

#define __sk_event_timeline_init
enum sk_data_event_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_event_timeline.keyframes] = ds_list_create();
sk_event_timeline_set_event(argument0,undefined);

#define __sk_file_read_all
/// @desc convert file contents to a string
/// @param filepath
var sk_context = "";
if(file_exists(argument0)){
	var sk_file = file_text_open_read(argument0);
	while(!file_text_eof(sk_file)){
		sk_context += file_text_readln(sk_file);
	}
	file_text_close(sk_file);
}
return sk_context;

#define __sk_hex_to_alpha
/// @desc Returns the colour corresponding to the hex string
/// @param hex
/// @param inverse
var sk_slot_rgba = string_copy(argument0,0,8);
while(string_length(sk_slot_rgba)<8){ // fill empty data
	sk_slot_rgba += "F";
}
return clamp(__sk_hex_to_real(string_copy(sk_slot_rgba,argument1 ? 1 : 7,2))/255,0,1);

#define __sk_hex_to_colour
/// @desc Returns the colour corresponding to the hex string
/// @param hex
/// @param inverse
var sk_slot_rgba = string_copy(argument0,0,8);
while(string_length(sk_slot_rgba)<8){ // fill empty data
	sk_slot_rgba += "F";
}
return(
	(__sk_hex_to_real(string_copy(sk_slot_rgba,argument1 ? 7 : 1,2))<<0)+ // red
	(__sk_hex_to_real(string_copy(sk_slot_rgba,argument1 ? 5 : 3,2))<<8)+ // green
	(__sk_hex_to_real(string_copy(sk_slot_rgba,argument1 ? 3 : 5,2))<<16) // blue
);

#define __sk_hex_to_real
/// @desc Returns a decimal integer (real) representing the given hexadeciaml string.
/// @param hex
/// GMLscripts.com/license
var hex = string_upper(argument0);
var dec = 0;
var digit_count = string_length(hex); 
var digit;
for(digit = 1; digit <= digit_count; digit++){
	var pos = string_pos(string_char_at(hex,digit),"0123456789ABCDEF");
	if(pos){
		dec = (dec<<4)|(pos-1);
	}
}
return dec;

#define __sk_ik_constraint_init
enum sk_data_ik_constraint{
	name,
	joint,effector,chain,
	setupBendDir,setupWeight,
	appliedBendDir,appliedWeight
}
/// @desc initialise
/// @param variable
sk_ik_constraint_set_bones(argument0,undefined,undefined,false);
sk_ik_constraint_set_pose(argument0,SK_BEND_NEGATIVE,1);
sk_ik_constraint_setup(argument0);

#define __sk_ik_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_ik_timeline.keyframes]);

#define __sk_ik_timeline_init
enum sk_data_ik_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_ik_timeline.keyframes] = ds_list_create();
sk_ik_timeline_set_constraint(argument0,undefined);

#define __sk_parent_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_parent_timeline.keyframes]);

#define __sk_parent_timeline_init
enum sk_data_parent_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_parent_timeline.keyframes] = ds_list_create();
sk_parent_timeline_set_slot(argument0,undefined);

#define __sk_physics_constraint_init
enum sk_data_physics_constraint{
	name,
	rigid, // if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob
	system,
	anchor,
	effector, // anchor is the bone the system will be attached to, the effector is where the bones will try to reach to
	setupXGravity,setupYGravity,setupDrive,
	appliedXGravity,appliedYGravity,appliedDrive
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_physics_constraint.system] = ds_list_create();
sk_physics_constraint_set_rigid(argument0,false);
sk_physics_constraint_set_bones(argument0,undefined,undefined);
sk_physics_constraint_set_pose(argument0,0,0,1);
sk_physics_constraint_setup(argument0);

#define __sk_plane_attachment_init
enum sk_data_plane_attachment{
	name,
	regionKey,
	regionData,
	X,Y,
	m00,m01,m10,m11
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_plane_attachment.regionData] = undefined;
sk_plane_attachment_set_name(argument0,undefined);
sk_plane_attachment_set_regionKey(argument0,undefined);
sk_plane_attachment_set_matrix(argument0,0,0,1,1,0,0,0);

#define __sk_point_attachment_init
enum sk_data_point_attachment{
	name,
	offsetX,offsetY,offsetRotation,
	worldX,worldY,worldRotation
}
/// @desc initialise
/// @param variable
sk_point_attachment_set_name(argument0,undefined);
sk_point_attachment_set_offsets(argument0,0,0,0);

#define __sk_renderable_interface_implement
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"setup");
argument0[@ 1,1] = sk_type_script_get_index(sk_type,"vertex_add");
argument0[@ 1,2] = sk_type_script_get_index(sk_type,"get_attachments");
argument0[@ 1,3] = sk_type_script_get_index(sk_type,"set_attachments");

#define __sk_rotate_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_rotate_timeline.keyframes]);

#define __sk_rotate_timeline_init
enum sk_data_rotate_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_rotate_timeline.keyframes] = ds_list_create();
sk_rotate_timeline_set_bone(argument0,undefined);

#define __sk_scale_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_scale_timeline.keyframes]);

#define __sk_scale_timeline_init
enum sk_data_scale_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_scale_timeline.keyframes] = ds_list_create();
sk_scale_timeline_set_bone(argument0,undefined);

#define __sk_search_binary
/// @desc search for an index
/// @param id
/// @param value
/// @param step
/// @param min
/// @param max
var MIN = argument3 div argument2;
var MAX = argument4 div argument2;
var low = MIN;
var high = MAX;
if(high<1){ return low; }
while(low<=high){
	var mid = (low+high)>>1; // find average
	//show_message(string(high)+" "+string(low)+" "+string(mid));
	var val = argument0[| mid*argument2];
	if(val>argument1){
		high = mid-1;
	} else if(val<argument1){
		low = mid+1;
	} else {
		return mid*argument2;
	}
}
return max(low*argument2 - argument2,0);

#define __sk_search_linear
/// @desc search for an index
/// @param id
/// @param value
/// @param step
/// @param min
/// @param max
var frame_id = argument3;
for(; frame_id < argument4; frame_id+=argument2){
	if(argument0[| frame_id] > argument1){
		return max(frame_id-argument2,0);
	}
}
return max(frame_id-argument2,0);

#define __sk_shear_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_shear_timeline.keyframes]);

#define __sk_shear_timeline_init
enum sk_data_shear_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_shear_timeline.keyframes] = ds_list_create();
sk_shear_timeline_set_bone(argument0,undefined);

#define __sk_shift_value
/// @desc shifts a value within a ds_list by x units (this doesn't retain nested list data)
/// @param id
/// @param pos
/// @param x
var pos = argument1;
var pos_min = 0;
var pos_max = ds_list_size(argument0)-1;
if((pos<pos_min)||(pos>pos_max)){
	return;
}
var item = argument0[| pos];
ds_list_delete(argument0,pos);
if(argument2==undefined){ return; }
var pos_new = clamp(pos+argument2,pos_min,pos_max);
if(pos_new==pos_max){
	ds_list_add(argument0,item);
} else {
	ds_list_insert(argument0,pos_new,item);
}

#define __sk_shift_value_list
/// @desc shifts data in an update cache using the supplied tuple
/// @param id
/// @param tuple
var tuple = argument1;
var tuple_last = ds_list_size(tuple);
var tuple_id;
for(tuple_id = 0; tuple_id<tuple_last; tuple_id += 2){
	var tuple_value = tuple[| tuple_id+0];
	var tuple_shift = tuple[| tuple_id+1];
	var tuple_value_index = ds_list_find_index(argument0,tuple_value);
	if(tuple_value_index!=-1){
		// shift value
		__sk_shift_value(argument0,tuple_value_index,tuple_shift);
	}
}

#define __sk_skin_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_skin.displays]);

#define __sk_skin_init
enum sk_data_skin{
	name,
	displays
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_skin.displays] = ds_list_create();
sk_skin_set_name(argument0,undefined);

#define __sk_slot_dispose
/// @desc dispose
/// @param variable
ds_map_destroy(argument0[@ sk_data_slot.availableAttachments]);

#define __sk_slot_init
enum sk_data_slot{
	name,
	apply,
	availableAttachments,
	setupAttachmentKey,
	setupColour,setupAlpha,setupBone,setupAttachment,
	appliedColour,appliedAlpha,appliedBone,appliedAttachment,
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_slot.availableAttachments] = ds_map_create();
sk_slot_set_name(argument0,undefined);
sk_slot_set_pose(argument0,c_white,1,undefined,undefined);
sk_slot_setup(argument0);

#define __sk_timeline_interface_implement
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"get_times");
argument0[@ 1,1] = sk_type_script_get_index(sk_type,"apply");

#define __sk_transformation_constraint_init
enum sk_data_transformation_constraint{
	name,
	state,
	children,target,
	offsetX,offsetY,offsetXScale,offsetYScale,offsetShear,offsetRotation,
	setupMixTranslate,setupMixScale,setupMixShear,setupMixRotate,
	appliedMixTranslate,appliedMixScale,appliedMixShear,appliedMixRotate
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_transformation_constraint.children] = ds_list_create();
sk_transformation_constraint_set_target(argument0,undefined);
sk_transformation_constraint_set_state(argument0,false,false);
sk_transformation_constraint_set_offsets(argument0,0,0,0,0,0,0);
sk_transformation_constraint_set_pose(argument0,1,1,1,1);
sk_transformation_constraint_setup(argument0);

#define __sk_transformation_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_transformation_timeline.keyframes]);

#define __sk_transformation_timeline_init
enum sk_data_transformation_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_transformation_timeline.keyframes] = ds_list_create();
sk_transformation_timeline_set_constraint(argument0,undefined);

#define __sk_translate_timeline_dispose
/// @desc dispose
/// @param variable
ds_list_destroy(argument0[sk_data_translate_timeline.keyframes]);

#define __sk_translate_timeline_init
enum sk_data_translate_timeline{
	keyframes,
	target
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_translate_timeline.keyframes] = ds_list_create();
sk_translate_timeline_set_bone(argument0,undefined);

#define __sk_updatable_interface_implement
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"setup");
argument0[@ 1,1] = sk_type_script_get_index(sk_type,"update");
argument0[@ 1,2] = sk_type_script_get_index(sk_type,"cache");

