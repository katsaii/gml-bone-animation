/// @desc Attachments from the new skin are attached to the corresponding slots in the form of a list known as the "displayData"
/// @param skin
/// @param clear
var sk_displays = argument0[SK_SKIN.displays];
var sk_remaps = argument0[SK_SKIN.remaps];
var sk_remapStack = argument0[SK_SKIN.remapStack];
var sk_display_last = ds_list_size(sk_displays);
var sk_display_id;
if(argument1){
	// clear previous slot attachments
	for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_tuple_skinRecord_ENTRIES){
		var sk_slot = sk_displays[| sk_display_id+sk_tuple_skinRecord_slot];
		if(SK_CONFIG_RELEASE_MODE||sk_struct_exists(sk_slot,sk_type_slot)){
			sk_slot_clear_attachments(sk_slot);
		}
	}
}
// add new attachments
for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_tuple_skinRecord_ENTRIES){
	var sk_slot = sk_displays[| sk_display_id+sk_tuple_skinRecord_slot];
	var sk_attachment = sk_displays[| sk_display_id+sk_tuple_skinRecord_attachment];
	var sk_attachmentKey = sk_displays[| sk_display_id+sk_tuple_skinRecord_attachmentKey];
	// remap attachment
	var sk_remap_count = ds_list_size(sk_remapStack);
	var sk_attachment_input = sk_attachment;
	for(var sk_remap_id = 0; sk_remap_id < sk_remap_count; sk_remap_id++){
		var sk_remap = sk_remaps[? sk_remapStack[| sk_remap_id]];
		if(is_real(sk_remap)&&ds_exists(sk_remap,ds_type_map)){
			if(ds_map_exists(sk_remap,sk_attachment_input)){
				// update attachment
				sk_attachment = sk_remap[? sk_attachment_input];
			}	// otherwise ignore remap
		}
	}
	// add final attachment to slot
	if(SK_CONFIG_RELEASE_MODE||sk_struct_exists(sk_slot,sk_type_slot)){
		sk_slot_add_attachment(sk_slot,sk_attachmentKey,sk_attachment);
	}
}