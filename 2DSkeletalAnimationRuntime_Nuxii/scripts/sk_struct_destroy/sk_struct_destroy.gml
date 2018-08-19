/// @desc calls the destructor script on a supplied structure
/// @param struct
var sk_struct = argument0;
var sk_struct_type = sk_struct_get_type(sk_struct);
var sk_struct_type_script = sk_get_index(sk_struct_type);
if(script_exists(sk_struct_type_script)){
	// the type exists, call the type destructor
	script_execute(sk_struct_type_script,sk_structure_type_command.me_destruct,sk_struct);
	// since arrays cannot be disposed directly, make the structure invisible by making the type undefined
	argument0[@ sk_structure_header_type] = undefined;
}