/// @desc gets or sets a property
/// @param bone
/// @param [xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation]
var sk_struct = argument[0];
if(argument_count<6){
	// get
	return [
		sk_struct[SK_BONE.m00],sk_struct[SK_BONE.m01],
		sk_struct[SK_BONE.m10],sk_struct[SK_BONE.m11]
	];
}	// set
	sk_struct[@ SK_BONE.badApplied] = true; // update applied flag
	var sk_rotationX = argument[5]+argument[3];
	var sk_rotationY = argument[5]+argument[4]+90;
	sk_struct[@ SK_BONE.m00] = dcos(sk_rotationX)*argument[1];
	sk_struct[@ SK_BONE.m01] = -dsin(sk_rotationX)*argument[1];
	sk_struct[@ SK_BONE.m10] = dcos(sk_rotationY)*-argument[2];
	sk_struct[@ SK_BONE.m11] = -dsin(sk_rotationY)*-argument[2];