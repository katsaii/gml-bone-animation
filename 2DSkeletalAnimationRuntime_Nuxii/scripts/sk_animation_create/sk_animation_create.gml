#macro sk_type_animation "ofAnimation"
enum SK_ANIMATION{
	duration,
	timelines,
	looping,
	sizeof
}
#macro sk_mixPose_mix 0 /* interpolates between the current pose and next pose */
#macro sk_mixPose_add 1 /* adds the next pose to the current pose */
#macro sk_mixPose_overwrite 2 /* permanently overwrites the setup pose with the supplied animation, this is useful for changing colours and transforms globally - THIS IS NOT A REVERTABLE ACTION */
gml_pragma("global","sk_struct_type_add(sk_type_animation,SK_ANIMATION.sizeof,sk_construct_animation,sk_destruct_animation);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_animation,argument0);
return sk_structure;