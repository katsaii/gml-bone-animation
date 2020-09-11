__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_parent_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param slot
argument0[@ sk_data_parent_timeline.target] = sk_slot_exists(argument1) ? argument1 : undefined;