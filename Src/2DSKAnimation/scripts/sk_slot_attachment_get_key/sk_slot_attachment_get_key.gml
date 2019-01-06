/// @desc returns whether the slot has the supplied attachment in its map
/// @param slot
/// @param attachment
var sk_availableAttachments = argument0[sk_data_slot.availableAttachments];
var sk_key = ds_map_find_first(sk_availableAttachments);
repeat(ds_map_size(sk_availableAttachments)){
	var sk_attachment = sk_availableAttachments[? sk_key];
	if(sk_attachment==argument1){
		return sk_key;
	}
	// next
	sk_key = ds_map_find_next(argument1,sk_key);
}
return undefined;