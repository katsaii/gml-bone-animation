/// @desc returns the list where the tupplied type is stored
/// @param armature
/// @param type
switch(argument1){
	case sk_type_bone:					return argument0[SK_ARMATURE.bones]; break;
	case sk_type_slot:
	case sk_type_symbol:				return argument0[SK_ARMATURE.slots]; break;
	case sk_type_skin:					return argument0[SK_ARMATURE.skins]; break;
	case sk_type_constraint_ik:
	case sk_type_constraint_transform:
	case sk_type_constraint_hierarchy:	return argument0[SK_ARMATURE.constraints]; break;
	case sk_type_animation:				return argument0[SK_ARMATURE.animations]; break;
	case sk_type_event:					return argument0[SK_ARMATURE.events]; break;
	case sk_type_attachment_plane:
	case sk_type_attachment_point:		return argument0[SK_ARMATURE.attachments]; break;
}										return -1;