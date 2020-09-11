__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param local
/// @param relative
argument0[@ sk_data_transformation_constraint.state] = real(
	(real(bool(argument1))<<0)|
	(real(bool(argument2))<<1)
);