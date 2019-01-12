/// @desc 0
//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,SK_ATLAS_DEBUG_REGIONS|SK_ATLAS_DEBUG_TEXTURE|SK_ATLAS_DEBUG_ORIGINS|SK_ATLAS_DEBUG_KEYS);

var xx = room_width div 2;
var yy = room_height -40;

var time = current_time*0.04;

if(keyboard_check_pressed(vk_enter)) then sk_animationState_play(state,anim2,-1);
if(keyboard_check_released(vk_enter)) then sk_animationState_play(state,anim1,-1);
sk_animationState_update(state,0.5);

ds_list_clear(thrownEvents);
sk_armature_pose_setup(arm);
sk_animationState_apply(state,1,thrownEvents);
sk_armature_pose_update(arm);

vertex_begin_sk(vertex);
sk_armature_pose_vertex_add(arm,vertex);
vertex_end_sk(vertex);

for(var i = 0, c = ds_list_size(thrownEvents); i<c; i++){
	var e = thrownEvents[| i];
	if(e[0]=="ev_footstep"){
		var e_bone = e[1];
		var text = sk_bone_get_name(e_bone)=="b_ankle_left" ? "STOMP" : "CLINK";
		draw_text(xx+xscale*sk_bone_get_x(e_bone),yy,text);
	}
}

var m = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(xx,yy,0,0,0,0,xscale,yscale,1));
vertex_submit(vertex,pr_trianglelist,sk_atlas_get_texture(atlas));
matrix_set(matrix_world,m);

sk_armature_draw_debug(arm,xx,yy,xscale,yscale,0,SK_BONE_DEBUG_EX_DATA|SK_BONE_DEBUG_EX_STRUCTURE);

draw_text(10,yy,fps_real);