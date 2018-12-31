gml_pragma("forceinline");
/// @desc finds the attachment at the position
/// @param slot
/// @param key
var sk_finalPose = argument0[sk_slot_var_finalPose];
sk_finalPose[@ 3] = ds_map_find_value(argument0[sk_slot_var_availableAttachments],argument1);