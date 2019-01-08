__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param animation
/// @param id
ds_list_copy(argument1,argument0[sk_data_animation.timelines]);