__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc sets the availbale attacment map
/// @param slot
/// @param id
var sk_availableAttachments = argument0[sk_data_slot.availableAttachments];
ds_map_clear(sk_availableAttachments);
var sk_key = ds_map_find_first(argument1);
repeat(ds_map_size(argument1)){
	var sk_attachment = argument1[? sk_key];
	if(sk_attachment_exists(sk_attachment)){
		sk_availableAttachments[? sk_key] = sk_attachment;
	}
	// next
	sk_key = ds_map_find_next(argument1,sk_key);
}
argument0[@ sk_data_slot.setupAttachment] = ds_map_find_value(sk_availableAttachments,argument0[sk_data_slot.setupAttachmentKey]);