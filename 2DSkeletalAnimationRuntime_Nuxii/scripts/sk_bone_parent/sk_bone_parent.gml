/// @desc gets or sets a property
/// @param bone
/// @param [parent]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_BONE.parent];
}	// set
	sk_struct[@ SK_BONE.parent] = argument[1];
	return undefined;