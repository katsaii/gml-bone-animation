__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
#macro SK_BEND_POSITIVE 1
#macro SK_BEND_NEGATIVE -1
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ sk_data_ik_constraint.setupBendDir] = (argument1==SK_BEND_POSITIVE) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
argument0[@ sk_data_ik_constraint.setupWeight] = is_real(argument2) ? argument2 : 1;