/// @desc simple calling script
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
show_debug_message(
	"Event Called! \n[\n"+
	chr(9)+"Time: "+string(current_time*1000)+",\n"+
	chr(9)+"Bone: "+(sk_struct_exists(argument0,sk_type_bone) ? string(sk_struct_get_name(argument0)) : "null")+",\n"+
	chr(9)+"String: "+string(argument1)+",\n"+
	chr(9)+"Real: "+string(argument2)+",\n"+
	chr(9)+"Int: "+string(argument3)+",\n"+
	chr(9)+"Sound: "+(audio_exists(argument4) ? string(audio_get_name(argument4)) : "null")+"\n]"
);
audio_play_sound(snd_ev_default,0,0);