__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ sk_data_transformation_constraint.target] = sk_bone_exists(argument1) ? argument1 : undefined;