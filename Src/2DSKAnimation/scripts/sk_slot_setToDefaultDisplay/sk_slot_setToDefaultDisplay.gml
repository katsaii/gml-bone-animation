/// @desc sets the default attachment display
/// @param slot
var sk_setupPose = argument0[sk_slot_var_setupPose];
sk_setupPose[@ 3] = ds_map_find_value(argument0[sk_slot_var_availableAttachments],argument0[sk_slot_var_defaultAttachmentKey]);