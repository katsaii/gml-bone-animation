/// @desc gets or sets a property
/// @param attachment
/// @param [key]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ATTACHMENT_PLANE.regionKey];
}	// set
	sk_struct[@ SK_ATTACHMENT_PLANE.regionKey] = argument[1];
	return undefined;