/// @desc 0
//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,SK_ATLAS_DEBUG_REGIONS|SK_ATLAS_DEBUG_TEXTURE|SK_ATLAS_DEBUG_ORIGINS|SK_ATLAS_DEBUG_KEYS);

var xx = room_width div 2;
var yy = room_height -40;
var xscale = 10;
var yscale = 10;

var time = current_time*0.04;
repeat(1){
ds_list_clear(thrownEvents);
sk_armature_pose_setup(arm);
sk_animation_apply(anim,last_time,time,SK_MIX_ADD,1,true,thrownEvents);
sk_armature_pose_update(arm);

vertex_begin_sk(vertex);
sk_armature_pose_vertex_add(arm,vertex);
vertex_end_sk(vertex);

}
last_time = time;

for(var i = 0, c = ds_list_size(thrownEvents); i<c; i++){
	var e = thrownEvents[| i];
	var e_bone = e[1];
	var text = sk_bone_get_name(e_bone)=="b_ankle_left" ? "STOMP" : "CLINK";
	draw_text(xx+xscale*sk_bone_get_x(e_bone),yy,text);
}

var m = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(xx,yy,0,0,0,0,xscale,yscale,1));
vertex_submit(vertex,pr_trianglelist,sk_atlas_get_texture(atlas));
matrix_set(matrix_world,m);

//sk_armature_draw_debug(arm,xx,yy,10,10,0,SK_BONE_DEBUG_EX_DATA|SK_BONE_DEBUG_EX_STRUCTURE);

draw_text(10,yy,fps_real);