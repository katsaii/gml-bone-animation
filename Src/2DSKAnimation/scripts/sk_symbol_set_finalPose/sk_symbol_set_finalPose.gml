/// @desc builds the final data for this slot
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment
var sk_state = argument0[sk_symbol_var_worldState];
sk_state[@ 0] = real(argument1);
sk_state[@ 1] = real(argument2);
sk_state[@ 2] = sk_object_oftype(argument3,sk_type_bone) ? argument3 : undefined;
sk_state[@ 3] = sk_object_ofclass(argument4,sk_class_attachment) ? argument4 : undefined;