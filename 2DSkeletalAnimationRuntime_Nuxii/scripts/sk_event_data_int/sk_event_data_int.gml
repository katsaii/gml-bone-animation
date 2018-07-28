/// @desc gets or sets a property
/// @param attachment
/// @param [value]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_EVENT.dInt];
}	// set
	sk_struct[@ SK_EVENT.dInt] = int64(argument[1]);
	return undefined;