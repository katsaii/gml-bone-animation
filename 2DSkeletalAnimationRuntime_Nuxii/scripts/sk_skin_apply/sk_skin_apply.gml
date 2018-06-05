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
	for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_skin_record_length){
		var sk_slot = sk_displays[| sk_display_id+sk_skin_record_slot];
		switch(sk_struct_get_type(sk_slot)){
			case sk_type_slot: sk_slot_attachments_clear(sk_slot); break;
			case sk_type_symbol: sk_symbol_attachments_clear(sk_slot); break;
		}
	}
}
// add new attachments
for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_skin_record_length){
	var sk_slot = sk_displays[| sk_display_id+sk_skin_record_slot];
	var sk_attachment = sk_displays[| sk_display_id+sk_skin_record_attachment];
	// remap attachment
	if(sk_struct_type_exists(sk_struct_get_type(sk_attachment))){
		var sk_attachmentName = sk_struct_get_name(sk_attachment); // this is used as a key to remap the attachment to another
		var sk_remap_count = ds_list_size(sk_remapStack);
		for(var sk_remap_id = 0; sk_remap_id < sk_remap_count; sk_remap_id++){
			var sk_remap = sk_remaps[? sk_remapStack[| sk_remap_id]];
			if(is_real(sk_remap)&&ds_exists(sk_remap,ds_type_map)){
				if(ds_map_exists(sk_remap,sk_attachmentName)){
					// update attachment
					sk_attachment = sk_remap[? sk_attachmentName];
				}	// otherwise ignore remap
			}
		}
	}
	// add final attachment to slot
	switch(sk_struct_get_type(sk_slot)){
		case sk_type_slot: sk_slot_attachments_add(sk_slot,sk_attachment,sk_displays[| sk_display_id+sk_skin_record_attachmentKey]); break;
		case sk_type_symbol: sk_symbol_attachments_add(sk_slot,sk_attachment,sk_displays[| sk_display_id+sk_skin_record_attachmentKey]); break;
	}
}