/// @desc sets the default skin (if it exists)
/// @param armature
var sk_slots = argument0[sk_armature_var_slots];
var sk_slot_count = ds_list_size(sk_slots);
for(var sk_slot_id = 0; sk_slot_id<sk_slot_count; sk_slot_id++){
	sk_symbol_attachments_clear(sk_slots[| sk_slot_id]);
}
// set default skin
sk_skin_apply(sk_armature_get_default_skin(argument0),false);
// set default attachments for all slots
sk_armature_resetDisplay(argument0);