#macro sk_type_slot __sk_slot_header
enum SK_SLOT{
	availableAttachments,defaultAttachmentKey,
	colour,alpha,bone,attachment,
	colourFinal,alphaFinal,boneFinal,attachmentFinal,
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
		return SK_SLOT.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_SLOT.availableAttachments] = ds_map_create(); // create a map for storing attachment data
			sk_slot_defaultDisplay(sk_structure,undefined);
			sk_slot_colour(sk_structure,$ffffff);
			sk_slot_alpha(sk_structure,1);
			sk_slot_bone(sk_structure,noone);
			sk_slot_attachment(sk_structure,noone);
			sk_slot_setToDefaultDisplay(sk_structure);
			sk_slot_setToSetupPose(sk_structure);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_map_destroy(sk_structure[SK_SLOT.availableAttachments]); // dispose of attachment map
		}
	break;
}
return 0;