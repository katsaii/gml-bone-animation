#macro sk_type_attachment_point sk_attachment_create_point /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ATTACHMENT_POINT{
	X,Y,rotation,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ATTACHMENT_POINT.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_attachment_point,argument0,
	-1, // setup script
	-1, // apply script
	"sk_attachment_destroy_point" // destruction script
);
// set default property values
sk_attachment_point_set_offsets(sk_struct,0,0,0);
// return to caller
return sk_struct;