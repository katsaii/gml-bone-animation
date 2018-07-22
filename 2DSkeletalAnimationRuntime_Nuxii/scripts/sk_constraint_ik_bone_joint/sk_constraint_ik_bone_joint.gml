/// @desc gets or sets a property
/// @param constraint
/// @param [bone]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_CONSTRAINT_IK.boneJoint];
}	// set
	sk_struct[@ SK_CONSTRAINT_IK.boneJoint] = argument[1];
	return undefined;