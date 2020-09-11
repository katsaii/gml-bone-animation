__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[sk_data_bone.parent];
sk_bone_set_parent(argument0,argument1);
sk_bone_update_applied(argument0);
argument0[@ sk_data_bone.parent] = sk_parent;
argument0[@ sk_data_bone.invalidAppliedTransform] = true;