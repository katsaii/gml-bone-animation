/// @desc gets or sets a property
/// @param animation
/// @param [enabled]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ANIMATION.looping];
}	// set
	sk_struct[@ SK_ANIMATION.looping] = argument[1];
	return undefined;