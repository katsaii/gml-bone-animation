/// @desc sets the offsets of the point attachment
/// @param attachment
/// @param x
/// @param y
/// @param rotation
argument0[@ SK_ATTACHMENT_POINT.X] = real(argument1);
argument0[@ SK_ATTACHMENT_POINT.Y] = real(argument2);
argument0[@ SK_ATTACHMENT_POINT.rotation] = -angle_difference(0,real(argument3));