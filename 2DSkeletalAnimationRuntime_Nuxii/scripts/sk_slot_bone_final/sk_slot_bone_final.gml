/// @desc gets or sets a property
/// @param slot
/// @param [bone]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_SLOT.boneFinal];
}	// set
	sk_struct[@ SK_SLOT.boneFinal] = argument[1];
	return undefined;