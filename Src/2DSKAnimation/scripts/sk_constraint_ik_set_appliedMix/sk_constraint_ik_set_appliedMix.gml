/// @desc builds the final data for this constraint
/// @param constraint
/// @param bendDir
/// @param weight
var sk_pose = argument0[sk_constraint_ik_var_appliedTransform];
sk_pose[@ 0] = (argument1==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
sk_pose[@ 1] = is_real(argument2) ? argument2 : 1;