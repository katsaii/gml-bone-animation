#macro sk_struct_header_body 0
#macro sk_struct_header_type 1,sk_struct_header_body
#macro sk_struct_header_name 2,sk_struct_header_body
#macro sk_struct_header_length 3
/// @desc creates a new structure using the supplied type
/// @param type
/// @param name
var sk_t = sk_struct_types;
if(ds_exists(sk_t,ds_type_map)&&ds_map_exists(sk_t,argument0)){
	var sk_type = sk_t[? argument0];
	var sk_type_size = sk_type[? "size"];
	var sk_type_constructorScript = sk_type[? "constructor"];
	// create the structure
	var sk_structure = array_create(sk_type_size);
	sk_structure[@ sk_struct_header_type] = argument0;
	sk_structure[@ sk_struct_header_name] = argument1;
	// call constructor script
	if(script_exists(sk_type_constructorScript)){
		script_execute(sk_type_constructorScript,sk_structure);
	}
	// return final structure
	return sk_structure;
}
return noone;