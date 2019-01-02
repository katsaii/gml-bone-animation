#macro sk_bendDir_positive 1
#macro sk_bendDir_negative -1
/// @desc builds the setup data for this constraint
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ sk_constraint_ik_var_defaultBendDir] = (argument1==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
argument0[@ sk_constraint_ik_var_defaultWeight] = is_real(argument2) ? argument2 : 1;
