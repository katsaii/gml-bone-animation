/// @desc gets or sets a property
/// @param attachment
/// @param [x]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ATTACHMENT_POINT.X];
}	// set
	sk_struct[@ SK_ATTACHMENT_POINT.X] = real(argument[1]);
	return undefined;