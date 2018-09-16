/// @desc sets the default skin (if it exists)
/// @param armature
var sk_slots = argument0[SK_ARMATURE.slots];
// clear ALL slot attachments
var sk_slot_count = ds_list_size(sk_slots);
for(var sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
	var sk_slot = sk_slots[| sk_slot_id];
	switch(sk_struct_get_type(sk_slot)){
		case sk_type_slot: sk_slot_clear_attachments(sk_slot); break;
		case sk_type_symbol: sk_slot_clear_attachments(sk_symbol_get_nested_slot(sk_slot)); break;
	}
}
// set default skin
sk_skin_apply(sk_armature_get_defaultSkin(argument0),false);
// set default attachments for all slots
sk_armature_setToDefaultDisplay(argument0);