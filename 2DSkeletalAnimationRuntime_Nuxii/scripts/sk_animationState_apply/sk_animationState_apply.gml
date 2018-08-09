/// @desc applies the animations
/// @param animationState
/// @param mixPose
/// @param alpha
var sk_anims = argument0[SK_ANIMATIONSTATE.animations];
var sk_anim_prev = sk_anims[? argument0[SK_ANIMATIONSTATE.animation_previous]];
var sk_anim_current = sk_anims[? argument0[SK_ANIMATIONSTATE.animation_current]];
if(sk_struct_exists(sk_anim_current,sk_type_animation)){
	if(sk_struct_exists(sk_anim_prev,sk_type_animation)){
		var sk_mix = argument0[SK_ANIMATIONSTATE.mixAlpha];
		// mix between animations
		/*sk_animation_apply(
			sk_anim_prev,
			argument0[SK_ANIMATIONSTATE.animation_previous_timeLast],
			argument0[SK_ANIMATIONSTATE.animation_previous_time],
			argument1,argument2,
			argument0[SK_ANIMATIONSTATE.animation_previous_loop]
		);*/
		sk_animation_apply(
			sk_anim_current,
			argument0[SK_ANIMATIONSTATE.animation_current_timeLast],
			argument0[SK_ANIMATIONSTATE.animation_current_time],
			argument1,argument2*sk_mix,
			argument0[SK_ANIMATIONSTATE.animation_current_loop]
		);
	} else {
		// mix current animation
		sk_animation_apply(
			sk_anim_current,
			argument0[SK_ANIMATIONSTATE.animation_current_timeLast],
			argument0[SK_ANIMATIONSTATE.animation_current_time],
			argument1,argument2,
			argument0[SK_ANIMATIONSTATE.animation_current_loop]
		);
	}
}