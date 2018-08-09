#macro sk_type_armature "__sk_armature_header"
enum SK_ARMATURE{
	bones,slots,skins,constraints,
	animations,events,attachments,
	updateOrderDefault,updateOrder, /* stores bone, slot, and constraint data in a single iterable list */
	drawOrderDefault,drawOrder,
	sizeof
}
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_ARMATURE.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_ARMATURE.bones] = ds_list_create(); // create structures for storing armature data
			sk_structure[@ SK_ARMATURE.slots] = ds_list_create();
			sk_structure[@ SK_ARMATURE.skins] = ds_list_create();
			sk_structure[@ SK_ARMATURE.constraints] = ds_list_create();
			sk_structure[@ SK_ARMATURE.animations] = ds_list_create();
			sk_structure[@ SK_ARMATURE.events] = ds_list_create();
			sk_structure[@ SK_ARMATURE.attachments] = ds_list_create();
			sk_structure[@ SK_ARMATURE.updateOrderDefault] = ds_list_create();
			sk_structure[@ SK_ARMATURE.updateOrder] = ds_list_create();
			sk_structure[@ SK_ARMATURE.drawOrderDefault] = ds_list_create();
			sk_structure[@ SK_ARMATURE.drawOrder] = ds_list_create();
			sk_armature_add(sk_structure,sk_struct_create(sk_type_skin,"default"));
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			var sk_armature_lists = [
				sk_structure[SK_ARMATURE.bones],
				sk_structure[SK_ARMATURE.slots],
				sk_structure[SK_ARMATURE.skins],
				sk_structure[SK_ARMATURE.constraints],
				sk_structure[SK_ARMATURE.animations],
				sk_structure[SK_ARMATURE.events],
				sk_structure[SK_ARMATURE.attachments]
			];
			// destroy skeleton data
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
			ds_list_destroy(sk_structure[SK_ARMATURE.updateOrderDefault]);
			ds_list_destroy(sk_structure[SK_ARMATURE.updateOrder]);
			ds_list_destroy(sk_structure[SK_ARMATURE.drawOrderDefault]);
			ds_list_destroy(sk_structure[SK_ARMATURE.drawOrder]);
		}
	break;
}
return 0;