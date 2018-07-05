gml_pragma("forceinline");
/// @desc sets the next animation to play
/// @param animationState
/// @param name
/// @param loop
/// @param [offset]
var sk_animationState = argument[0];
sk_animationState[@ SK_ANIMATIONSTATE.animation_next] = argument[1];
sk_animationState[@ SK_ANIMATIONSTATE.animation_next_loop] = argument[2];
sk_animationState[@ SK_ANIMATIONSTATE.animation_next_time] = (argument_count==4) ? argument[3] : -1;