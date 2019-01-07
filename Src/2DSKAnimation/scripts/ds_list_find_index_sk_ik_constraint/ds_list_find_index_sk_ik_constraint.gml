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