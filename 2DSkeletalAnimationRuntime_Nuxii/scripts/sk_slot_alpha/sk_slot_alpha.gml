/// @desc gets or sets a property
/// @param slot
/// @param [alpha]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_SLOT.alpha];
}	// set
	sk_struct[@ SK_SLOT.alpha] = real(argument[1]);
	return undefined;