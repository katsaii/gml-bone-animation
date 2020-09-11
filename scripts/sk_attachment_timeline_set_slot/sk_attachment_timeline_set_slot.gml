__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_attachment_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param slot
argument0[@ sk_data_attachment_timeline.target] = sk_slot_exists(argument1) ? argument1 : undefined;