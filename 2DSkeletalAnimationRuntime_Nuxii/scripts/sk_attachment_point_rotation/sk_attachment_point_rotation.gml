/// @desc gets or sets a property
/// @param attachment
/// @param [angle]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_ATTACHMENT_POINT.rotation];
}	// set
	sk_struct[@ SK_ATTACHMENT_POINT.rotation] = -angle_difference(0,real(argument[1]));
	return undefined;