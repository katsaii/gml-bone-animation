gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied slot
/// @param slot
var sk_setupPose_copy = argument0[sk_symbol_var_setupState];
sk_setupPose_copy[0] = sk_setupPose_copy[0];
argument0[@ sk_symbol_var_worldState] = sk_setupPose_copy;