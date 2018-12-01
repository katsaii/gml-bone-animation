/// @desc interpolates between two times
/// @param timeLast
/// @param timeNext
/// @param timeTarget
/// @param tweenEasing
var sk_linearInterpolation = 0;
if(argument0!=argument1){
	sk_linearInterpolation = clamp((argument2-argument0)/(argument1-argument0),0,1);
}	// 0 means previous frame, 1 means next frame
switch(argument3){
	case sk_tweenEasing_none:			return 0; break;
	case sk_tweenEasing_linear:			return sk_linearInterpolation; break;
	case sk_tweenEasing_easeIn:			return(sk_linearInterpolation*sk_linearInterpolation*(3-sk_linearInterpolation)*0.5);break;
	case sk_tweenEasing_easeOut:		var r = clamp(sk_linearInterpolation+1,1,2); return (r*r*(3-r)*0.5 -1); break;
	case sk_tweenEasing_smoothstep:		return(sk_linearInterpolation*sk_linearInterpolation*(3-2*sk_linearInterpolation)); break; // smooth step
	case sk_tweenEasing_smoothstepI:	return(2*sk_linearInterpolation-(sk_linearInterpolation*sk_linearInterpolation*(3-2*sk_linearInterpolation))); break; // inverse smooth step
}
return sk_linearInterpolation;