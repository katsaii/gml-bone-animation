/// @desc draws debug data
/// @param animationState
/// @param x
/// @param y
var i = 0;
draw_text( argument1,argument2+i*20,"count: "+string(ds_map_size(argument0[SK_ANIMATIONSTATE.animations])) );
i++;
draw_text( argument1,argument2+i*20,"timescale: "+string(argument0[SK_ANIMATIONSTATE.timescale]) );
i++;
draw_text( argument1,argument2+i*20,"mixSpeedDefault: "+string(argument0[SK_ANIMATIONSTATE.mixSpeedDefault]) );
i++;
draw_text( argument1,argument2+i*20,"queueLength: "+string(ds_list_size(argument0[SK_ANIMATIONSTATE.animationQueue])) );
i++;
draw_text( argument1,argument2+i*20,"animCurrent: "+string(argument0[SK_ANIMATIONSTATE.animationCurrent]) );
i++;
draw_text( argument1,argument2+i*20,"mixSpeedCurrent: "+string(argument0[SK_ANIMATIONSTATE.animationMixSpeedCurrent]) );
i++;
draw_text( argument1,argument2+i*20,"time: "+string(argument0[SK_ANIMATIONSTATE.timerTime]) );
i++;
draw_text( argument1,argument2+i*20,"timeLast: "+string(argument0[SK_ANIMATIONSTATE.timerTimeLast]) );