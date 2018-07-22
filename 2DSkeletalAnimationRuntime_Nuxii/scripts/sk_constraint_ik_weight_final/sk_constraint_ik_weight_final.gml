/// @desc gets or sets a property
/// @param constraint
/// @param [bendDir]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_IK.weightFinal];
}	// set
	sk_struct[@ SK_CONSTRAINT_IK.weightFinal] = real(argument[1]);
	return undefined;