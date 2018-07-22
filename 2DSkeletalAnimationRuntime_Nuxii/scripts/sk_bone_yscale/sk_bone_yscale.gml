/// @desc gets or sets a property
/// @param bone
/// @param [yscale]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_BONE.YScale];
}	// set
	sk_struct[@ SK_BONE.YScale] = real(argument[1]);
	return undefined;