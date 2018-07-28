/// @desc gets or sets a property
/// @param attachment
/// @param [value]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_EVENT.dReal];
}	// set
	sk_struct[@ SK_EVENT.dReal] = real(argument[1]);
	return undefined;