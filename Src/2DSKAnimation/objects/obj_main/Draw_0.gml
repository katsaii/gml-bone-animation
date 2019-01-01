/// @desc 
//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,sk_debug_atlas_regions|sk_debug_atlas_texture|sk_debug_atlas_regionOrigins|sk_debug_atlas_regionKeys);

sk_armature_vertex_apply(arm,vertex);

var m = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(mouse_x,mouse_y,0,0,0,0,10,10,1));
vertex_submit(vertex,pr_trianglelist,sk_atlas_get_texture(atlas));
matrix_set(matrix_world,m);

//sk_armature_draw_debug(arm,mouse_x,mouse_y,10,10,0,sk_debug_boneData|sk_debug_boneStructure);