/// @desc sets the bone data for this constraint
/// @param constraint
/// @param joint
/// @param target
/// @param chain
argument0[@ sk_constraint_ik_var_joint] = sk_object_oftype(argument1,sk_type_bone) ? argument1 : undefined;
argument0[@ sk_constraint_ik_var_effector] = sk_object_oftype(argument2,sk_type_bone) ? argument2 : undefined;
argument0[@ sk_constraint_ik_var_chain] = bool(argument3);