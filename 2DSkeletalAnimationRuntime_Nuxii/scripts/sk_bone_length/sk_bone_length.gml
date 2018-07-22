/// @desc gets or sets a property
/// @param bone
/// @param [length]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_BONE.length];
}	// set
	sk_struct[@ SK_BONE.length] = max(real(argument[1]),0.01);
	return undefined;