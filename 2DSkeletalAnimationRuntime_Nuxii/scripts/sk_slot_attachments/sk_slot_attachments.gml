/// @desc gets or sets a property
/// @param slot
/// @param key
/// @param [attachment]
var sk_struct = argument[0];
var sk_key = argument[1];
if(argument_count<3){
	// get
	return ds_map_find_value(sk_struct[SK_SLOT.availableAttachments],sk_key);
}	// set
	ds_map_add(sk_struct[SK_SLOT.availableAttachments],sk_key,argument[2]); // sets an attachment to a specific display within the slot's displayData map
	return undefined;