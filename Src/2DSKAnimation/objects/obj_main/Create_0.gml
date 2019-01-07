show_debug_overlay(true);
gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
atlas = sk_atlas_create_dragonbones("Palia_Skeleton_tex.json",sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0),0,1);
arm = sk_armature_create_dragonbones("Palia_Skeleton_ske.json",0);
vertex = vertex_create_buffer();

sk_armature_set_atlas(arm,atlas);

bones = ds_list_create();
sk_armature_get_bones(arm,bones);
bone = bones[| ds_list_find_index_sk_bone(bones,"b_ik_arm_left")];

timeline = sk_translate_timeline_create(bone);
var keys = ds_list_create();
ds_list_add(keys,0,-16,0,SK_EASE_SMOOTHSTEP_INV);
ds_list_add(keys,10,-5,0,SK_EASE_SMOOTHSTEP);
sk_translate_timeline_set_keyframes(timeline,keys);