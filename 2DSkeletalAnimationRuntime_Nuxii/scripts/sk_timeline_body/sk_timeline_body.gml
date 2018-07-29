/// @desc gets or sets a property
/// @param timeline
/// @param [value]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_TIMELINE.body];
}	// set
	sk_struct[@ SK_TIMELINE.body] = argument[1];
	return undefined;