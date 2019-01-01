gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
var file = file_text_open_read("Palia_Skeleton_tex.json");var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file);
var tex = sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0);
a = sk_atlas_create_dragonbones(raw,tex,0,1);

b = sk_bone_create("a");
b2 = sk_bone_create("b");
sk_bone_set_setupPose(b,10,0,1,1,0,0,45,sk_transformMode_normal);
sk_bone_set_setupPose(b2,100,0,1,1,0,0,-110,sk_transformMode_normal);
sk_bone_setToSetupPose(b);
sk_bone_setToSetupPose(b2);
sk_bone_updateWorldTransform(b);
sk_bone_updateWorldTransform_other(b2,b);

s = sk_slot_create("s");

att = sk_attachment_create_plane("t");
sk_attachment_plane_set_matrix(att,0,0,10,10,0,0,0);
sk_attachment_plane_set_region(att,"base_head");
sk_attachment_plane_updateRegionData(att,a);

v = vertex_create_buffer();