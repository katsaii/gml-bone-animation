/// @desc update armature
v_tick=!v_tick;
if(v_tick&&sk_struct_isof(v_armature,sk_type_armature)&&sk_struct_isof(v_atlas,sk_type_atlas)){
	var v_time = current_time*v_rate;
	sk_armature_setToSetupPose(v_armature);
	if(sk_struct_isof(v_anim,sk_type_animation)){
		sk_animation_apply(v_anim,v_timeLast,v_time,sk_mixPose_mix,1,true);
	}
	sk_physics_boneState = v_phys;
	sk_armature_updateWorldTransform(v_armature);
	v_timeLast = v_time;
	v_bufftex = vertex_bake_armature(v_armature,v_atlas,v_buffskel);
	v_buffinit = true; // so there is no error
}
