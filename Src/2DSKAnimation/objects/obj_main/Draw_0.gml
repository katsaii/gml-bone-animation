/// @desc 
//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,SK_ATLAS_DEBUG_REGIONS|SK_ATLAS_DEBUG_TEXTURE|SK_ATLAS_DEBUG_ORIGINS|SK_ATLAS_DEBUG_KEYS);

var xx = mouse_x//room_width div 2;
var yy = mouse_y//room_height -10;

//sk_bone_set_appliedPose(sk_armature_get_bone(arm,"b_ik_arm_left"),(mouse_x-xx)/10,(mouse_y-yy)/10,1,1,0,0,0,SK_TRANSFORM_MODE_NORMAL);
//sk_armature_updateWorldTransform(arm);

repeat(40){
sk_armature_pose_setup(arm);
sk_armature_pose_update(arm);

vertex_begin_sk(vertex);
sk_armature_pose_vertex_add(arm,vertex);
vertex_end_sk(vertex);
}

var m = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(xx,yy,0,0,0,0,10,10,1));
vertex_submit(vertex,pr_trianglelist,sk_atlas_get_texture(atlas));
matrix_set(matrix_world,m);

//sk_armature_draw_debug(arm,xx,yy,10,10,0,SK_BONE_DEBUG_EX_DATA|SK_BONE_DEBUG_EX_STRUCTURE);

draw_text(mouse_x,mouse_y,fps_real);