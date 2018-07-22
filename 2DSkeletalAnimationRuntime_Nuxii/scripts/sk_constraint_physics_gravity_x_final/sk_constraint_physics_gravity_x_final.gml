/// @desc gets or sets a property
/// @param constraint
/// @param [x]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_PHYSICS.XGravFinal];
}	// set
	sk_struct[@ SK_CONSTRAINT_PHYSICS.XGravFinal] = real(argument[1]);
	return undefined;