#macro SK_EASE_NONE 0
#macro SK_EASE_LINEAR 1
#macro SK_EASE_IN 2
#macro SK_EASE_OUT 3
#macro SK_EASE_SMOOTHSTEP 4
#macro SK_EASE_SMOOTHSTEP_INV 5
#macro SK_EASE_INSTANT 6
/// @desc aproximates a bezier curve
/// @param x1
/// @param y1
/// @param x2
/// @param y2
var sk_x1 = clamp(argument0,0,1)+1; // clamping values between 0 and 1, then shifting up by 1 confirms all gradients are defined (no divide by zero or negative cases)
var sk_y1 = clamp(argument1,0,1)+1;
var sk_x2 = clamp(argument2,0,1)+1;
var sk_y2 = clamp(argument3,0,1)+1;
var sk_g1 = sk_x1/sk_y1;
var sk_g2 = sk_x2/sk_y2;
if(abs(sk_g1-1)<0.01){
	// either easing in, out, or the interpolation is linear
	if(abs(sk_g2-1)<0.01){
		return SK_EASE_LINEAR;
	}else if(sk_g2>1){
		return SK_EASE_IN;
	}else{
		return SK_EASE_OUT;
	}
} else if(sk_g1>1){
	// either smoothstep, or easing in
	if((abs(sk_g2-1)<0.01)||(sk_g2>1)){
		return SK_EASE_IN;
	}else{
		return SK_EASE_SMOOTHSTEP;
	}
} else {
	// either inverse smoothstep, or easing out
	if((abs(sk_g2-1)<0.01)||(sk_g2<1)){
		return SK_EASE_OUT;
	}else{
		return SK_EASE_SMOOTHSTEP_INV;
	}
}