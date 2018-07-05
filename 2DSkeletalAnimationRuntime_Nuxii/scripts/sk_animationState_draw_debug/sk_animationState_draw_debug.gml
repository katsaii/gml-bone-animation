/// @desc draws debug data
/// @param animationState
/// @param x
/// @param y
var i = 0;
draw_text( argument1,argument2+i*20,"AnimCount: "+string(ds_map_size(argument0[SK_ANIMATIONSTATE.animations])) );
i++;
draw_text( argument1,argument2+i*20,"playbackRate: "+string(argument0[SK_ANIMATIONSTATE.playbackRate]) );
i++;
draw_text( argument1,argument2+i*20,"mixSpeedDefault: "+string(argument0[SK_ANIMATIONSTATE.mixSpeedDefault]) );
i++;
draw_text( argument1,argument2+i*20,"mixAlpha: "+string(argument0[SK_ANIMATIONSTATE.mixAlpha]) );
i++;
draw_text( argument1,argument2+i*20,"animation_previous: "+string(argument0[SK_ANIMATIONSTATE.animation_previous]) );
i++;
draw_text( argument1,argument2+i*20,"     time: "+string(argument0[SK_ANIMATIONSTATE.animation_previous_time]) );
i++;
draw_text( argument1,argument2+i*20,"animation_current: "+string(argument0[SK_ANIMATIONSTATE.animation_current]) );
i++;
draw_text( argument1,argument2+i*20,"     time: "+string(argument0[SK_ANIMATIONSTATE.animation_current_time]) );
i++;
draw_text( argument1,argument2+i*20,"animation_next: "+string(argument0[SK_ANIMATIONSTATE.animation_next]) );
i++;
draw_text( argument1,argument2+i*20,"     time: "+string(argument0[SK_ANIMATIONSTATE.animation_next_time]) );