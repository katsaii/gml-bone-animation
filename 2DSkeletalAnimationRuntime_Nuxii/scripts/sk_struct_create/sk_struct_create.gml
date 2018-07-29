#macro sk_structure_head_dimension 1 /* header data is abstracted behind a second dimension */
#macro sk_structure_header_type sk_structure_head_dimension,0
#macro sk_structure_header_name sk_structure_head_dimension,1
#macro sk_structure_head_size 2
enum sk_structure_type_command{
	get_sizeof, /* ask the type to return its size */
	me_construct, /* ask the type to construct the supplied struct */
	me_destruct /* ask the type to destroy the supplied struct */
}
/// @desc creates a new structure using the supplied type
/// @param type
/// @param name
var sk_struct_type = argument0;
var sk_struct_name = argument1;
if(script_exists(sk_struct_type)){
	// the type exists, poll the type to return the size of the structure to create
	var sk_struct_size = max(real(script_execute(sk_struct_type,sk_structure_type_command.get_sizeof,-1)),0);
	// build structure prototype
	var sk_structure = array_create(sk_struct_size,0);
	sk_structure[@ sk_structure_header_type] = argument0;
	sk_structure[@ sk_structure_header_name] = argument1;
	// call the type constructor
	script_execute(sk_struct_type,sk_structure_type_command.me_construct,sk_structure);
	// return final structure
	return sk_structure;
}
return noone;