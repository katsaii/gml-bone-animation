gml_pragma("forceinline");
/// @desc returns the type of skeleton data if it exists
/// @param struct
if(is_array(argument0)){
	return argument0[sk_struct_header_type];
}	return noone;