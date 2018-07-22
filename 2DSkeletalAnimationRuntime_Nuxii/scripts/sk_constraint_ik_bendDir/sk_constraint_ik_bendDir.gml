/// @desc gets or sets a property
/// @param constraint
/// @param [bendDir]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_IK.bendDir];
}	// set
	sk_struct[@ SK_CONSTRAINT_IK.bendDir] = (argument[1]==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
	return undefined;