/// @desc adds an animation to the state
/// @param animationState
/// @param anim
/// @param [alias] used to identify the animation
var sk_struct = argument[0];
var sk_animations = sk_struct[SK_ANIMATIONSTATE.animations];
var sk_animation = argument[1];
if(sk_struct_isof(sk_animation,sk_type_animation)){
	var sk_alias = (argument_count==3) ? argument[2] : sk_struct_get_name(sk_animation);
	sk_animations[? sk_alias] = sk_animation;
}