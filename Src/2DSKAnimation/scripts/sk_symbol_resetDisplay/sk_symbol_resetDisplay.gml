/// @desc sets the default attachment display
/// @param slot
var sk_state = argument0[sk_symbol_var_setupState];
sk_state[@ 3] = ds_map_find_value(argument0[sk_symbol_var_availableAttachments],argument0[sk_symbol_var_defaultAttachmentKey]);