/// @descc applies FK and constraints to bones
/// @param updateOrder
var sk_updateOrder = argument0;
var sk_item_count = ds_list_size(sk_updateOrder);
var sk_item_id;
for(sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	// iterate through cache
	var sk_itemData = sk_updateOrder[| sk_item_id];
	var sk_update_script = sk_struct_get_apply_script(sk_itemData);
	if(sk_update_script!=-1){
		script_execute(sk_update_script,sk_itemData);
	}
}