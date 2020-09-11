__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param constraint
argument0[@ sk_data_ik_timeline.target] = sk_ik_constraint_exists(argument1) ? argument1 : undefined;