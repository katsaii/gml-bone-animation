__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_translate_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param bone
argument0[@ sk_data_translate_timeline.target] = sk_bone_exists(argument1) ? argument1 : undefined;