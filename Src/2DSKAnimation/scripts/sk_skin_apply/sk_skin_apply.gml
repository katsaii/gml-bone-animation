/// @desc Attachments from the new skin are attached to the corresponding slots in the form of a list known as the "displayData"
/// @param skin
/// @param clear
var sk_obj = argument[0];
var sk_displays = sk_obj[sk_data_skin.displays];
var sk_display_last = ds_list_size(sk_displays);
var sk_display_id;
if(argument[1]){
	// clear previous slot attachments
	var sk_empty_map = ds_map_create();
	for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id++){
		var sk_display = sk_displays[| sk_display_id];
		sk_renderable_set_attachments(sk_display[0],sk_empty_map);
	}
	ds_map_destroy(sk_empty_map);
}
// add new attachments
var sk_attachment_map = ds_map_create();
for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id++){
	var sk_display = sk_displays[| sk_display_id];
	var sk_slot = sk_display[0];
	// add final attachment to slot
	sk_renderable_get_attachments(sk_slot,sk_attachment_map);
	sk_attachment_map[? sk_display[2]] = sk_display[1];
	sk_renderable_set_attachments(sk_slot,sk_attachment_map);
}
ds_map_destroy(sk_attachment_map);