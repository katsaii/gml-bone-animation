gml_pragma("global","sk_physics_environment_set_gravity(0,0);");
/// @desc sets the current physics gravity
/// @param gravity
/// @param direction
var sk_magnitude = real(argument0);
var sk_direction = real(argument1);
global.sk_physics_environment_gravity_x = sk_magnitude*dcos(sk_direction);
global.sk_physics_environment_gravity_y = -sk_magnitude*dsin(sk_direction);