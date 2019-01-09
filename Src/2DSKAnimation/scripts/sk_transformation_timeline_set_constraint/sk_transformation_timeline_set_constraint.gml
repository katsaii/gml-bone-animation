__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_transformation_timeline.target] = sk_transformation_constraint_exists(argument1) ? argument1 : undefined;