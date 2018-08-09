/// @desc draw etheral armature
var v_armature = global.current_ske;
var v_atlas = global.current_atlas;
var v_anim = global.current_animation;
if(sk_struct_exists(v_armature,sk_type_armature)&&sk_struct_exists(v_atlas,sk_type_atlas)){
	sk_armature_setToSetupPose(v_armature);
	if(sk_struct_exists(v_anim,sk_type_animation)){
		var t = current_time*0.01;
		sk_animation_apply(v_anim,t,t,sk_mixPose_mix,1,true);
	}
	sk_armature_updateWorldTransform(v_armature);
	var v_bufftex = vertex_bake_armature(v_armature,v_atlas,v_buffskel);
	vertex_submit_transformed(v_buffskel,pr_trianglelist,v_bufftex,mouse_x,mouse_y,v_xscale,v_yscale,0);
}