/// @desc builds the applied data for this bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
var sk_pose = argument0[sk_bone_var_appliedTransform];
sk_pose[@ 0] = real(argument1);
sk_pose[@ 1] = real(argument2);
sk_pose[@ 2] = is_real(argument8) ? argument3 : 1;
sk_pose[@ 3] = is_real(argument8) ? argument4 : 1;
sk_pose[@ 4] = real(argument5);
sk_pose[@ 5] = real(argument6);
sk_pose[@ 6] = real(argument7);
sk_pose[@ 7] = is_real(argument8) ? argument8 : sk_transformMode_normal;