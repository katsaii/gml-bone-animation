/// @desc gets or sets a property
/// @param slot
/// @param [bone]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_SLOT.bone];
}	// set
	sk_struct[@ SK_SLOT.bone] = argument[1];
	return undefined;