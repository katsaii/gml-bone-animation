__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied constraint
/// @param constraint
array_copy(argument0,sk_data_ik_constraint.appliedBendDir,argument0,sk_data_ik_constraint.setupBendDir,sk_data_ik_constraint.appliedBendDir-sk_data_ik_constraint.setupBendDir);