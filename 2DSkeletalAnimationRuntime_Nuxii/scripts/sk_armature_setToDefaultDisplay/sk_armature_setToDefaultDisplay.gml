/// @desc iterates through all slots and sets the default attachment for each
/// @param armature
var sk_slots = argument0[SK_ARMATURE.slots];
var sk_record_count = ds_list_size(sk_slots); 
var sk_record_id;
for(sk_record_id = 0; sk_record_id < sk_record_count; sk_record_id++){
	var sk_slot = sk_slots[| sk_record_id];
	if(sk_struct_exists(sk_slot)){
		switch(sk_struct_get_type(sk_slot)){
			case sk_type_slot: sk_slot_setToDefaultDisplay(sk_slot); break;
			case sk_type_symbol: sk_symbol_setToDefaultDisplay(sk_slot); break;
		}
	}
}