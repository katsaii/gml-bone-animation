/// @desc gets or sets a property
/// @param constraint
/// @param [enabled]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_IK.chain];
}	// set
	sk_struct[@ SK_CONSTRAINT_IK.chain] = bool(argument[1]);
	return undefined;