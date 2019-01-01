/// @desc builds the setup data for this slot
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment
argument0[@ sk_symbol_var_defaultColour] = real(argument1);
argument0[@ sk_symbol_var_defaultAlpha] = real(argument2);
argument0[@ sk_symbol_var_defaultBone] = sk_object_oftype(argument3,sk_type_bone) ? argument3 : undefined;
argument0[@ sk_symbol_var_defaultAttachment] = sk_object_ofclass(argument4,sk_class_attachment) ? argument4 : undefined;