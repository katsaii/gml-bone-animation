/// @desc builds the final data for this constraint
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ sk_constraint_ik_var_bendDir] = (argument1==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
argument0[@ sk_constraint_ik_var_weight] = is_real(argument1) ? argument1 : 1;