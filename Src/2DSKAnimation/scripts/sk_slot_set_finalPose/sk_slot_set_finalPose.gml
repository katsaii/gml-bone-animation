/// @desc builds the final data for this slot
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment
argument0[@ sk_slot_var_finalPose] = [
	real(argument1),
	real(argument2),
	sk_object_oftype(argument1,sk_type_bone) ? argument3 : undefined,
	sk_object_ofclass(argument1,sk_class_attachment) ? argument4 : undefined
];