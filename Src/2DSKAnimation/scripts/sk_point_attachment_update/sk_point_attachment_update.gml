__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc wrapper for computing the point transform for this attachment
/// @param attachment
/// @param bone
var sk_pos = sk_bone_transform_position(
	argument1,
	argument0[sk_data_point_attachment.offsetX],
	argument0[sk_data_point_attachment.offsetY]
);
var sk_rotation = sk_bone_transform_rotation(
	argument1,
	argument0[sk_data_point_attachment.offsetRotation]
);
argument0[@ sk_data_point_attachment.worldX] = sk_pos[0];
argument0[@ sk_data_point_attachment.worldY] = sk_pos[1];
argument0[@ sk_data_point_attachment.worldRotation] = sk_rotation;