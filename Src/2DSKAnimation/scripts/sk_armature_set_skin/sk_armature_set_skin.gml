__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets the skin
/// @param armature
/// @param skin1
/// @param skin2
/// @param ...
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
for(var sk_skin_id = 0; sk_skin_id<argument_count; sk_skin_id++){
	var sk_skin_name = "default";
	if(sk_skin_id>0){
		sk_skin_name = argument[sk_skin_id];
	}
	var sk_skin_id = ds_list_find_index_sk_skin(sk_skins,sk_skin_name);
	if(sk_skin_id!=-1){
		sk_skin_apply(sk_skins[| sk_skin_id],false);
	}
}