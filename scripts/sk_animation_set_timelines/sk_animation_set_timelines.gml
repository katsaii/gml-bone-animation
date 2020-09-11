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