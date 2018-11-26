#macro sk_type_atlas sk_atlas_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ATLAS{
	texturePage,
	UV_left,UV_top,UV_right,UV_bottom,
	subTextureMap,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ATLAS.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_atlas,argument0,
	-1, // setup script
	-1, // apply script
	"sk_atlas_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ATLAS.subTextureMap] = ds_map_create(); // create map for looking up region data
// set default property values
sk_atlas_set_page(sk_struct,-1,0);
// return to caller
return sk_struct;