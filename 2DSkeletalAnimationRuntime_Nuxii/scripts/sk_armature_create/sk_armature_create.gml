#macro sk_type_armature "ofArmature"
enum SK_ARMATURE{
	bones,slots,skins,constraints,
	animations,events,attachments,
	updateOrderDefault,updateOrder, /* stores bone, slot, and constraint data in a single iterable list */
	drawOrderDefault,drawOrder,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_armature,SK_ARMATURE.sizeof,sk_construct_armature,sk_destruct_armature);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_armature,argument0);
return sk_structure;