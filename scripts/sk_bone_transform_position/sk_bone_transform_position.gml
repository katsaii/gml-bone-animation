__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc takes a 2d vector and transforms it
/// @param bone
/// @param x
/// @param y
return [
	argument1[sk_data_bone.worldX]+argument0[sk_data_bone.m00]*argument1+argument0[sk_data_bone.m10]*argument2,
	argument0[sk_data_bone.worldY]+argument0[sk_data_bone.m01]*argument1+argument0[sk_data_bone.m11]*argument2
];