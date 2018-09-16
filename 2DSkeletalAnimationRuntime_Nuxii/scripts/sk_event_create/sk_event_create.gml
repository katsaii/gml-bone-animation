#macro sk_type_event sk_event_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_EVENT{
	callingScript,
	dBone,dString,dReal,dInt,dSound,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_EVENT.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_event,argument0,
	-1, // setup script
	"sk_event_call", // apply script
	"sk_event_destroy" // destruction script
);
// set default property values
sk_event_set_script(sk_struct,-1);
sk_event_data_set(sk_struct,noone,"",0,0,-1);
// return to caller
return sk_struct;