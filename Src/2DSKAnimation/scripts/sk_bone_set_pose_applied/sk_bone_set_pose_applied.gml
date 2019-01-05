SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
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
argument0[@ sk_data_bone.appliedX] = real(argument1);
argument0[@ sk_data_bone.appliedY] = real(argument2);
argument0[@ sk_data_bone.appliedXScale] = is_real(argument8) ? argument3 : 1;
argument0[@ sk_data_bone.appliedYScale] = is_real(argument8) ? argument4 : 1;
argument0[@ sk_data_bone.appliedXShear] = real(argument5);
argument0[@ sk_data_bone.appliedYShear] = real(argument6);
argument0[@ sk_data_bone.appliedRotation] = real(argument7);
argument0[@ sk_data_bone.appliedTransformMode] = real(argument8);