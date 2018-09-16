/// @desc deletes the supplied structure and unhooks its array
/// @param event
array_unhook_sk_structure(argument0);
// iterate through timelines and dispose
var sk_anim_timelines = argument0[SK_ANIMATION.timelines];
var sk_timeline_count = ds_list_size(sk_anim_timelines);
for(var sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
	var sk_timeline = sk_anim_timelines[| sk_timeline_id];
	if(sk_struct_exists(sk_timeline)){
		sk_struct_destroy(sk_timeline);
	}
}
// destroy dynamic data structures
ds_list_destroy(sk_anim_timelines);