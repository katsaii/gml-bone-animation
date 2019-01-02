/// @desc sets a property
/// @param constraint
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param yshear
/// @param rotation
argument0[@ sk_constraint_transform_var_x] = real(argument1);
argument0[@ sk_constraint_transform_var_y] = real(argument2);
argument0[@ sk_constraint_transform_var_xscale] = is_real(argument3) ? argument3 : 1;
argument0[@ sk_constraint_transform_var_yscale] = is_real(argument4) ? argument4 : 1;
argument0[@ sk_constraint_transform_var_yshear] = -angle_difference(0,real(argument5));
argument0[@ sk_constraint_transform_var_rotation] = -angle_difference(0,real(argument6));