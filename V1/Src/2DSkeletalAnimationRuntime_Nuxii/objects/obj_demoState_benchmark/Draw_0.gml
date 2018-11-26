/// @desc draw etheral armature
var v_armature = global.current_ske;
var v_atlas = global.current_atlas;
var v_anim = global.current_animation;
if(sk_struct_isof(v_armature,sk_type_armature)&&sk_struct_isof(v_atlas,sk_type_atlas)){
	sk_armature_setToSetupPose(v_armature);
	if(sk_struct_isof(v_anim,sk_type_animation)){
		var t = current_time*0.01;
		sk_animation_apply(v_anim,t,t,sk_mixPose_mix,1,true);
	}
	sk_armature_updateWorldTransform(v_armature);
	var v_bufftex = vertex_bake_armature(v_armature,v_atlas,v_buffskel);
	// update the world matrix so the buffer is drawn at the position of the object
	var previous_matrix = matrix_get(matrix_world);
	matrix_set(matrix_world,matrix_build(mouse_x,mouse_y,0,0,0,0,v_xscale,v_yscale,0));
	// submit the vertex buffer at the x and y position of the object
	vertex_submit(v_buffskel,pr_trianglelist,v_bufftex);
	// reset the world matrix
	matrix_set(matrix_world,previous_matrix);
}