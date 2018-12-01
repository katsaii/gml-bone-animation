/// @desc draw buffer
if(v_buffinit){
	// update the world matrix so the buffer is drawn at the position of the object
	var previous_matrix = matrix_get(matrix_world);
	matrix_set(matrix_world,matrix_build(x,y,0,0,0,0,v_xscale,v_yscale,0));
	// submit the vertex buffer at the x and y position of the object
	vertex_submit(v_buffskel,pr_trianglelist,v_bufftex);
	// reset the world matrix
	matrix_set(matrix_world,previous_matrix);
}
