__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
argument0[@ sk_data_transformation_constraint.setupMixTranslate] = real(argument1);
argument0[@ sk_data_transformation_constraint.setupMixScale] = real(argument2);
argument0[@ sk_data_transformation_constraint.setupMixShear] = real(argument3);
argument0[@ sk_data_transformation_constraint.setupMixRotate] = real(argument4);