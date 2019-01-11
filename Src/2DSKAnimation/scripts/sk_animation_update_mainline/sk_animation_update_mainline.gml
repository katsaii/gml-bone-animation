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
sk_animation_resetEventState(argument0);