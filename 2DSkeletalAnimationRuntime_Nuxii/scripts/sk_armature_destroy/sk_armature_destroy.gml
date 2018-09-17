/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// destroy skeleton data
	var sk_armature_lists = [
		argument0[SK_ARMATURE.bones],
		argument0[SK_ARMATURE.slots],
		argument0[SK_ARMATURE.skins],
		argument0[SK_ARMATURE.constraints],
		argument0[SK_ARMATURE.animations],
		argument0[SK_ARMATURE.events],
		argument0[SK_ARMATURE.attachments]
	];
	var sk_armature_list_count = array_length_1d(sk_armature_lists);
	for(var sk_armature_list_id = 0; sk_armature_list_id < sk_armature_list_count; sk_armature_list_id++){
		var sk_armature_list = sk_armature_lists[sk_armature_list_id];
		var sk_item_count = ds_list_size(sk_armature_list);
		for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
			var sk_item = sk_armature_list[| sk_item_id];
			if(sk_struct_exists(sk_item)){
				sk_struct_destroy(sk_item);
			}
		}
		ds_list_destroy(sk_armature_list);
	}
	// destroy cache
	ds_list_destroy(argument0[SK_ARMATURE.updateOrder]);
	ds_list_destroy(argument0[SK_ARMATURE.drawOrder]);
	ds_list_destroy(argument0[SK_ARMATURE.drawOrderFinal]);
}