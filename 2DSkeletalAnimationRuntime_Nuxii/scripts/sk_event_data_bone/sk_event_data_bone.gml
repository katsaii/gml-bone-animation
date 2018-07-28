/// @desc gets or sets a property
/// @param attachment
/// @param [bone]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_EVENT.dBone];
}	// set
	sk_struct[@ SK_EVENT.dBone] = argument[1];
	return undefined;