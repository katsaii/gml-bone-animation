__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied constraint
/// @param constraint
array_copy(argument0,sk_data_physics_constraint.appliedXGravity,argument0,sk_data_physics_constraint.setupXGravity,sk_data_physics_constraint.appliedXGravity-sk_data_physics_constraint.setupXGravity);