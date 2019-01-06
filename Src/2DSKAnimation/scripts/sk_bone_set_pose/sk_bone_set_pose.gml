__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
#macro SK_TRANSFORM_MODE_NONE 0
#macro SK_TRANSFORM_MODE_SCALE (1<<0)
#macro SK_TRANSFORM_MODE_ROTATE (1<<1)
#macro SK_TRANSFORM_MODE_TRANSLATE (1<<2) /* translate, skew, and reflection are passive flags meaning they are not required */
#macro SK_TRANSFORM_MODE_SKEW (1<<3) /* skewing transforms are a type of scale inheritance (not to be confused with shear transforms) */
#macro SK_TRANSFORM_MODE_NORMAL (SK_TRANSFORM_MODE_SCALE|SK_TRANSFORM_MODE_ROTATE|SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW)
#macro SK_TRANSFORM_MODE_NOROTATION (SK_TRANSFORM_MODE_SCALE|SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW)
#macro SK_TRANSFORM_MODE_NOSCALE (SK_TRANSFORM_MODE_ROTATE|SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW)
#macro SK_TRANSFORM_MODE_NOROTATIONORSCALE (SK_TRANSFORM_MODE_TRANSLATE|SK_TRANSFORM_MODE_SKEW)
#macro SK_TRANSFORM_MODE_EX_SPRITER (SK_TRANSFORM_MODE_NORMAL&(~SK_TRANSFORM_MODE_SKEW)) /* spriter specific transformMode */
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
argument0[@ sk_data_bone.setupX] = real(argument1);
argument0[@ sk_data_bone.setupY] = real(argument2);
argument0[@ sk_data_bone.setupXScale] = is_real(argument8) ? argument3 : 1;
argument0[@ sk_data_bone.setupYScale] = is_real(argument8) ? argument4 : 1;
argument0[@ sk_data_bone.setupXShear] = real(argument5);
argument0[@ sk_data_bone.setupYShear] = real(argument6);
argument0[@ sk_data_bone.setupRotation] = real(argument7);
argument0[@ sk_data_bone.setupTransformMode] = real(argument8);