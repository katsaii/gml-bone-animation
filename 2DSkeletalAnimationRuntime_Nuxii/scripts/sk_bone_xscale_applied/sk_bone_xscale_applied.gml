/// @desc gets or sets a property
/// @param bone
/// @param [xscale]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_BONE.XScaleApplied];
}	// set
	sk_struct[@ SK_BONE.badApplied] = true; // update applied flag
	sk_struct[@ SK_BONE.XScaleApplied] = real(argument[1]);
	return undefined;