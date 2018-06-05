gml_pragma("forceinline");
/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[SK_BONE.parent];
// set temporary parent
argument0[@ SK_BONE.parent] = argument1;
// get applied transform relative to new bone
sk_bone_updateAppliedTransform(argument0);
// revert parent
argument0[@ SK_BONE.parent] = sk_parent;
// set to bad applied since the parent changed
argument0[@ SK_BONE.badApplied] = true;