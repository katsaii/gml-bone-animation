__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
/// @desc sets a property
/// @param timeline
/// @param armature
argument0[@ sk_data_drawOrder_timeline.target] = sk_armature_exists(argument1) ? argument1[sk_data_armature.drawOrder] : undefined;