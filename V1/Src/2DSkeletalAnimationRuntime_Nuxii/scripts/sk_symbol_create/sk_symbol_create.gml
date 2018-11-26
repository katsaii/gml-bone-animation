#macro sk_type_symbol sk_symbol_create
enum SK_SYMBOL{
	NESTED_BONE,NESTED_SLOT,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = array_create(SK_SYMBOL.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_symbol,argument0,
	"sk_symbol_setToSetupPose", // setup script
	"sk_symbol_updateWorldTransform", // apply script
	"sk_symbol_destroy" // destruction script
);
// create dynamic data structures
var sk_bone = sk_bone_create("%B",argument1); sk_struct_protect(sk_bone,sk_struct); sk_struct[@ SK_SYMBOL.NESTED_BONE] = sk_bone;
var sk_slot = sk_slot_create("%S",noone); sk_struct_protect(sk_slot,sk_struct); sk_struct[@ SK_SYMBOL.NESTED_SLOT] = sk_slot;
// return to caller
return sk_struct;