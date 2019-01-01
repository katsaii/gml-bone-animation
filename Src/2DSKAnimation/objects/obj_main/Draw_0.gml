/// @desc 
sk_atlas_draw_debug(a,0,0,room_width,room_height,sk_debug_atlas_regions|sk_debug_atlas_texture|sk_debug_atlas_regionOrigins|sk_debug_atlas_regionKeys);

sk_bone_draw_debug(b,mouse_x,mouse_y,1,1,0,sk_debug_boneData|sk_debug_boneStructure);
sk_bone_draw_debug(b2,mouse_x,mouse_y,1,1,0,sk_debug_boneData|sk_debug_boneStructure);

var attt = sk_slot_get_attachment(s);
if(attt!=undefined){
	sk_attachment_vertex_poke(attt,v,b,c_white,1);

	var m = matrix_get(matrix_world);
	matrix_set(matrix_world,matrix_build(mouse_x,mouse_y,0,0,0,0,1,1,1));
	vertex_submit(v,pr_trianglelist,sk_atlas_get_texture(a));
	matrix_set(matrix_world,m);
}