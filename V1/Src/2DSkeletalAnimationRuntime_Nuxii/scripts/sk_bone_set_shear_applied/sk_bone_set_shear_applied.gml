gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xshear
/// @param yshear
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.XShearApplied] = -angle_difference(0,real(argument1));
argument0[@ SK_BONE.YShearApplied] = -angle_difference(0,real(argument2));