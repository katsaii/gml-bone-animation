/// @desc update armature
if(keyboard_check_pressed(vk_enter)) then sk_animationState_play(state,anim1,-1);
if(keyboard_check_released(vk_enter)) then sk_animationState_play(state,anim2,-1);

sk_animationState_update(state,1);

sk_armature_pose_setup(arm);
sk_animationState_apply(state,1,undefined);
sk_armature_pose_update(arm);

vertex_begin_sk(buff);
sk_armature_pose_vertex_add(arm,buff);
vertex_end_sk(buff);

