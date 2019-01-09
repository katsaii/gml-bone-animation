/// @desc calls the event script
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
var sk_scr = argument0[sk_data_event.listener];
if(sk_scr!=-1){
	script_execute(
		sk_scr,
		is_undefined(argument1) ? argument0[sk_data_event.defaultBone] : argument1,
		is_undefined(argument2) ? argument0[sk_data_event.defaultString] : argument2,
		is_undefined(argument3) ? argument0[sk_data_event.defaultReal] : argument3,
		is_undefined(argument4) ? argument0[sk_data_event.defaultInt] : argument4,
		is_undefined(argument5) ? argument0[sk_data_event.defaultSound] : argument5
	);
}