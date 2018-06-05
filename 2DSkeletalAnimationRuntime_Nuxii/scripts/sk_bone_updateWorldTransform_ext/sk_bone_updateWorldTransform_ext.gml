gml_pragma("forceinline");
/// @desc update world transform of supplied bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
var sk_previous_transformMode = argument0[SK_BONE.transformMode];
// set new applied data
argument0[@ SK_BONE.XApplied] = argument1;
argument0[@ SK_BONE.YApplied] = argument2;
argument0[@ SK_BONE.XScaleApplied] = argument3;
argument0[@ SK_BONE.YScaleApplied] = argument4;
argument0[@ SK_BONE.XShearApplied] = argument5;
argument0[@ SK_BONE.YShearApplied] = argument6;
argument0[@ SK_BONE.rotationApplied] = argument7;
argument0[@ SK_BONE.transformMode] = argument8;
// update bone with new transforms
sk_bone_updateWorldTransform(argument0);
// preserve transform mode
argument0[@ SK_BONE.transformMode] = sk_previous_transformMode;