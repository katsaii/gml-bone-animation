SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc sets a property
/// @param bone
/// @param parent
argument0[@ sk_data_bone.parent] = sk_bone_exists(argument1) ? argument1 : undefined;