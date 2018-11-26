gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xscale
/// @param yscale
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.XScaleApplied] = is_real(argument1) ? argument1 : 1;
argument0[@ SK_BONE.YScaleApplied] = is_real(argument2) ? argument2 : 1;