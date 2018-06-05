gml_pragma("forceinline");
/// @desc returns the type of skeleton data if it exists
/// @param struct
/// @param type
return( is_array(argument0)&&(argument0[sk_struct_header_type]==argument1) );