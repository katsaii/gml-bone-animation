/// @desc builds the setup data for this slot
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment
argument0[@ sk_slot_var_setupPose] = [
	real(argument1),
	real(argument2),
	sk_object_oftype(argument3,sk_type_bone) ? argument3 : undefined,
	sk_object_ofclass(argument4,sk_class_attachment) ? argument4 : undefined
];