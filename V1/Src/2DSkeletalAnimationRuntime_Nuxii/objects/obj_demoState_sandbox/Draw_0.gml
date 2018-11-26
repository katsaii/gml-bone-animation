/// @desc 

var buffx = room_width div 2;
var buffy = (room_height div 2)*1.4;
// update the world matrix so the buffer is drawn at the position of the object
var previous_matrix = matrix_get(matrix_world);
matrix_set(matrix_world,matrix_build(buffx,buffy,0,0,0,0,10,10,0));
// submit the vertex buffer at the x and y position of the object
vertex_submit(v_buff,pr_trianglelist,bufftex);
// reset the world matrix
matrix_set(matrix_world,previous_matrix);

//sk_animationState_draw_debug(animationState,buffx,buffy);

//sk_armature_draw_debug(armature,buffx,buffy,10,10,0,sk_debug_boneStructure);