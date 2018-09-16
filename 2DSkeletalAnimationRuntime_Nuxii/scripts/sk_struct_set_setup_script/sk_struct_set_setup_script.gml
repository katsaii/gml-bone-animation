gml_pragma("forceinline");
/// @desc sets a structure script
/// @param struct
/// @param script_id_or_name
var sk_scr_id = is_real(argument1) ? argument1 : asset_get_index(string(argument1));
argument0[@ 1,SK_STRUCT_H.scr_setup] = script_exists(sk_scr_id) ? sk_scr_id : -1;