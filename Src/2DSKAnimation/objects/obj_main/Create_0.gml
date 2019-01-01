gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
var file = file_text_open_read("Palia_Skeleton_tex.json");var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file);
var tex = sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0);
a = sk_atlas_create_dragonbones(raw,tex,0,1);

b = sk_bone_create("a");
b2 = sk_bone_create("b");
sk_bone_set_setupPose(b,10,0,1,1,0,0,45,sk_transformMode_normal);
sk_bone_set_setupPose(b2,100,0,1,1,0,0,-110,sk_transformMode_normal);
sk_bone_set_parent(b2,b);

s = sk_slot_create("s");

sk_symbol_set_setupPose(s,c_white,1,b2,undefined);

att = sk_attachment_create_plane("t");
sk_attachment_plane_set_matrix(att,0,0,10,10,0,0,0);
sk_attachment_plane_set_region(att,"base_head");
sk_attachment_plane_updateRegionData(att,a);

att2 = sk_attachment_create_plane("t");
sk_attachment_plane_set_matrix(att2,0,0,10,10,0,0,0);
sk_attachment_plane_set_region(att2,"classic_body");
sk_attachment_plane_updateRegionData(att2,a);

sk = sk_skin_create("sk");
var remap = ds_map_create();
remap[? att] = att2;
sk_skin_remap_add(sk,remap,"classic");
sk_skin_record_add(sk,s,att,"k");
sk_skin_remap_stack_push(sk,"classic");
sk_skin_apply(sk,false);

sk_symbol_setup(s);
sk_symbol_updateAttachment(s,"k");

v = vertex_create_buffer();

ar = sk_armature_create("");
sk_armature_add_bone(ar,b);
sk_armature_add_bone(ar,b2);
sk_armature_updateCache(ar);
sk_armature_setToSetupPose(ar);
sk_armature_updateWorldTransform(ar);