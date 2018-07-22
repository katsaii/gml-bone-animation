/// @desc gets or sets a property
/// @param constraint
/// @param [key]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_HIERARCHY.tupleKey];
}	// set
	sk_struct[@ SK_CONSTRAINT_HIERARCHY.tupleKey] = argument[1];
	return undefined;