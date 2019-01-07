__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param yshear
/// @param rotation
argument0[@ sk_data_transformation_constraint.offsetX] = real(argument1);
argument0[@ sk_data_transformation_constraint.offsetY] = real(argument2);
argument0[@ sk_data_transformation_constraint.offsetXScale] = is_real(argument3) ? argument3 : 1;
argument0[@ sk_data_transformation_constraint.offsetYScale] = is_real(argument4) ? argument4 : 1;
argument0[@ sk_data_transformation_constraint.offsetShear] = -angle_difference(0,real(argument5));
argument0[@ sk_data_transformation_constraint.offsetRotation] = -angle_difference(0,real(argument6));