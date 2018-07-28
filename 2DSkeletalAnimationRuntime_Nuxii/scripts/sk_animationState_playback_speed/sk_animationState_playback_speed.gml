/// @desc gets or sets a property
/// @param animationState
/// @param [ratio]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ANIMATIONSTATE.playbackRate];
}	// set
	sk_struct[@ SK_ANIMATIONSTATE.playbackRate] = real(argument[1]);
	return undefined;