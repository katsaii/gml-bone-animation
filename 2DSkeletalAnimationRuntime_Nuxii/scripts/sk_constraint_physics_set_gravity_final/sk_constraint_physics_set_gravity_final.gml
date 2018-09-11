gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param direction
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ SK_CONSTRAINT_PHYSICS.XGravFinal] = sk_magnitude*dcos(sk_direction);
argument0[@ SK_CONSTRAINT_PHYSICS.YGravFinal] = -sk_magnitude*dsin(sk_direction);