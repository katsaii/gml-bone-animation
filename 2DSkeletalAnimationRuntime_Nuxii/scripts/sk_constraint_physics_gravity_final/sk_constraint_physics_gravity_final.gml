/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param direction
var sk_struct = argument0;
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
sk_struct[@ SK_CONSTRAINT_PHYSICS.XGravFinal] = sk_magnitude*dcos(sk_direction);
sk_struct[@ SK_CONSTRAINT_PHYSICS.YGravFinal] = -sk_magnitude*dsin(sk_direction);
return undefined;