/// @desc 

var dt = 1;
var dir = keyboard_check(vk_right)-keyboard_check(vk_left);
if(dir==0){
	sk_animationState_set_animation(animationState,"anim_run",true);
} else if(dir>0){
	sk_animationState_set_animation(animationState,"anim_skid",true);
} else {
	sk_animationState_set_animation(animationState,"anim_walk",true);
}

var spd = 0.5;
//sk_animationState_update(animationState,dt*spd);
sk_armature_setToSetupPose(armature);
//sk_animationState_apply(animationState,sk_mixPose_mix,1);

ratio += dir*0.01;

var t = current_time*0.025;
if(keyboard_check(vk_enter)){
	sk_animation_apply(sk_armature_find(armature,sk_type_animation,"anim_walk"),t,t,sk_mixPose_add,1-ratio,true);
	sk_animation_apply(sk_armature_find(armature,sk_type_animation,"anim_run"),t,t,sk_mixPose_add,ratio,true);
} else {
	sk_animation_apply(sk_armature_find(armature,sk_type_animation,"anim_walk"),t,t,sk_mixPose_add,1,true);
	sk_animation_apply(sk_armature_find(armature,sk_type_animation,"anim_run"),t,t,sk_mixPose_mix,ratio,true);
}
draw_text(mouse_x,mouse_y-20,ratio);

sk_physics_boneState = v_phys;
sk_armature_updateWorldTransform(armature);

var buffx = room_width div 2;
var buffy = (room_height div 2)*1.4;

var bufftex = vertex_bake_armature(armature,atlas,v_buff);
vertex_submit_transformed(v_buff,pr_trianglelist,bufftex,buffx,buffy,10,10,0);

sk_animationState_draw_debug(animationState,buffx,buffy);

sk_armature_draw_debug(armature,buffx,buffy,10,10,0,sk_debug_boneStructure);