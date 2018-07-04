gml_pragma("forceinline");
/// @desc sets the next animation to play
/// @param animationState
/// @param name
/// @param loop
/// @param [offset]
argument0[@ SK_ANIMATIONSTATE.animation_next] = argument[1];
argument0[@ SK_ANIMATIONSTATE.animation_next_loop] = argument[2];
argument0[@ SK_ANIMATIONSTATE.animation_next_time] = (argument_count==4) ? argument[3] : 0;