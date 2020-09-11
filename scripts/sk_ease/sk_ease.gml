/// @desc applied an easing function
/// @param amount
/// @param ease
switch(argument1){
	case SK_EASE_NONE:
		return 0;
	break;
	case SK_EASE_LINEAR:
		return argument0;
	break;
	case SK_EASE_IN:
		return (argument0*argument0*(3-argument0)*0.5);
	break;
	case SK_EASE_OUT:
		var sk_r = clamp(argument0+1,1,2);
		return (sk_r*sk_r*(3-sk_r)*0.5)-1;
	break;
	case SK_EASE_SMOOTHSTEP:
		return (argument0*argument0*(3-2*argument0));
	break;
	case SK_EASE_SMOOTHSTEP_INV:
		return ((2*argument0)-(argument0*argument0*(3-2*argument0)));
	break;
	case SK_EASE_INSTANT:
		return 1;
	break;
}
return argument0;