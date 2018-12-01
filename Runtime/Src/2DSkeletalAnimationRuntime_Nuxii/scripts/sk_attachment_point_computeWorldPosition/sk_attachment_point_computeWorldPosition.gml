/// @desc computes the world position of the attachment using the supplied bone
/// @param attachment
/// @param bone
var sk_x = argument0[SK_ATTACHMENT_POINT.X];
var sk_y = argument0[SK_ATTACHMENT_POINT.Y];
return[
	sk_bone_transform_position_x(argument1,sk_x,sk_y),
	sk_bone_transform_position_y(argument1,sk_x,sk_y)
];