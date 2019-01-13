gml_pragma("global","sk_physics_environment_set_drive(1);");
/// @desc sets the current physics drive
/// @param amount
global.sk_physics_environment_drive = is_real(argument0) ? clamp(argument0,0,1) : 1;