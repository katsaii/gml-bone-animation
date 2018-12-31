gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
var file = file_text_open_read("Palia_Skeleton_tex.json");var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file);
var tex = sprite_add("Palia_Skeleton_tex.png",0,false,false,0,0);
a = sk_atlas_create_dragonbones(raw,tex,0,1);