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