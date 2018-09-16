#macro sk_type_timeline sk_timeline_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_TIMELINE{
	target,keyframes,keyframe_ENTRIES,keyframe_applyScript,
	sizeof
}
#macro sk_timeline_keyframe_time 0
#macro sk_timeline_keyframe_body 1
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_TIMELINE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_timeline,argument0,
	-1, // setup script
	"sk_timeline_apply", // apply script
	"sk_timeline_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_TIMELINE.keyframes] = ds_list_create(); // create a list for storing timeline data
// set default property values
sk_timeline_set_target(sk_struct,noone);
sk_timeline_set_alignment(sk_struct,sk_timeline_keyframe_body);
sk_timeline_set_apply_script(sk_struct,-1);
// return to caller
return sk_struct;