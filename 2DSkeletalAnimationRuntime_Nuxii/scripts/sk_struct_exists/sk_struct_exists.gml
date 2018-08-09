gml_pragma("forceinline");
/// @desc returns the type of skeleton data if it exists
/// @param struct
/// @param [type]
var sk_struct = argument[0];
return(
	is_array(sk_struct)&&
	(
		!SK_CONFIG_SAFE_MODE||
		(array_length_2d(sk_struct,sk_structure_head_dimension)==sk_structure_head_size)
	)&&
	(	// check for specific type
		(argument_count<2)||
		(sk_struct[sk_structure_header_type]==argument[1])
	)
);