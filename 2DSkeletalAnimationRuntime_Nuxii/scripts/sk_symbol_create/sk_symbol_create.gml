#macro sk_type_symbol "ofSymbolSlot"
enum SK_SYMBOL{
	NESTED_BONE,NESTED_SLOT, /* nested bone and slot. NEVER, EVER, EVER CHANGE THESE */
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_symbol,SK_SYMBOL.sizeof,sk_construct_symbol,sk_destruct_symbol);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_symbol,argument0);
return sk_structure;