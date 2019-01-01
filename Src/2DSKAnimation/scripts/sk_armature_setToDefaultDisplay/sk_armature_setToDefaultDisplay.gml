/// @desc iterates through all slots and sets the default attachment for each
/// @param armature
var sk_slots = argument0[sk_armature_var_slots];
var sk_slot_count = ds_list_size(sk_slots); 
for(var sk_slot_id = 0; sk_slot_id<sk_slot_count; sk_slot_id++){
	sk_symbol_resetDisplay(sk_slots[| sk_slot_id]);
}