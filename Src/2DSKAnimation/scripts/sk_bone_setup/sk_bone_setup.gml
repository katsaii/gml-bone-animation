__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied bone
/// @param bone
array_copy(argument0,sk_data_bone.appliedStart,argument0,sk_data_bone.setupStart,sk_data_bone.poseLength);
argument0[@ sk_data_bone.invalidAppliedTransform] = false;