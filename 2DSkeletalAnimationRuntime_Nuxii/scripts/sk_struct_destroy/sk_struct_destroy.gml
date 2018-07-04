/// @desc calls the destructor script on a supplied structure
/// @param struct
var sk_t = sk_struct_types;
var sk_structureType = sk_struct_get_type(argument0);
if(ds_exists(sk_t,ds_type_map)&&ds_map_exists(sk_t,sk_structureType)){
	var sk_type = sk_t[? sk_structureType];
	var sk_type_destructorScript = sk_type[? "destructor"];
	var sk_type_extendedArgs = sk_type[? "extArgs"];
	// since arrays cannot be disposed directly, make the structure invisible
	argument0[@ sk_struct_header_type] = undefined;
	// call destructor script
	if(script_exists(sk_type_destructorScript)){
		script_execute(sk_type_destructorScript,argument0,sk_type_extendedArgs);
	}
}