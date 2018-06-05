/// @desc append display data to the skin
/// @param skin
/// @param slotOrSymbol
/// @param attachment
/// @param key
var sk_displays = argument0[SK_SKIN.displays];
var sk_id = max(ds_list_size(sk_displays) div sk_skin_record_length,0)*sk_skin_record_length; // make sure it is a multiple of the record length
sk_displays[| sk_id+sk_skin_record_slot] = argument1;
sk_displays[| sk_id+sk_skin_record_attachment] = argument2;
sk_displays[| sk_id+sk_skin_record_attachmentKey] = argument3;