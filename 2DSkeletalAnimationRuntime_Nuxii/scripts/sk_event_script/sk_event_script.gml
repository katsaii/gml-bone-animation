/// @desc gets or sets a property
/// @param attachment
/// @param [id]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_EVENT.callingScript];
}	// set
	sk_struct[@ SK_EVENT.callingScript] = argument[1];
	return undefined;