gml_pragma("forceinline");
/// @desc update world transform of supplied bone relative to a supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[SK_BONE.parent];
// set temporary parent
argument0[@ SK_BONE.parent] = argument1;
// update bone with new parent
sk_bone_updateWorldTransform(argument0);
// revert parent
argument0[@ SK_BONE.parent] = sk_parent;
// set to bad applied since the parent changed
argument0[@ SK_BONE.badApplied] = true;