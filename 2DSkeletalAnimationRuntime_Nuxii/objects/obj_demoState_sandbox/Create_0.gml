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
sk_atlas_assignPage(atlas,sprite_add(PATH_PALIA+"Palia_Skeleton_tex.png",0,false,false,0,0),0);

#region
var constraint = sk_constraint_create_physics("phys");
sk_constraint_physics_set_rigid(constraint,true);
var b2 = sk_bone_create("endeffector"); sk_bone_set_length(b2,1); sk_armature_add_bone(armature,b2);
sk_constraint_physics_set_effectors(constraint,sk_armature_find_bone(armature,"b_hip"),b2);
	var b = sk_bone_create("a"); sk_bone_set_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add_bone(armature,b);
		b = sk_bone_create("b"); sk_bone_set_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add_bone(armature,b);
		b = sk_bone_create("c"); sk_bone_set_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add_bone(armature,b);
		b = sk_bone_create("d"); sk_bone_set_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add_bone(armature,b);
		b = sk_bone_create("e"); sk_bone_set_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add_bone(armature,b);
		b = sk_bone_create("f"); sk_bone_set_length(b,5); sk_constraint_physics_system_add(constraint,b); sk_armature_add_bone(armature,b);
sk_armature_add_constraint(armature,constraint);
sk_armature_updateCache(armature);
#endregion

#region
sk_animation_apply(sk_armature_find_animation(armature,"display_costume_top_classic"),0,0,sk_mixPose_overwrite,1,false);
sk_animation_apply(sk_armature_find_animation(armature,"display_costume_bottom_classic"),0,0,sk_mixPose_overwrite,1,false);
#endregion

#region
animationState = sk_animationState_create("");
sk_animationState_add_animation_from_armature(animationState,armature);
//sk_animationState_setMix(animationState,"anim_idle","anim_run",0.5);
sk_animationState_setDefaultMix(animationState,0.1);
#endregion

v_phys = ds_map_create();
v_buff = vertex_create_buffer();