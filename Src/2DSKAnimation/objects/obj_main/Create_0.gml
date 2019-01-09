//show_debug_overlay(true);
gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
atlas = sk_atlas_create_dragonbones("Palia_Skeleton_tex.json",sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0),0,1);
arm = sk_armature_create_dragonbones("Palia_Skeleton_ske.json",0);
vertex = vertex_create_buffer();

sk_armature_set_atlas(arm,atlas);

anims = ds_list_create();
sk_armature_get_animations(arm,anims);
anim = anims[| ds_list_find_index_sk_animation(anims,"anim_run")];

last_time = 0;
events = ds_list_create();