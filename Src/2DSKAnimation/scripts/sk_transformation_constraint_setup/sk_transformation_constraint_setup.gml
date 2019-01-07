__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied constraint
/// @param constraint
array_copy(argument0,sk_data_transformation_constraint.appliedMixTranslate,argument0,sk_data_transformation_constraint.setupMixTranslate,sk_data_transformation_constraint.appliedMixTranslate-sk_data_transformation_constraint.setupMixTranslate);