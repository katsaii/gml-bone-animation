gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
var sk_pose = argument0[sk_constraint_transform_var_appliedTransform];
sk_pose[@ 0] = real(argument1);
sk_pose[@ 1] = real(argument2);
sk_pose[@ 2] = real(argument3);
sk_pose[@ 3] = real(argument4);