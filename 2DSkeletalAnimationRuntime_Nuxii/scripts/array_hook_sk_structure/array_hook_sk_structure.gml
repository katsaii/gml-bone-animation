enum SK_STRUCT_H{
	parity, // whether the structure exists (should equate to true at all times)
	type, // the type of structure used as an identifier, cannot/must not be changed
	name, // the name given to the structure
	scr_setup, // used during polymorphism to initialise the structure
	scr_apply, // used during polymorphism to apply the structues state
	scr_destroy, // used during polymorphism to destroy the structure without knowing its type
	sizeof
}
/// @desc adds header data to the array
/// @param arr
/// @param type
/// @param name
/// @param [setup_script_id_or_name
/// @param apply_script_id_or_name
/// @param destroy_script_id_or_name]
var sk_struct = argument[0];
sk_struct[@ 1,SK_STRUCT_H.parity] = true;
sk_struct[@ 1,SK_STRUCT_H.type] = argument[1];
sk_struct_set_name(sk_struct,argument[2]);
if(argument_count==6){
	sk_struct_set_setup_script(sk_struct,argument[3]);
	sk_struct_set_apply_script(sk_struct,argument[4]);
	sk_struct_set_destroy_script(sk_struct,argument[5]);
}