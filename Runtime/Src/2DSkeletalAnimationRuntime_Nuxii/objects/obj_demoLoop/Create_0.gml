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

var PATH_DRAGON = "Skeletons/DragonBones/Egret/Dragon/";
var PATH_DEMON = "Skeletons/DragonBones/Other/Demon/";
var PATH_PALIA = "Skeletons/DragonBones/Nuxii/Palia/";
var PATH_SPRITER = "Skeletons/Spriter/BrashMonkey/Platformer/";
var PATH_GARFIELD = "Skeletons/Spriter/Nuxii/BinaryOrbit/";
var PATH_SPINEBOY = "Skeletons/Spine/Esoteric/Spineboy/";
var PATH_GOBLINS = "Skeletons/Spine/Esoteric/Goblins/";
var PATH_HERO = "Skeletons/Spine/Other/Hero/";

var default_skeletons = [
	[PATH_DRAGON+"Dragon_tex.png",PATH_DRAGON+"Dragon_tex.json",PATH_DRAGON+"Dragon_ske.json",1,"dragonbones","dragonbones"],
	[PATH_DEMON+"Demon_tex.png",PATH_DEMON+"Demon_tex.json",PATH_DEMON+"Demon_ske.json",1,"dragonbones","dragonbones"],
	[PATH_PALIA+"Palia_Skeleton_tex.png",PATH_PALIA+"Palia_Skeleton_tex.json",PATH_PALIA+"Palia_Skeleton_ske.json",1,"dragonbones","dragonbones"],
	[PATH_SPRITER+"outJSON.png",PATH_SPRITER+"outJSON.json",PATH_SPRITER+"outJSONskel.scon",1,"spriter","spriter"],
	[PATH_GARFIELD+"output.png",PATH_GARFIELD+"output.json",PATH_GARFIELD+"output.scon",1,"spriter","spriter"],
	[PATH_SPINEBOY+"spineboy.png",PATH_SPINEBOY+"spineboy.atlas",PATH_SPINEBOY+"spineboy-ess.json",2,"spine","spine"],
	[PATH_GOBLINS+"goblins.png",PATH_GOBLINS+"goblins.atlas",PATH_GOBLINS+"goblins-ess.json",1,"spine","spine"],
	[PATH_HERO+"hero.png",PATH_HERO+"hero.atlas",PATH_HERO+"hero-ess.json",1,"spine","spine"]
];
var skeleton_count = array_length_1d(default_skeletons);
for(var i = 0; i < skeleton_count; i++){
	var m = default_skeletons[i];
	var m_path_tex = m[0];
	var m_path_atlas = m[1];
	var m_path_skel = m[2];
	var m_atlas_scale = m[3];
	var m_atlas_type = m[4];
	var m_skel_type = m[5];
	
	var new_atlas = noone;
	var new_armature = noone;
	var new_texture = sprite_add(m_path_tex,0,false,false,0,0);
	if(file_exists(m_path_atlas)){
		var file = file_text_open_read(m_path_atlas);var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file);
		switch(string_lower(m_atlas_type)){
			case "dragonbones": new_atlas = sk_atlas_build_dragonbones(raw,new_texture,0,m_atlas_scale); break;
			case "spine": new_atlas = sk_atlas_build_libgdx(raw,new_texture,0,m_atlas_scale); break;
			case "spriter": new_atlas = sk_atlas_build_spriter(raw,new_texture,0,m_atlas_scale); break;
		}
	}
	if(file_exists(m_path_skel)){
		var file = file_text_open_read(m_path_skel);var raw = "";do{raw += file_text_read_string(file)+"\n";file_text_readln(file);}until(file_text_eof(file));file_text_close(file);
		switch(string_lower(m_skel_type)){
			case "dragonbones": new_armature = sk_armature_build_dragonbones(raw,0); break;
			case "spine": new_armature = sk_armature_build_spine(raw,m_path_skel); break;
			case "spriter": new_armature = sk_armature_build_spriter(raw,0); break;
		}
	}
	if(sk_struct_isof(new_atlas,sk_type_atlas)){
		ds_list_add(global.available_atlas,new_atlas);
	} else {
		sprite_delete(new_texture);
	}
	if(sk_struct_isof(new_armature,sk_type_armature)){
		ds_list_add(global.available_ske,new_armature);
	}
}

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