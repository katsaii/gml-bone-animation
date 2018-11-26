/// @desc sets the local transforms of the bones, slots, and constraints
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
var sk_drawOrder = argument0[SK_ARMATURE.drawOrderFinal];
ds_list_copy(sk_drawOrder,argument0[SK_ARMATURE.drawOrder]);
// set bones to setup pose
var sk_update_item_count = ds_list_size(sk_updateOrder), sk_update_item, sk_setup_script;
for(var sk_update_item_id = 0; sk_update_item_id < sk_update_item_count; sk_update_item_id++){
	sk_update_item = sk_updateOrder[| sk_update_item_id];
	sk_setup_script = sk_struct_get_setup_script(sk_update_item);
	if(sk_setup_script!=-1){
		script_execute(sk_setup_script,sk_update_item);
	}
}
// set slots to setup pose
	sk_update_item_count = ds_list_size(sk_drawOrder);
for(var sk_update_item_id = 0; sk_update_item_id < sk_update_item_count; sk_update_item_id++){
	sk_update_item = sk_drawOrder[| sk_update_item_id];
	sk_setup_script = sk_struct_get_setup_script(sk_update_item);
	if(sk_setup_script!=-1){
		script_execute(sk_setup_script,sk_update_item);
	}
}