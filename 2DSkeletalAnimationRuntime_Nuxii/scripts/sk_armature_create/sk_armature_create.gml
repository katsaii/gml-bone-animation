#macro sk_type_armature sk_armature_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ARMATURE{
	bones,slots,skins,constraints,
	animations,events,attachments,
	updateOrder,drawOrder,drawOrderFinal, /* stores bone, slot, and constraint data in a single iterable list */
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ARMATURE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_armature,argument0,
	"sk_armature_setToSetupPose", // setup script
	"sk_armature_updateWorldTransform", // apply script
	"sk_armature_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ARMATURE.bones] = ds_list_create(); // create structures for storing armature data
sk_struct[@ SK_ARMATURE.slots] = ds_list_create();
sk_struct[@ SK_ARMATURE.skins] = ds_list_create();
sk_struct[@ SK_ARMATURE.constraints] = ds_list_create();
sk_struct[@ SK_ARMATURE.animations] = ds_list_create();
sk_struct[@ SK_ARMATURE.events] = ds_list_create();
sk_struct[@ SK_ARMATURE.attachments] = ds_list_create();
sk_struct[@ SK_ARMATURE.updateOrder] = ds_list_create();
sk_struct[@ SK_ARMATURE.drawOrder] = ds_list_create();
sk_struct[@ SK_ARMATURE.drawOrderFinal] = ds_list_create();
sk_armature_add_skin(sk_struct,sk_skin_create("default"));
// return to caller
return sk_struct;