/// @desc destructor
/// @param struct
var sk_armature_list, sk_item_count;
// iterate through armature data and dispose
sk_armature_list = argument[SK_ARMATURE.bones];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
sk_armature_list = argument[SK_ARMATURE.slots];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
sk_armature_list = argument[SK_ARMATURE.skins];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
sk_armature_list = argument[SK_ARMATURE.constraints];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
sk_armature_list = argument[SK_ARMATURE.animations];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
sk_armature_list = argument[SK_ARMATURE.events];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
sk_armature_list = argument[SK_ARMATURE.attachments];
sk_item_count = ds_list_size(sk_armature_list);
for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
	var sk_item = sk_armature_list[| sk_item_id];
	if(sk_struct_type_exists(sk_struct_get_type(sk_item))){
		sk_struct_destroy(sk_item);
	}
}
ds_list_destroy(sk_armature_list);
//
ds_list_destroy(argument0[SK_ARMATURE.updateOrderDefault]);
ds_list_destroy(argument0[SK_ARMATURE.updateOrder]);
ds_list_destroy(argument0[SK_ARMATURE.drawOrderDefault]);
ds_list_destroy(argument0[SK_ARMATURE.drawOrder]);