enum SK_TIMELINE{
	header,
	keyframes,body,
	keyframe_ENTRIES,
	updateScript,
	sizeof
}
#macro sk_timeline_header_value "__sk_timeline_pragma"
#macro sk_timeline_keyframe_time 0
#macro sk_timeline_keyframe_body 1
/// @desc specialises a structure
/// @param command
/// @param struct
/// @param [kf_ENTRIES,
/// @param scr_apply]
var sk_cmd = argument[0];
var sk_structure = argument[1];
var sk_keyframe_ENTRIES = 1;
var sk_keyframe_update = -1;
if(argument_count>3){
	sk_keyframe_ENTRIES = max(argument[2],1);
	sk_keyframe_update = asset_get_index(argument[3]);
}
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_TIMELINE.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_TIMELINE.header] = sk_timeline_header_value;
			sk_structure[@ SK_TIMELINE.keyframes] = ds_list_create(); // create list for storing keyframe data
			sk_structure[@ SK_TIMELINE.keyframe_ENTRIES] = sk_keyframe_ENTRIES;
			sk_structure[@ SK_TIMELINE.updateScript] = sk_keyframe_update;
			sk_timeline_body(sk_structure,noone);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_list_destroy(sk_structure[SK_TIMELINE.keyframes]);
		}
	break;
}
return 0;