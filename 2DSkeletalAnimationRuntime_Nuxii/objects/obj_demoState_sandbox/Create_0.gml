/// @desc sandbox
var PATH_PALIA = "Skeletons/DragonBones/Nuxii/Palia/";
// armature
var file = file_text_open_read(PATH_PALIA+"Palia_Skeleton_ske.json");
var raw = "";
do{	raw += file_text_read_string(file);
	file_text_readln(file);
}until(file_text_eof(file));
file_text_close(file);
armature = sk_armature_build_dragonbones(raw,0);
if(!sk_struct_exists(armature,sk_type_armature)){
	show_message("armature doesn't exist");
	game_end();
}
// atlas
file = file_text_open_read(PATH_PALIA+"Palia_Skeleton_tex.json");
raw = "";
do{	raw += file_text_read_string(file);
	file_text_readln(file);
}until(file_text_eof(file));
file_text_close(file);
atlas = sk_atlas_build_dragonbones(raw,1);
if(!sk_struct_exists(atlas,sk_type_atlas)){
	show_message("atlas doesn't exist");
	game_end();
}
sk_atlas_page(atlas,sprite_add(PATH_PALIA+"Palia_Skeleton_tex.png",0,false,false,0,0),0);

#region
var constraint = sk_struct_create(sk_type_constraint_physics,"phys");
sk_constraint_physics_rigid(constraint,true);
var b2 = sk_struct_create(sk_type_bone,"endeffector"); sk_bone_length(b2,1); sk_armature_add(armature,b2);
sk_constraint_physics_bone_anchor(constraint,sk_armature_find(armature,sk_type_bone,"b_hip"));
sk_constraint_physics_bone_effector(constraint,b2);
	var b = sk_struct_create(sk_type_bone,"a"); sk_bone_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add(armature,b);
		b = sk_struct_create(sk_type_bone,"b"); sk_bone_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add(armature,b);
		b = sk_struct_create(sk_type_bone,"c"); sk_bone_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add(armature,b);
		b = sk_struct_create(sk_type_bone,"d"); sk_bone_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add(armature,b);
		b = sk_struct_create(sk_type_bone,"e"); sk_bone_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add(armature,b);
		b = sk_struct_create(sk_type_bone,"f"); sk_bone_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add(armature,b);
sk_armature_add(armature,constraint);
sk_armature_updateCache(armature);
#endregion

#region
sk_animation_apply(sk_armature_find(armature,sk_type_animation,"display_costume_top_classic"),0,0,sk_mixPose_overwrite,1,false);
sk_animation_apply(sk_armature_find(armature,sk_type_animation,"display_costume_bottom_classic"),0,0,sk_mixPose_overwrite,1,false);
#endregion

#region
animationState = sk_struct_create(sk_type_animationState,"");
sk_animationState_add_animation_from_armature(animationState,armature);
sk_animationState_mix(animationState,"anim_run","anim_skid",0.2);
sk_animationState_mix_default(animationState,0.05);
#endregion

v_phys = ds_map_create();
v_buff = vertex_create_buffer();
bufftex = -1;

// temp
ratio = 0;