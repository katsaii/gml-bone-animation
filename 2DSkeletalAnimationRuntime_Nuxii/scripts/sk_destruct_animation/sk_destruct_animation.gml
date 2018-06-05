/// @desc destructor
/// @param struct
var sk_anim_timelines = argument0[SK_ANIMATION.timelines];
// iterate through timelines and dispose
var sk_timeline_count = ds_list_size(sk_anim_timelines);
for(var sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
	var sk_timeline = sk_anim_timelines[| sk_timeline_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_timeline))){
		sk_struct_destroy(sk_timeline);
	}
}
// destroy final list
ds_list_destroy(sk_anim_timelines);