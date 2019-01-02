gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied IKConstraint
/// @param constraint
var sk_setupPose_copy = argument0[sk_constraint_ik_var_setupTransform];
sk_setupPose_copy[0] = sk_setupPose_copy[0];
argument0[@ sk_constraint_ik_var_appliedTransform] = sk_setupPose_copy;