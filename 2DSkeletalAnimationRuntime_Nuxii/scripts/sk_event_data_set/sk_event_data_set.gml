gml_pragma("forceinline");
/// @desc sets a property
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
argument0[@ SK_EVENT.dBone] = argument1;
argument0[@ SK_EVENT.dString] = string(argument2);
argument0[@ SK_EVENT.dReal] = real(argument3);
argument0[@ SK_EVENT.dInt] = int64(argument4);
argument0[@ SK_EVENT.dSound] = is_real(argument5) ? argument5 : -1;