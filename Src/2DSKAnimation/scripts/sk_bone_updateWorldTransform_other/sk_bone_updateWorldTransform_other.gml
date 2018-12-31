gml_pragma("forceinline");
/// @desc update world transform of supplied bone relative to a supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[sk_bone_var_parent];
sk_bone_set_parent(argument0,argument1);
sk_bone_updateWorldTransform(argument0);
argument0[@ sk_bone_var_parent] = sk_parent;
argument0[@ sk_bone_var_invalidAppliedTransform] = true;