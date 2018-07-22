/// @desc gets or sets a property
/// @param slot
/// @param [col]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_SLOT.colour];
}	// set
	sk_struct[@ SK_SLOT.colour] = real(argument[1]);
	return undefined;