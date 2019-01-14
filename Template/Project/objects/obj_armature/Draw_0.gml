/// @desc render armature
var world = matrix_get(matrix_world);
var trans = matrix_build(x,y,0,0,0,image_angle,image_xscale,image_yscale,1);
matrix_set(matrix_world,trans);
vertex_submit(buff,pr_trianglelist,tex);
matrix_set(matrix_world,world);