__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param joint
/// @param target
/// @param chain
argument0[@ sk_data_ik_constraint.joint] = sk_bone_exists(argument1) ? argument1 : undefined;
argument0[@ sk_data_ik_constraint.effector] = sk_bone_exists(argument2) ? argument2 : undefined;
argument0[@ sk_data_ik_constraint.chain] = bool(argument3);