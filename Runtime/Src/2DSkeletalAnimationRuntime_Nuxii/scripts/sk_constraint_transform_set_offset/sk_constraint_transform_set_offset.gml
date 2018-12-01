gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param yshear
/// @param rotation
argument0[@ SK_CONSTRAINT_TRANSFORM.X] = real(argument1);
argument0[@ SK_CONSTRAINT_TRANSFORM.Y] = real(argument2);
argument0[@ SK_CONSTRAINT_TRANSFORM.XScale] = is_real(argument3) ? argument3 : 1;
argument0[@ SK_CONSTRAINT_TRANSFORM.YScale] = is_real(argument4) ? argument4 : 1;
argument0[@ SK_CONSTRAINT_TRANSFORM.YShear] = -angle_difference(0,real(argument5));
argument0[@ SK_CONSTRAINT_TRANSFORM.rotation] = -angle_difference(0,real(argument6));