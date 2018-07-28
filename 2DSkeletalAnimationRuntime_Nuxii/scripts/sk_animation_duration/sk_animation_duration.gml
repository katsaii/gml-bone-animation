/// @desc gets or sets a property
/// @param animation
/// @param [duration]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ANIMATION.duration];
}	// set
	sk_struct[@ SK_ANIMATION.duration] = max(real(argument[1]),0);
	return undefined;