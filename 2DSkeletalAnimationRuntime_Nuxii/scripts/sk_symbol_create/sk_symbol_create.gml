#macro sk_type_symbol "ofSymbolSlot"
enum SK_SYMBOL{
	NESTED_BONE,NESTED_SLOT, /* nested bone and slot. NEVER, EVER, EVER CHANGE THESE */
	bone,boneFinal,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_symbol,SK_SYMBOL.sizeof,sk_construct_symbol,sk_destruct_symbol);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_symbol,argument0);
sk_symbol_set_transformMode(sk_structure,sk_transformMode_normal);
sk_symbol_set_setupPose(sk_structure,0,0,1,1,0,0,0,$ffffff,1,noone,noone);
sk_symbol_set_defaultDisplay(sk_structure,"-1");
sk_symbol_setToDefaultDisplay(sk_structure);
sk_symbol_setToSetupPose(sk_structure);
sk_symbol_updateWorldTransform(sk_structure);
return sk_structure;