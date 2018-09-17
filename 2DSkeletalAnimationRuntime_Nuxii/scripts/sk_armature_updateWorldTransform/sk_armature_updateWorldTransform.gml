/// @descc applies FK and constraints to get the final world positions of the armature bones
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
for(var sk_update_item_id = 0, sk_update_item_count = ds_list_size(sk_updateOrder); sk_update_item_id < sk_update_item_count; sk_update_item_id++){
	var sk_update_item = sk_updateOrder[| sk_update_item_id];
	var sk_setup_script = sk_struct_get_apply_script(sk_update_item);
	if(sk_setup_script!=-1){
		script_execute(sk_setup_script,sk_update_item);
	}
}