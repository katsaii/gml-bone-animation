/// @desc destroys the object
/// @param animation
var sk_anim_timelines = argument0[sk_animation_var_timelines];
var sk_timeline_count = ds_list_size(sk_anim_timelines);
for(var sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
	// iterate through timelines and dispose
	sk_timeline_destroy(sk_anim_timelines[| sk_timeline_id]);
}
ds_list_destroy(sk_anim_timelines);
sk_object_wipe(argument0);