__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_point_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param x
/// @param y
/// @param rotation
argument0[@ sk_data_point_attachment.offsetX] = real(argument1);
argument0[@ sk_data_point_attachment.offsetY] = real(argument2);
argument0[@ sk_data_point_attachment.offsetRotation] = -angle_difference(0,real(argument3));