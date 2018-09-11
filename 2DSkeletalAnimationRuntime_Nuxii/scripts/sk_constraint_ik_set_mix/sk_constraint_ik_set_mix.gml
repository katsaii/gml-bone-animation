gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ SK_CONSTRAINT_IK.bendDir] = (argument1==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
argument0[@ SK_CONSTRAINT_IK.weight] = real(argument2);