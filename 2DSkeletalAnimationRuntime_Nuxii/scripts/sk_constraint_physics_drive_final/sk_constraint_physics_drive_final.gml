/// @desc gets or sets a property
/// @param constraint
/// @param [ratio]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_PHYSICS.driveFinal];
}	// set
	sk_struct[@ SK_CONSTRAINT_PHYSICS.driveFinal] = clamp(real(argument[1]),0,1);
	return undefined;