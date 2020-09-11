__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param anchor
/// @param effector
argument0[@ sk_data_physics_constraint.anchor] = sk_bone_exists(argument1) ? argument1 : undefined;
argument0[@ sk_data_physics_constraint.effector] = sk_bone_exists(argument2) ? argument2 : undefined;