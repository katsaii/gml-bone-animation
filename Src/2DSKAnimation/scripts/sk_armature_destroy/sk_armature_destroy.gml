#macro sk_armature_destroy sk_updatable_destroy
/// @desc clears armature data
/// @param armature
var sk_lists = [
	argument0[sk_armature_var_bones],
	argument0[sk_armature_var_slots],
	argument0[sk_armature_var_constraints]
];
for(var sk_list_id = 0, sk_list_count = array_length_1d(sk_item_lists); sk_list_id<sk_list_count; sk_list_id++){
	var sk_list = sk_lists[sk_list_id];
	for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_list); sk_item_id<sk_item_count; sk_item_id++){
		sk_updatable_destroy(sk_list[| sk_item_id]);
	}
	ds_list_destroy(sk_list);
}
var
sk_items = argument0[sk_armature_var_skins      ]; for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_items); sk_item_id<sk_item_count; sk_item_id++){ sk_skin_destroy      (sk_items[| sk_item_id]); } ds_list_destroy(sk_items);
sk_items = argument0[sk_armature_var_animations ]; for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_items); sk_item_id<sk_item_count; sk_item_id++){ sk_animation_destroy (sk_items[| sk_item_id]); } ds_list_destroy(sk_items);
sk_items = argument0[sk_armature_var_events     ]; for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_items); sk_item_id<sk_item_count; sk_item_id++){ sk_event_destroy     (sk_items[| sk_item_id]); } ds_list_destroy(sk_items);
sk_items = argument0[sk_armature_var_attachments]; for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_items); sk_item_id<sk_item_count; sk_item_id++){ sk_attachment_destroy(sk_items[| sk_item_id]); } ds_list_destroy(sk_items);
// destroy cache
ds_list_destroy(argument0[sk_armature_var_updateOrder]);
ds_list_destroy(argument0[sk_armature_var_drawOrder]);
ds_list_destroy(argument0[sk_armature_var_drawOrderFinal]);