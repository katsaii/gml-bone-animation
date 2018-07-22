/// @desc append display data to the skin
/// @param skin
/// @param slotOrSymbol
/// @param attachment
/// @param key
var sk_slot;
switch(sk_struct_get_type(argument1)){
	case sk_type_slot: sk_slot = argument1; break;
	case sk_type_symbol: sk_slot = sk_symbol_get_nested_slot(argument1); break;
	default: return; break;
}
var sk_displays = argument0[SK_SKIN.displays];
var sk_id = max(ds_list_size(sk_displays) div sk_tuple_skinRecord_ENTRIES,0)*sk_tuple_skinRecord_ENTRIES; // make sure it is a multiple of the record length
sk_displays[| sk_id+sk_tuple_skinRecord_slot] = sk_slot;
sk_displays[| sk_id+sk_tuple_skinRecord_attachment] = argument2;
sk_displays[| sk_id+sk_tuple_skinRecord_attachmentKey] = argument3;