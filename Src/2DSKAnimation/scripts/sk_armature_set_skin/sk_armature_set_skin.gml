__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets the skin
/// @param armature
/// @param [skin_name1
/// @param skin_name2
/// @param ...]
var sk_obj = argument[0];
var sk_slots = sk_obj[sk_data_armature.slots];
// clear slots
var sk_slot_count = ds_list_size(sk_slots);
var sk_empty_map = ds_map_create();
for(var sk_slot_id = 0; sk_slot_id<sk_slot_count; sk_slot_id++){
	sk_renderable_set_attachments(sk_slots[| sk_slot_id],sk_empty_map);
}
ds_map_destroy(sk_empty_map);
// apply skins
var sk_skins = sk_obj[sk_data_armature.skins];
for(var argument_id = 0; argument_id<argument_count; argument_id++){
	var sk_skin_name = (argument_id<1) ? argument0[sk_data_armature.defaultSkin] : argument[argument_id];
	var sk_skin_pos = ds_list_find_index_sk_skin(sk_skins,sk_skin_name);
	if(sk_skin_pos!=-1){
		sk_skin_apply(sk_skins[| sk_skin_pos],false);
	}
}