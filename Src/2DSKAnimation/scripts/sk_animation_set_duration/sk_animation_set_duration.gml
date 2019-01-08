__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc sets a property
/// @param animation
/// @param duration
/// @param loop
argument0[@ sk_data_animation.duration] = max(0,real(argument1));
argument0[@ sk_data_animation.loop] = bool(argument2);