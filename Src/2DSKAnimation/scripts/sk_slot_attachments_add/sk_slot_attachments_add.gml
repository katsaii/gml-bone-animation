gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
/// @param key
/// @param attachment
return ds_map_set(argument0[sk_slot_var_availableAttachments],argument1,sk_object_ofclass(argument2,sk_class_attachment) ? argument2 : undefined);