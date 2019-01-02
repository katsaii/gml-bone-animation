/// @desc 
//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,sk_debug_atlas_regions|sk_debug_atlas_texture|sk_debug_atlas_regionOrigins|sk_debug_atlas_regionKeys);

var xx = room_width div 2;
var yy = room_height -10;

sk_bone_set_appliedPose(sk_armature_get_bone(arm,"b_ik_arm_left"),(mouse_x-xx)/10,(mouse_y-yy)/10,1,1,0,0,0,sk_transformMode_normal);
sk_armature_updateWorldTransform(arm);

sk_armature_vertex_apply(arm,vertex);

var m = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(xx,yy,0,0,0,0,10,10,1));
vertex_submit(vertex,pr_trianglelist,sk_atlas_get_texture(atlas));
matrix_set(matrix_world,m);

sk_armature_draw_debug(arm,xx,yy,10,10,0,sk_debug_boneData|sk_debug_boneStructure);