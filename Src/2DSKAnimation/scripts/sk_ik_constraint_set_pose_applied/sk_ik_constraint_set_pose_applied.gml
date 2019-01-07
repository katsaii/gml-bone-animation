__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ sk_data_ik_constraint.appliedBendDir] = (argument1==SK_BEND_POSITIVE) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
argument0[@ sk_data_ik_constraint.appliedWeight] = is_real(argument2) ? argument2 : 1;