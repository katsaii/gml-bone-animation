/// @desc render armature
var world = matrix_get(matrix_world);
var trans = matrix_build(x,y,0,0,0,image_angle,image_xscale,image_yscale,1);
matrix_set(matrix_world,trans);
vertex_submit(buff,pr_trianglelist,tex);
matrix_set(matrix_world,world);

//sk_armature_draw_debug(arm,x,y,image_xscale,image_yscale,image_angle,SK_BONE_DEBUG_EX_STRUCTURE);

//sk_atlas_draw_debug(atlas,0,0,room_width,room_height,SK_ATLAS_DEBUG_KEYS|SK_ATLAS_DEBUG_ORIGINS|SK_ATLAS_DEBUG_REGIONS|SK_ATLAS_DEBUG_TEXTURE);