gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param direction
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ SK_CONSTRAINT_PHYSICS.XGrav] = sk_magnitude*dcos(sk_direction);
argument0[@ SK_CONSTRAINT_PHYSICS.YGrav] = -sk_magnitude*dsin(sk_direction);