/// @desc clears the physics state
/// @param id
var sk_state = global.sk_physics_environment_states[? argument0];
if(sk_state!=undefined){
	ds_list_destroy(sk_state);
	ds_map_delete(global.sk_physics_environment_states,argument0);
}