/// @desc gets or sets a property
/// @param constraint
/// @param [ratio]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_PHYSICS.drive];
}	// set
	sk_struct[@ SK_CONSTRAINT_PHYSICS.drive] = clamp(real(argument[1]),0,1);
	return undefined;