/// @desc gets or sets a property
/// @param slot
/// @param [attachment]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_SLOT.attachmentFinal];
}	// set
	sk_struct[@ SK_SLOT.attachmentFinal] = argument[1];
	return undefined;