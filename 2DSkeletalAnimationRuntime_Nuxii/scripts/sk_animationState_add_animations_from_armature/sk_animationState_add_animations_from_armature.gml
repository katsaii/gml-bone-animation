/// @desc adds all animations from an armature to the state
/// @param animationState
/// @param armature
var sk_armature_animations = ds_list_create();
sk_armature_copy_animations(argument1,sk_armature_animations);
var sk_animation_count = ds_list_size(sk_armature_animations);
for(var sk_animation_id = 0; sk_animation_id < sk_animation_count; sk_animation_id++){
	sk_animationState_add_animation(argument0,sk_armature_animations[| sk_animation_id]);
}
ds_list_destroy(sk_armature_animations);