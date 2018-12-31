gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied slot
/// @param slot
var sk_setupPose_copy = argument0[sk_slot_var_setupPose];
sk_setupPose_copy[0] = sk_setupPose_copy[0];
argument0[@ sk_slot_var_finalPose] = sk_setupPose_copy;