#macro sk_type_animationState "__sk_animationState_header"
enum SK_ANIMATIONSTATE{
	animations,playbackRate,
	mixTable,mixSpeedDefault,mixAlpha,
	animation_previous,animation_previous_loop,animation_previous_time,animation_previous_timeLast,
	animation_current,animation_current_loop,animation_current_time,animation_current_timeLast,
	animation_next,animation_next_loop,animation_next_time,
	sizeof
}
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_ANIMATIONSTATE.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_ANIMATIONSTATE.animations] = ds_map_create(); // create structures for mixing animations
			sk_structure[@ SK_ANIMATIONSTATE.mixTable] = ds_map_create();
			sk_animationState_playback_speed(sk_structure,1);
			sk_animationState_mix_default(sk_structure,1);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_map_destroy(sk_structure[SK_ANIMATIONSTATE.animations]);
			ds_map_destroy(sk_structure[SK_ANIMATIONSTATE.mixTable]);
		}
	break;
}
return 0;