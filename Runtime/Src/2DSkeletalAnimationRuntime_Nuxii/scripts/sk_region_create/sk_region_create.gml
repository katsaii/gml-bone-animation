#macro sk_type_region sk_region_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_REGION{
	uv_ULX,uv_ULY,
	uv_URX,uv_URY,
	uv_BLX,uv_BLY,
	uv_BRX,uv_BRY,
	ox,oy,width,height,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_REGION.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_region,argument0,
	-1, // setup script
	-1, // apply script
	"sk_region_destroy" // destruction script
);
// set default property values
sk_region_set_uvs(sk_struct,0,0,1,1,0,0,1,1,0);
// return to caller
return sk_struct;