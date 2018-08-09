#macro sk_type_symbol "__sk_symbol_header"
enum SK_SYMBOL{
	NESTED_BONE,NESTED_SLOT, /* nested bone and slot. NEVER, EVER, EVER CHANGE THESE */
	sizeof
}
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_SYMBOL.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_SYMBOL.NESTED_BONE] = sk_struct_create(sk_type_bone,"bone"); // create nested data structures
			sk_structure[@ SK_SYMBOL.NESTED_SLOT] = sk_struct_create(sk_type_slot,"slot");
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			sk_struct_destroy(sk_structure[SK_SYMBOL.NESTED_BONE]); // destroy nested data structures
			sk_struct_destroy(sk_structure[SK_SYMBOL.NESTED_SLOT]);
		}
	break;
}
return 0;