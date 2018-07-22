/// @desc gets or sets a property
/// @param slot
/// @param [attachmentKey]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_SLOT.defaultAttachmentKey];
}	// set
	sk_struct[@ SK_SLOT.defaultAttachmentKey] = argument[1]; // this is used to lookup the default display attachment
	return undefined;