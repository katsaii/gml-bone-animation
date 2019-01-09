__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
ds_list_copy(argument1,argument0[sk_data_event_timeline.keyframes]);