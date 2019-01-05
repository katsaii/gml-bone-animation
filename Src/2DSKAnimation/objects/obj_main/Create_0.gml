show_debug_overlay(true);
gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
atlas = sk_atlas_create_dragonbones("Palia_Skeleton_tex.json",sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0),0,1);
//arm = sk_armature_create_dragonbones("Palia_Skeleton_ske.json",0);
//vertex = vertex_create_buffer();

#macro debug:SK_DEBUG_MODE true

//sk_armature_applyAtlas(arm,atlas);

bone = sk_bone_create("test");
show_message(sk_updatable_exists(bone));