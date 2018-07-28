/// @desc gets or sets a property
/// @param attachment
/// @param [x]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ATTACHMENT_PLANE.X];
}	// set
	sk_struct[@ SK_ATTACHMENT_PLANE.X] = real(argument[1]);
	return undefined;