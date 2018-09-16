#macro sk_type_slot sk_slot_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_SLOT{
	availableAttachments,defaultAttachmentKey,
	colour,alpha,bone,attachment,
	colourFinal,alphaFinal,boneFinal,attachmentFinal,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = array_create(SK_SLOT.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_slot,argument0,
	"sk_slot_setToSetupPose", // setup script
	-1, // apply script
	"sk_slot_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_SLOT.availableAttachments] = ds_map_create(); // create a map for storing attachment data
// set default property values
sk_slot_set_defaultDisplay(sk_struct,undefined);
sk_slot_set_colour(sk_struct,$ffffff,1);
sk_slot_set_bone(sk_struct,argument1);
sk_slot_set_attachment(sk_struct,noone);
// apply transforms
sk_slot_setToDefaultDisplay(sk_struct);
sk_slot_setToSetupPose(sk_struct);
// return to caller
return sk_struct;