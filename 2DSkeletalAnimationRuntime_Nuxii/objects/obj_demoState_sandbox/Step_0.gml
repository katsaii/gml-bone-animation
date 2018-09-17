/// @desc 

var dt = 1;
var dir_x = keyboard_check(vk_right)-keyboard_check(vk_left);
var dir_y = keyboard_check(vk_down)-keyboard_check(vk_up);
if(dir_y<0){
	sk_animationState_play_animation(animationState,"anim_wallrun",true);
} else if(dir_y>0){
	sk_animationState_play_animation(animationState,"anim_skid",true);
} else {
	if(dir_x<0){
		sk_animationState_play_animation(animationState,"anim_idle",true);
	} else if(dir_x>0){
		sk_animationState_play_animation(animationState,"anim_run",true);
	} else {
		sk_animationState_play_animation(animationState,"anim_walk",true);
	}
}

var spd = 0.5;
sk_animationState_update(animationState,dt*spd);
sk_armature_setToSetupPose(armature);
sk_animationState_apply(animationState,1);

/*
ratio += dir*0.01;

var t = current_time*0.025;
if(keyboard_check(vk_enter)){
	sk_animation_apply(sk_armature_find_animation(armature,"anim_walk"),t,t,sk_mixPose_add,1-ratio,true);
	sk_animation_apply(sk_armature_find_animation(armature,"anim_run"),t,t,sk_mixPose_add,ratio,true);
} else {
	sk_animation_apply(sk_armature_find_animation(armature,"anim_walk"),t,t,sk_mixPose_add,1,true);
	sk_animation_apply(sk_armature_find_animation(armature,"anim_run"),t,t,sk_mixPose_mix,ratio,true);
}
draw_text(mouse_x,mouse_y-20,ratio);*/

sk_physics_boneState = v_phys;
sk_armature_updateWorldTransform(armature);

bufftex = vertex_bake_armature(armature,atlas,v_buff);