__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc resets the event state of the animation by clearing it
/// @param animation
ds_map_clear(argument0[sk_data_animation.eventState]);