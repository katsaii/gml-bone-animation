gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param angle
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.rotationApplied] = -angle_difference(0,real(argument1));