show_debug_overlay(true);
gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
atlas = sk_atlas_create_dragonbones("Palia_Skeleton_tex.json",sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0),0,1);
arm = sk_armature_create_dragonbones("Palia_Skeleton_ske.json",0);
vertex = vertex_create_buffer();

sk_armature_set_atlas(arm,atlas);

anims = ds_list_create();
sk_armature_get_animations(arm,anims);
blink = anims[| ds_list_find_index_sk_animation(anims,"anim_blink")];

state = sk_animationState_create(arm);
sk_animationState_set_defaultMix(state,0.1);
sk_animationState_set_timescale(state,1);
sk_animationState_clear(state,"anim_idle",-1);

last_time = 0;
thrownEvents = ds_list_create();