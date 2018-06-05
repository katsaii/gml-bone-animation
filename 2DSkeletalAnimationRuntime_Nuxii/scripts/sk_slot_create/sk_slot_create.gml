#macro sk_type_slot "ofSlot"
enum SK_SLOT{
	availableAttachments,defaultAttachmentKey,
	colour,alpha,bone,attachment,
	colourFinal,alphaFinal,boneFinal,attachmentFinal,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_slot,SK_SLOT.sizeof,sk_construct_slot,sk_destruct_slot);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_slot,argument0);
sk_slot_set_defaultDisplay(sk_structure,"-1");
sk_slot_set_setupPose(sk_structure,$ffffff,1,noone,noone);
sk_slot_setToDefaultDisplay(sk_structure);
sk_slot_setToSetupPose(sk_structure);
return sk_structure;