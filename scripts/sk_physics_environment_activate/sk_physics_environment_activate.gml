gml_pragma("global",@'
	global.sk_physics_environment_states = ds_map_create();
	sk_physics_environment_activate("default",0,0);
');
/// @desc sets the current physics state
/// @param id
/// @param dx
/// @param dy
var sk_state = global.sk_physics_environment_states[? argument0];
if(sk_state==undefined){
	sk_state = ds_list_create();
	ds_map_add_list(global.sk_physics_environment_states,argument0,sk_state);
}
global.sk_physics_environment_state = sk_state;
global.sk_physics_environment_displacement_x = real(argument1);
global.sk_physics_environment_displacement_y = real(argument2);