/// @desc sets a property
/// @param animation
/// @param time
/// @param duration
/// @param loop
argument0[@ sk_animation_var_start] = max(real(argument1),0);
argument0[@ sk_animation_var_duration] = max(real(argument2),0);
argument0[@ sk_animation_var_looping] = bool(argument3);