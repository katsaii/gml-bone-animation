/// @desc initialise objects
#macro draw_reset_colour draw_set_colour($203621)
show_debug_overlay(true);
gml_release_mode(true);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
draw_set_font(font0);
draw_reset_colour;

#macro SANDBOX_ENABLED false
#macro sandbox:SANDBOX_ENABLED true
if(SANDBOX_ENABLED){
	instance_create_layer(0,0,layer,obj_demoState_sandbox);
	instance_destroy();
	exit;
}

global.available_ske = ds_list_create();
global.available_atlas = ds_list_create();

#region // load default skeletons

var m_path_tex = "";
var m_path_atlas = "";
var m_path_skel = "";
var m_atlas_scale = 1;
var m_atlas_type = "";
var m_skel_type = "";
#macro m_load_data \
var new_atlas = noone; \
var new_armature = noone; \
var new_texture = sprite_add(m_path_tex,0,false,false,0,0); \
if(file_exists(m_path_atlas)){ \
	var file = file_text_open_read(m_path_atlas);var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file); \
	switch(string_lower(m_atlas_type)){ \
		case "dragonbones": new_atlas = sk_atlas_build_dragonbones(raw,new_texture,0,m_atlas_scale); break; \
		case "spine": new_atlas = sk_atlas_build_libgdx(raw,new_texture,0,m_atlas_scale); break; \
		case "spriter": new_atlas = sk_atlas_build_spriter(raw,new_texture,0,m_atlas_scale); break; \
	} \
} \
if(file_exists(m_path_skel)){ \
	var file = file_text_open_read(m_path_skel);var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file); \
	switch(string_lower(m_skel_type)){ \
		case "dragonbones": new_armature = sk_armature_build_dragonbones(raw,0); break; \
		case "spine": new_armature = sk_armature_build_spine(raw,m_path_skel); break; \
		case "spriter": new_armature = sk_armature_build_spriter(raw,0); break; \
	} \
} \
if(sk_struct_isof(new_atlas,sk_type_atlas)){ \
	ds_list_add(global.available_atlas,new_atlas); \
} else { \
	sprite_delete(new_texture); \
} \
if(sk_struct_isof(new_armature,sk_type_armature)){ \
	ds_list_add(global.available_ske,new_armature); \
}

var PATH_DRAGON = "Skeletons/DragonBones/Egret/Dragon/";
var m_path_tex = PATH_DRAGON+"Dragon_tex.png";
var m_path_atlas = PATH_DRAGON+"Dragon_tex.json";
var m_path_skel = PATH_DRAGON+"Dragon_ske.json";
var m_atlas_scale = 1;
var m_atlas_type = "dragonbones";
var m_skel_type = "dragonbones";
m_load_data;

var PATH_DEMON = "Skeletons/DragonBones/Other/Demon/";
var m_path_tex = PATH_DEMON+"Demon_tex.png";
var m_path_atlas = PATH_DEMON+"Demon_tex.json";
var m_path_skel = PATH_DEMON+"Demon_ske.json";
var m_atlas_scale = 1;
var m_atlas_type = "dragonbones";
var m_skel_type = "dragonbones";
m_load_data;

var PATH_PALIA = "Skeletons/DragonBones/Nuxii/Palia/";
var m_path_tex = PATH_PALIA+"Palia_Skeleton_tex.png";
var m_path_atlas = PATH_PALIA+"Palia_Skeleton_tex.json";
var m_path_skel = PATH_PALIA+"Palia_Skeleton_ske.json";
var m_atlas_scale = 1;
var m_atlas_type = "dragonbones";
var m_skel_type = "dragonbones";
m_load_data;

var PATH_SPRITER = "Skeletons/Spriter/BrashMonkey/Platformer/";
var m_path_tex = PATH_SPRITER+"outJSON.png";
var m_path_atlas = PATH_SPRITER+"outJSON.json";
var m_path_skel = PATH_SPRITER+"outJSONskel.scon";
var m_atlas_scale = 1;
var m_atlas_type = "spriter";
var m_skel_type = "spriter";
m_load_data;

var PATH_GARFIELD = "Skeletons/Spriter/Nuxii/BinaryOrbit/";
var m_path_tex = PATH_GARFIELD+"output.png";
var m_path_atlas = PATH_GARFIELD+"output.json";
var m_path_skel = PATH_GARFIELD+"output.scon";
var m_atlas_scale = 1;
var m_atlas_type = "spriter";
var m_skel_type = "spriter";
m_load_data;

var PATH_SPINEBOY = "Skeletons/Spine/Esoteric/Spineboy/";
var m_path_tex = PATH_SPINEBOY+"spineboy.png";
var m_path_atlas = PATH_SPINEBOY+"spineboy.atlas";
var m_path_skel = PATH_SPINEBOY+"spineboy-ess.json";
var m_atlas_scale = 2;
var m_atlas_type = "spine";
var m_skel_type = "spine";
m_load_data;

var PATH_GOBLINS = "Skeletons/Spine/Esoteric/Goblins/";
var m_path_tex = PATH_GOBLINS+"goblins.png";
var m_path_atlas = PATH_GOBLINS+"goblins.atlas";
var m_path_skel = PATH_GOBLINS+"goblins-ess.json";
var m_atlas_scale = 1;
var m_atlas_type = "spine";
var m_skel_type = "spine";
m_load_data;

var PATH_HERO = "Skeletons/Spine/Other/Hero/";
var m_path_tex = PATH_HERO+"hero.png";
var m_path_atlas = PATH_HERO+"hero.atlas";
var m_path_skel = PATH_HERO+"hero-ess.json";
var m_atlas_scale = 1;
var m_atlas_type = "spine";
var m_skel_type = "spine";
m_load_data;

#endregion

global.current_ske = global.available_ske[| 0];
global.current_atlas = global.available_atlas[| 0];
global.current_animation = noone;

instance_create_layer(0,0,layer,obj_demoState_benchmark);
instance_create_layer(0,0,layer,obj_demoState_view);
instance_create_layer(0,0,layer,obj_demoState_atlas);
instance_deactivate_object(obj_demoState_view);
instance_deactivate_object(obj_demoState_atlas);

default_format = "DragonBones";

global.mouse_xprevious = 0;
global.mouse_yprevious = 0;