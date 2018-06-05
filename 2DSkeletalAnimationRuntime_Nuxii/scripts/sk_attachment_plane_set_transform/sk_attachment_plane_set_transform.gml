/// @desc uses data supplied to fill the 3x2 transformation matrix for the attachment
/// @param attachment
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
var sk_rotationX = argument7+argument5;
var sk_rotationY = argument7+argument6+90;
argument0[@ SK_ATTACHMENT_PLANE.X] = argument1;
argument0[@ SK_ATTACHMENT_PLANE.Y] = argument2;
argument0[@ SK_ATTACHMENT_PLANE.m00] = dcos(sk_rotationX)*argument3;
argument0[@ SK_ATTACHMENT_PLANE.m01] = -dsin(sk_rotationX)*argument3;
argument0[@ SK_ATTACHMENT_PLANE.m10] = dcos(sk_rotationY)*-argument4;
argument0[@ SK_ATTACHMENT_PLANE.m11] = -dsin(sk_rotationY)*-argument4;