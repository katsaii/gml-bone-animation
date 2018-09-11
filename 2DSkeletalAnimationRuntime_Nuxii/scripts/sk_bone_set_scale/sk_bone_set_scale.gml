gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xscale
/// @param yscale
argument0[@ SK_BONE.XScale] = is_real(argument1) ? argument1 : 1;
argument0[@ SK_BONE.YScale] = is_real(argument2) ? argument2 : 1;