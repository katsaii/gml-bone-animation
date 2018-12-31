/// @desc builds the applied data for this bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
argument0[@ sk_bone_var_appliedTransform] = [
	real(argument1),
	real(argument2),
	is_real(argument3) ? argument3 : 1,
	is_real(argument4) ? argument4 : 1,
	real(argument5),
	real(argument6),
	real(argument7),
	is_real(argument8) ? argument8 : sk_transformMode_normal
];