#macro sk_transformMode_scale (1<<0)
#macro sk_transformMode_rotate (1<<1)
#macro sk_transformMode_translate (1<<2) /* translate, skew, and reflection are passive flags meaning they are not required */
#macro sk_transformMode_skew (1<<3) /* skewing transforms are a type of scale inheritance (not to be confused with shear transforms) */
#macro sk_transformMode_normal (sk_transformMode_scale|sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noRotation (sk_transformMode_scale|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScale (sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScaleOrRotation (sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_none 0
#macro sk_transformMode_ex_spriter (sk_transformMode_normal&(~sk_transformMode_skew)) /* spriter specific transformMode */
/// @desc builds the setup data for this bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
var sk_pose = argument0[sk_bone_var_setupTransform];
sk_pose[@ 0] = real(argument1);
sk_pose[@ 1] = real(argument2);
sk_pose[@ 2] = is_real(argument8) ? argument3 : 1;
sk_pose[@ 3] = is_real(argument8) ? argument4 : 1;
sk_pose[@ 4] = real(argument5);
sk_pose[@ 5] = real(argument6);
sk_pose[@ 6] = real(argument7);
sk_pose[@ 7] = is_real(argument8) ? argument8 : sk_transformMode_normal;