gml_pragma("forceinline");
/// @desc returns whether the struct exists
/// @param struct
return is_array(argument0)&&(array_height_2d(argument0)!=1)&&argument0[1,SK_STRUCT_H.parity];