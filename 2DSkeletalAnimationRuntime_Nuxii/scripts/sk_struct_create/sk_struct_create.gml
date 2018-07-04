#macro sk_struct_body 0
#macro sk_struct_head 1
#macro sk_struct_ex 2 /* real estate for additional data */
#macro sk_struct_header_type sk_struct_head,0
#macro sk_struct_header_name sk_struct_head,1
#macro sk_struct_header_length 3
/// @desc creates a new structure using the supplied type
/// @param type
/// @param name
var sk_t = sk_struct_types;
if(ds_exists(sk_t,ds_type_map)&&ds_map_exists(sk_t,argument0)){
	var sk_type = sk_t[? argument0];
	var sk_type_size = sk_type[? "size"];
	var sk_type_constructorScript = sk_type[? "constructor"];
	var sk_type_extendedArgs = sk_type[? "extArgs"];
	// create the structure
	var sk_structure = array_create(sk_type_size);
	sk_structure[@ sk_struct_header_type] = argument0;
	sk_structure[@ sk_struct_header_name] = argument1;
	// call constructor script
	if(script_exists(sk_type_constructorScript)){
		script_execute(sk_type_constructorScript,sk_structure,sk_type_extendedArgs);
	}
	// return final structure
	return sk_structure;
}
return noone;