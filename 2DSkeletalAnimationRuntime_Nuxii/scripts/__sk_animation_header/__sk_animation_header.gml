#macro sk_type_animation __sk_animation_header
enum SK_ANIMATION{
	duration,looping,
	timelines,
	sizeof
}
#macro sk_mixPose_mix 0 /* interpolates between the current pose and next pose */
#macro sk_mixPose_add 1 /* adds the next pose to the current pose */
#macro sk_mixPose_overwrite 2 /* permanently overwrites the setup pose with the supplied animation, this is useful for changing colours and transforms globally - THIS IS NOT A REVERTABLE ACTION */
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_ANIMATION.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_ANIMATION.timelines] = ds_list_create(); // create list for storing timeline data
			sk_animation_duration(sk_structure,0);
			sk_animation_looping(sk_structure,false);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			var sk_anim_timelines = sk_structure[SK_ANIMATION.timelines];
			// iterate through timelines and dispose
			var sk_timeline_count = ds_list_size(sk_anim_timelines);
			for(var sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
				var sk_timeline = sk_anim_timelines[| sk_timeline_id];
				if(sk_struct_exists(sk_timeline)){
					sk_struct_destroy(sk_timeline);
				}
			}
			// destroy final list
			ds_list_destroy(sk_anim_timelines);
		}
	break;
}
return 0;