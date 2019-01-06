__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
gml_pragma("forceinline");
/// @desc setup
/// @param slot
array_copy(argument0,sk_data_slot.appliedColour,argument0,sk_data_slot.setupColour,sk_data_slot.appliedColour-sk_data_slot.setupColour);