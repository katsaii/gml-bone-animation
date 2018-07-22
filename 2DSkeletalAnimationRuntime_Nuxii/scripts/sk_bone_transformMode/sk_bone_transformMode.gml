/// @desc gets or sets a property
/// @param bone
/// @param [transformMode]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_BONE.transformMode];
}	// set
	sk_struct[@ SK_BONE.transformMode] = argument[1];
	return undefined;