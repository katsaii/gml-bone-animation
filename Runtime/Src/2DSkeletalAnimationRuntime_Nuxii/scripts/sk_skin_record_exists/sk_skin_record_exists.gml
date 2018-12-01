/// @desc determines whether the record exists
/// @param skin
/// @param slotOrSymbol
/// @param key
var sk_slot = noone;
switch(sk_struct_get_type(argument1)){
	case sk_type_slot: sk_slot = argument1; break;
	case sk_type_symbol: sk_slot = sk_symbol_get_nested_slot(argument1); break;
}
var sk_displays = argument0[SK_SKIN.displays];
var sk_display_last = ds_list_size(sk_displays);
for(var sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_tuple_skinRecord_ENTRIES){
	if(
		(sk_displays[| sk_display_id+sk_tuple_skinRecord_slot]==sk_slot)&&
		(sk_displays[| sk_display_id+sk_tuple_skinRecord_attachmentKey]==argument2)
	){	// record exists
		return true;
	}
}
return false;