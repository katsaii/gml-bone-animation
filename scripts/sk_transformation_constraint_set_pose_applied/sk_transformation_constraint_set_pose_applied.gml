__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
argument0[@ sk_data_transformation_constraint.appliedMixTranslate] = real(argument1);
argument0[@ sk_data_transformation_constraint.appliedMixScale] = real(argument2);
argument0[@ sk_data_transformation_constraint.appliedMixShear] = real(argument3);
argument0[@ sk_data_transformation_constraint.appliedMixRotate] = real(argument4);