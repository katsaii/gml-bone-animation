#macro sk_type_attachment_plane sk_attachment_create_plane /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ATTACHMENT_PLANE{
	regionName,
	X,Y,m00,m01,m10,m11,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param regionName
var sk_struct = array_create(SK_ATTACHMENT_PLANE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_attachment_plane,argument0,
	-1, // setup script
	-1, // apply script
	"sk_attachment_destroy_plane" // destruction script
);
// set default property values
sk_attachment_plane_set_regionName(sk_struct,argument1);
sk_attachment_plane_set_matrix(sk_struct,0,0,1,1,0,0,0);
// return to caller
return sk_struct;