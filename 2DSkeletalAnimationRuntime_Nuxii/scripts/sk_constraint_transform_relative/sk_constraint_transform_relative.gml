/// @desc gets or sets a property
/// @param constraint
/// @param [enabled]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_TRANSFORM.relative];
}	// set
	sk_struct[@ SK_CONSTRAINT_TRANSFORM.relative] = bool(argument[1]);
	return undefined;