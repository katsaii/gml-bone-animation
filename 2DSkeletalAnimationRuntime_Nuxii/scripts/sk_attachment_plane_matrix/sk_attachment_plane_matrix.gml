/// @desc gets or sets a property
/// @param attachment
/// @param [xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation]
var sk_struct = argument[0];
if(argument_count<6){
	// get
	return [
		sk_struct[SK_ATTACHMENT_PLANE.m00],sk_struct[SK_ATTACHMENT_PLANE.m01],
		sk_struct[SK_ATTACHMENT_PLANE.m10],sk_struct[SK_ATTACHMENT_PLANE.m11]
	];
}	// set
	var sk_rotationX = argument[5]+argument[3];
	var sk_rotationY = argument[5]+argument[4]+90;
	sk_struct[@ SK_ATTACHMENT_PLANE.m00] = dcos(sk_rotationX)*argument[1];
	sk_struct[@ SK_ATTACHMENT_PLANE.m01] = -dsin(sk_rotationX)*argument[1];
	sk_struct[@ SK_ATTACHMENT_PLANE.m10] = dcos(sk_rotationY)*-argument[2];
	sk_struct[@ SK_ATTACHMENT_PLANE.m11] = -dsin(sk_rotationY)*-argument[2];