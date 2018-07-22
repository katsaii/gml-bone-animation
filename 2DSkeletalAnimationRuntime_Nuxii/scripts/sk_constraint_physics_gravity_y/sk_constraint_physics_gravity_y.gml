/// @desc gets or sets a property
/// @param constraint
/// @param [y]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_PHYSICS.YGrav];
}	// set
	sk_struct[@ SK_CONSTRAINT_PHYSICS.YGrav] = real(argument[1]);
	return undefined;