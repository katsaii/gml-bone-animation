gml_pragma("forceinline");
/// @desc destroys the slot
/// @param slot
script_execute(argument0[sk_symbol_var_destructor],argument0);
sk_object_wipe(argument0);