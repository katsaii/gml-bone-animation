__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc sets a property
/// @param attachment
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
argument0[@ sk_data_plane_attachment.X] = real(argument1);
argument0[@ sk_data_plane_attachment.Y] = real(argument2);
var sk_xscale = is_real(argument3) ? argument3 : 1;
var sk_yscale = is_real(argument4) ? argument4 : 1;
var sk_rotation = real(argument7);
var sk_rotationX = sk_rotation+real(argument5);
var sk_rotationY = sk_rotation+real(argument6)+90;
argument0[@ sk_data_plane_attachment.m00] = dcos(sk_rotationX)*sk_xscale;
argument0[@ sk_data_plane_attachment.m01] = -dsin(sk_rotationX)*sk_xscale;
argument0[@ sk_data_plane_attachment.m10] = dcos(sk_rotationY)*-sk_yscale;
argument0[@ sk_data_plane_attachment.m11] = -dsin(sk_rotationY)*-sk_yscale;