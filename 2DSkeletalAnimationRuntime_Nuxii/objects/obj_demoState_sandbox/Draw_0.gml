/// @desc 

var dt = 1;
var dir = keyboard_check(vk_right)-keyboard_check(vk_left);
if(dir==0){
	sk_animationState_set_animation(animationState,"anim_walk",true);
} else if(dir>0){
	sk_animationState_set_animation(animationState,"anim_run",true);
} else {
	sk_animationState_set_animation(animationState,"anim_idle",true);
}

var spd = 0.25;
sk_animationState_update(animationState,dt*spd);
sk_armature_setToSetupPose(armature);
sk_animationState_apply(animationState,sk_mixPose_mix,1);
sk_physics_boneState = v_phys;
sk_armature_updateWorldTransform(armature);

var bufftex = vertex_bake_armature(armature,atlas,v_buff);
vertex_submit_transformed(v_buff,pr_trianglelist,bufftex,mouse_x,mouse_y,10,10,0);

sk_animationState_draw_debug(animationState,mouse_x,mouse_y);