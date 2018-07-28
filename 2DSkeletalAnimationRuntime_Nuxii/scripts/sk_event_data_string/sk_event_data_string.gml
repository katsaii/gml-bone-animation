/// @desc gets or sets a property
/// @param attachment
/// @param [string]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_EVENT.dString];
}	// set
	sk_struct[@ SK_EVENT.dString] = string(argument[1]);
	return undefined;