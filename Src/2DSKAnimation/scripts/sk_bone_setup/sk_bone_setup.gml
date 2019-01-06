__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied bone
/// @param bone
array_copy(argument0,sk_data_bone.appliedX,argument0,sk_data_bone.setupX,sk_data_bone.appliedX-sk_data_bone.setupX);
argument0[@ sk_data_bone.invalidAppliedTransform] = false;