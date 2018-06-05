// @descc sets the items in the cache to their respective setup poses
/// @param updateOrder
var sk_updateOrder = argument0;
var sk_item_count = ds_list_size(sk_updateOrder);
var sk_item_id;
for(sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	// iterate through cache
	var sk_itemData = sk_updateOrder[| sk_item_id];
	switch(sk_struct_get_type(sk_itemData)){
		case sk_type_bone: sk_bone_setToSetupPose(sk_itemData); break;
		case sk_type_slot: sk_slot_setToSetupPose(sk_itemData); break;
		case sk_type_symbol: sk_symbol_setToSetupPose(sk_itemData); break;
		case sk_type_constraint_ik: sk_constraint_ik_setToSetupMix(sk_itemData); break;
		case sk_type_constraint_transform: sk_constraint_transform_setToSetupMix(sk_itemData); break;
		case sk_type_constraint_hierarchy: sk_constraint_hierarchy_setToSetupParent(sk_itemData); break;
	}
}