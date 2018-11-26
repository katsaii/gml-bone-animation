#macro sk_type_animation sk_animation_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ANIMATION{
	duration,looping,
	timelines,
	sizeof
}
#macro sk_mixPose_mix 0 /* interpolates between the current pose and next pose */
#macro sk_mixPose_add 1 /* adds the next pose to the current pose */
#macro sk_mixPose_overwrite 2 /* permanently overwrites the setup pose with the supplied animation, this is useful for changing colours and transforms globally - THIS IS NOT A REVERTABLE ACTION */
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ANIMATION.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_animation,argument0,
	-1, // setup script
	-1, // apply script
	"sk_animation_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ANIMATION.timelines] = ds_list_create(); // create list for storing timeline data
// set default property values
sk_animation_set_duration(sk_struct,0);
sk_animation_set_looping(sk_struct,false);
// return to caller
return sk_struct;