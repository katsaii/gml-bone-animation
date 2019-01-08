/// @desc 
//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,SK_ATLAS_DEBUG_REGIONS|SK_ATLAS_DEBUG_TEXTURE|SK_ATLAS_DEBUG_ORIGINS|SK_ATLAS_DEBUG_KEYS);

var xx = room_width div 2;
var yy = room_height -40;
var xscale = 10;
var yscale = 10;

sk_armature_pose_setup(arm);
//sk_bone_set_pose_applied(bone,(mouse_x-xx)/xscale,(mouse_y-yy)/yscale,1,1,0,0,0,SK_TRANSFORM_MODE_NORMAL);
sk_translate_timeline_apply(timeline,0,1,mouse_x/room_width,SK_MIX_BLEND,1);
sk_armature_pose_update(arm);

vertex_begin_sk(vertex);
sk_armature_pose_vertex_add(arm,vertex);
vertex_end_sk(vertex);


var m = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(xx,yy,0,0,0,0,xscale,yscale,1));
vertex_submit(vertex,pr_trianglelist,sk_atlas_get_texture(atlas));
matrix_set(matrix_world,m);

//sk_armature_draw_debug(arm,xx,yy,10,10,0,SK_BONE_DEBUG_EX_DATA|SK_BONE_DEBUG_EX_STRUCTURE);

draw_text(xx,yy,fps_real);