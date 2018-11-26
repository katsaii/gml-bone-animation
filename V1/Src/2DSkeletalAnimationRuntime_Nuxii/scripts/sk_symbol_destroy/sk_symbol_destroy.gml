/// @desc deletes the supplied structure and unhooks its array
/// @param symbol
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	sk_bone_destroy(argument0[SK_SYMBOL.NESTED_BONE]);
	sk_slot_destroy(argument0[SK_SYMBOL.NESTED_SLOT]);
}