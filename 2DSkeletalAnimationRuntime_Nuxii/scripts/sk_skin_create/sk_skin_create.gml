#macro sk_type_skin sk_skin_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_SKIN{
	displays,
	remaps,remapStack,
	sizeof
}
#macro sk_tuple_skinRecord_slot 0 /* this could be a slot, but it could also be a symbol */
#macro sk_tuple_skinRecord_attachment 1
#macro sk_tuple_skinRecord_attachmentKey 2
#macro sk_tuple_skinRecord_ENTRIES 3
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_SKIN.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_skin,argument0,
	-1, // setup script
	"sk_skin_apply", // apply script
	"sk_skin_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_SKIN.displays] = ds_list_create();
sk_struct[@ SK_SKIN.remaps] = ds_map_create();
sk_struct[@ SK_SKIN.remapStack] = ds_list_create();
// return to caller
return sk_struct;