/// @desc draw UI
var state = "";
if(instance_exists(obj_demoState_benchmark)){
	state = "benchmark";
} else if(instance_exists(obj_demoState_view)){
	state = "view";
} else if(instance_exists(obj_demoState_atlas)){
	state = "atlas";
}
var i = 1;
draw_text(10,20*i,"Tab - switch between benchmarking and viewing"); i++;
draw_text(10,20*i,"S - load a new skeleton"); i++;
draw_text(10,20*i,"A - load a new atlas"); i++;
draw_text(10,20*i,"Z - iterate through available atlases"); i++;
draw_text(10,20*i,"X - iterate through available armatures"); i++;
draw_text(10,20*i,"State: "+state); i++;
draw_text(10,20*i,"FPS: "+string(fps)); i++;
draw_text(10,20*i,"FPS_REAL: "+string(fps_real)); i++;
draw_text(10,20*i,"Current_armature: "+string(sk_struct_isof(global.current_ske,sk_type_armature) ? sk_struct_get_name(global.current_ske) : "N/A")); i++;
draw_text(10,20*i,"Current_atlas: "+string(sk_struct_isof(global.current_atlas,sk_type_atlas) ? sk_struct_get_name(global.current_atlas) : "N/A")); i++;