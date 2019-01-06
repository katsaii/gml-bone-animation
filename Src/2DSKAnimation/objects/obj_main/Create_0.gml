show_debug_overlay(true);
gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
atlas = sk_atlas_create_dragonbones("Palia_Skeleton_tex.json",sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0),0,1);
//arm = sk_armature_create_dragonbones("Palia_Skeleton_ske.json",0);
vertex = vertex_create_buffer();

//sk_armature_applyAtlas(arm,atlas);

att = sk_plane_attachment_create("");
sk_plane_attachment_set_regionKey(att,"base_body");
sk_plane_attachment_set_atlas(att,atlas);
bone = sk_bone_create("");
slot = sk_slot_create("");
var m = ds_map_create();
m[? "attachment1"] = att;
sk_slot_set_attachments(slot,m);
sk_slot_set_pose_applied(slot,c_white,1,bone,att);