gml_pragma("forceinline");
/// @desc sets a property
/// @param attachment
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
argument0[@ SK_ATTACHMENT_PLANE.X] = real(argument1);
argument0[@ SK_ATTACHMENT_PLANE.Y] = real(argument2);
var sk_xscale = is_real(argument3) ? argument3 : 1;
var sk_yscale = is_real(argument4) ? argument4 : 1;
var sk_rotation = real(argument7);
var sk_rotationX = sk_rotation+real(argument5);
var sk_rotationY = sk_rotation+real(argument6)+90;
argument0[@ SK_ATTACHMENT_PLANE.m00] = dcos(sk_rotationX)*sk_xscale;
argument0[@ SK_ATTACHMENT_PLANE.m01] = -dsin(sk_rotationX)*sk_xscale;
argument0[@ SK_ATTACHMENT_PLANE.m10] = dcos(sk_rotationY)*-sk_yscale;
argument0[@ SK_ATTACHMENT_PLANE.m11] = -dsin(sk_rotationY)*-sk_yscale;