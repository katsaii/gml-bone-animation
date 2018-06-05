/// @desc toggle between states + load data
if(keyboard_check_pressed(vk_tab)){
	if(instance_exists(obj_demoState_benchmark)){
		instance_deactivate_all(true);
		instance_activate_object(obj_demoState_view);
	} else if(instance_exists(obj_demoState_view)){
		instance_deactivate_all(true);
		instance_activate_object(obj_demoState_atlas);
	} else if(instance_exists(obj_demoState_atlas)){
		instance_activate_all();
		instance_deactivate_object(obj_demoState_view);
		instance_deactivate_object(obj_demoState_atlas);
	}
}
if(keyboard_check_pressed(ord("Z"))){
	// goto next atlas
	var sk_id = ds_list_find_index(global.available_atlas,global.current_atlas)+1;
	if(sk_id>ds_list_size(global.available_atlas)){
		sk_id = 0;
	}
	global.current_atlas = global.available_atlas[| max(sk_id,0)];
}
if(keyboard_check_pressed(ord("X"))){
	// goto next armature
	var sk_id = ds_list_find_index(global.available_ske,global.current_ske)+1;
	if(sk_id>ds_list_size(global.available_ske)){
		sk_id = 0;
	}
	global.current_ske = global.available_ske[| max(sk_id,0)];
}
if(keyboard_check_pressed(ord("A"))){
	var format = get_string("Please supply the format of the atlas to load: \n- DragonBones\n- Spriter\n- Spine",default_format);
	if(format!=""){
		show_message("Please select a sprite sheet");
		var filepath = get_open_filename("Image File|*.png;*.gif;*.jpg;*.jpeg","");
		var new_texture = sprite_add(filepath,0,false,false,0,0);
		show_message("Please select an atlas file");
		filepath = get_open_filename("Atlas File|*.json;*.scon;*.atlas","");
		var atlas_scale = real(get_string("Please supply the relative scale to scale regions by","1"));
		var new_atlas = noone;
		if(file_exists(filepath)){
			var file = file_text_open_read(filepath);
			var raw = "";
			do{
				raw += file_text_read_string(file)+"\n";
				file_text_readln(file);
			}until(file_text_eof(file))
			switch(string_lower(format)){
				case "dragonbones":
					new_atlas = sk_atlas_build_dragonbones(raw,atlas_scale);
				break;
				case "spine":
					new_atlas = sk_atlas_build_libgdx(raw,atlas_scale);
				break;
				case "spriter":
					new_atlas = sk_atlas_build_spriter(raw,atlas_scale);
				break;
			}
			file_text_close(file);
		}
		if(sk_struct_exists(new_atlas,sk_type_atlas)){
			// assign
			global.current_atlas = new_atlas;
			sk_atlas_assignPage(new_atlas,new_texture,0);
			default_format = format;
		} else {
			show_message("Invalid atlas file");
			if(sprite_exists(new_texture)){
				sprite_delete(new_texture);
			}
		}
	}
}
if(keyboard_check_pressed(ord("S"))){
	var format = get_string("Please supply the format of the skeleton to load: \n- DragonBones\n- Spriter\n- Spine",default_format);
	if(format!=""){
		show_message("Please select a skeleton file");
		filepath = get_open_filename("Skeleton File|*.json;*.scon;*.skel","");
		var armature_name = get_string("Please supply the name or ID of the armature to load","0");
		if(string(real(armature_name))==armature_name){// id
			armature_name = real(armature_name);
		}
		var new_armature = noone;
		if(file_exists(filepath)){
			var file = file_text_open_read(filepath);
			var raw = "";
			do{
				raw += file_text_read_string(file)+"\n";
				file_text_readln(file);
			}until(file_text_eof(file))
			switch(string_lower(format)){
				case "dragonbones":
					new_armature = sk_armature_build_dragonbones(raw,armature_name);
				break;
				case "spine":
					new_armature = sk_armature_build_spine(raw,armature_name);
				break;
				case "spriter":
					new_armature = sk_armature_build_spriter(raw,armature_name);
				break;
			}
			file_text_close(file);
		}
		if(sk_struct_exists(new_armature,sk_type_armature)){
			// assign
			global.current_ske = new_armature;
			default_format = format;
		} else {
			show_message("Invalid skeleton file, or armature does not exist");
		}
	}
}