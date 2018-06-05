gml_pragma("global","global.v_transformation_matrix = matrix_build_identity();");
#macro v_matrix_transformation global.v_transformation_matrix
/// @desc submits the vertex buffer with applied transformations
/// @param vbuff
/// @param prim
/// @param texture
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param angle
var v_matrix_trans = v_matrix_transformation;
var v_matrix_world = matrix_get(matrix_world);
// update transformation matrix
var v_sine = (argument7==0) ? 0 : dsin(argument7);
var v_cosine = (argument7==0) ? 1 : dcos(argument7);
v_matrix_trans[@ 0] = v_cosine*argument5;	v_matrix_trans[@ 1] = -v_sine*argument5;	v_matrix_trans[@ 2] = 0;	v_matrix_trans[@ 3] = 0;
v_matrix_trans[@ 4] = v_sine*argument6;		v_matrix_trans[@ 5] = v_cosine*argument6;	v_matrix_trans[@ 6] = 0;	v_matrix_trans[@ 7] = 0;
v_matrix_trans[@ 8] = 0;					v_matrix_trans[@ 9] = 0;					v_matrix_trans[@ 10] = 1;	v_matrix_trans[@ 11] = 0;
v_matrix_trans[@ 12] = argument3;			v_matrix_trans[@ 13] = argument4;			v_matrix_trans[@ 14] = 0;	v_matrix_trans[@ 15] = 1;
// submit
matrix_set(matrix_world,v_matrix_trans);
vertex_submit(argument0,argument1,argument2);
matrix_set(matrix_world,v_matrix_world);