/// @desc calls the event script
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
var sk_scr = argument0[SK_EVENT.callingScript];
if(script_exists(sk_scr)){
	script_execute(
		sk_scr,
		is_real(argument1) ? argument1 : argument0[SK_EVENT.dBone],
		is_string(argument2) ? argument2 : argument0[SK_EVENT.dString],
		is_real(argument3) ? argument3 : argument0[SK_EVENT.dReal],
		(is_real(argument4)||is_int64(argument4)) ? int64(argument4) : argument0[SK_EVENT.dInt],
		is_real(argument5) ? argument5 : argument0[SK_EVENT.dSound]
	);
} else {
	// post default event
	show_debug_message("Sk: ["+string(current_time)+"] - Event Called: "+string(sk_struct_get_name(argument0)));
}