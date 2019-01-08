__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc updates the mainline by iterating through the timeline data
/// @param animation
var sk_mainline = argument0[sk_data_animation.mainline];
var sk_timelines = argument0[sk_data_animation.timelines];
var sk_timeline_count = ds_list_size(sk_timelines);
var sk_timeline_times = ds_list_create();
ds_list_clear(sk_mainline);
// compile the times of all the timelines
var sk_times = ds_list_create();
for(var sk_timeline_id = 0; sk_timeline_id<sk_timeline_count; sk_timeline_id++){
	var sk_timeline = sk_timelines[| sk_timeline_id];
	sk_timeline_get_times(sk_timeline,sk_timeline_times);
	var sk_timeline_time_count = ds_list_size(sk_timeline_times);
	for(var sk_timeline_time_id = 0; sk_timeline_time_id<sk_timeline_time_count; sk_timeline_time_id++){
		var sk_timeline_time = sk_timeline_times[| sk_timeline_time_id];
		if(ds_list_find_index(sk_times,sk_timeline_time)==-1) then ds_list_add(sk_times,sk_timeline_time);
	}
}
ds_list_sort(sk_times,true);
var sk_time_count = ds_list_size(sk_times);
for(var sk_time_id = 0; sk_time_id<sk_time_count; sk_time_id++){
	ds_list_add(sk_mainline,sk_times[| sk_time_id],ds_list_create());
	ds_list_mark_as_list(sk_mainline,ds_list_size(sk_mainline)-1);
}
ds_list_destroy(sk_times);
// re-iterate through the timelines, and insert them into each mainline list
for(var sk_timeline_id = 0; sk_timeline_id<sk_timeline_count; sk_timeline_id++){
	var sk_timeline = sk_timelines[| sk_timeline_id];
	sk_timeline_get_times(sk_timeline,sk_timeline_times);
	var sk_timeline_time_count = ds_list_size(sk_timeline_times);
	for(var sk_timeline_time_id = 0; sk_timeline_time_id<(sk_timeline_time_count-1); sk_timeline_time_id++){
		var sk_timeline_time_id_next = sk_timeline_time_id+1;
		var sk_timeline_time = sk_timeline_times[| sk_timeline_time_id];
		var sk_timeline_time_next = sk_timeline_times[| sk_timeline_time_id_next];
		if(sk_timeline_time==sk_timeline_time_next) then continue;
		var sk_mainline_timelines = sk_mainline[| ds_list_find_index(sk_mainline,sk_timeline_time)];
		ds_list_add(
			sk_mainline_timelines,
			sk_timeline,
			sk_timeline_time_id,
			sk_timeline_time_id_next,
			sk_timeline_time,
			sk_timeline_time_next
		);
	}
}
// destroy dynamic structure
ds_list_destroy(sk_timeline_times);