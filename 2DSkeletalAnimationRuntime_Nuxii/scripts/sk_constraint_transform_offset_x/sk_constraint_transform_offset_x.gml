/// @desc gets or sets a property
/// @param constraint
/// @param [x]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_TRANSFORM.X];
}	// set
	sk_struct[@ SK_CONSTRAINT_TRANSFORM.X] = real(argument[1]);
	return undefined;