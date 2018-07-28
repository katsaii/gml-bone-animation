/// @desc gets or sets a property
/// @param animationState
/// @param [speed]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ANIMATIONSTATE.mixSpeedDefault];
}	// set
	sk_struct[@ SK_ANIMATIONSTATE.mixSpeedDefault] = real(argument[1]);
	return undefined;