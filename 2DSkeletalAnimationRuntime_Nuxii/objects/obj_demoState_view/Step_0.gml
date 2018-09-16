/// @desc update armature
var v_armature = global.current_ske;
var v_atlas = global.current_atlas;

if(sk_struct_isof(v_armature,sk_type_armature)){
	
	if(keyboard_check(vk_control)){
		x += mouse_x-global.mouse_xprevious;
		y += mouse_y-global.mouse_yprevious;
		exit;
	}
	
	v_xscale += (keyboard_check(vk_right)-keyboard_check(vk_left))*0.1;
	v_yscale -= (keyboard_check(vk_down)-keyboard_check(vk_up))*0.1;

	
	if(keyboard_check_pressed(ord("1"))){	v_debugArgs ^= sk_debug_bones;	}
	if(keyboard_check_pressed(ord("2"))){	v_debugArgs ^= sk_debug_boneInheritance;	}
	if(keyboard_check_pressed(ord("3"))){	v_debugArgs ^= sk_debug_boneNames;	}
	if(keyboard_check_pressed(ord("4"))){	v_debugArgs ^= sk_debug_boneVectors;	}
	if(keyboard_check_pressed(ord("5"))){	v_debugArgs ^= sk_debug_boneBad;	}
	if(keyboard_check_pressed(ord("6"))){	v_debugArgs ^= sk_debug_simpleBones;	}
	
	if(mouse_check_button_pressed(mb_left)){
		v_anim_id++;
		if(v_anim_id>=ds_list_size(v_armature[SK_ARMATURE.animations])){
			v_anim_id=-1;
		}
	}
	if(mouse_check_button_pressed(mb_right)){
		v_bone_id++;
		if(v_bone_id>=ds_list_size(v_armature[SK_ARMATURE.bones])){
			v_bone_id=-1;
		}
	}
	var new_skin = false;
	if(keyboard_check_pressed(vk_space)){
		v_skin_id++;
		if(v_skin_id>=ds_list_size(v_armature[SK_ARMATURE.skins])){
			v_skin_id=-1;
		}
		new_skin = true;
	}
	v_rate += (mouse_wheel_up()-mouse_wheel_down())*0.001*(keyboard_check(vk_shift) ? 10 : 1);
	
	var v_bone = sk_armature_find(v_armature,sk_type_bone,v_bone_id);
	var v_skin = sk_armature_find(v_armature,sk_type_skin,v_skin_id);
	var v_anim = sk_armature_find(v_armature,sk_type_animation,v_anim_id);
	var v_time = current_time*v_rate;
	
	v_bone_name = "N/A";
	v_skin_name = "N/A";
	v_anim_name = "N/A";
	
	if(sk_struct_isof(v_skin,sk_type_skin)){
		if(v_init||new_skin){
			sk_armature_setToDefaultSkin(v_armature);
			sk_skin_apply(v_skin,false);
			sk_armature_setToDefaultDisplay(v_armature);
			v_init = false;
		}
		v_skin_name = sk_struct_get_name(v_skin);
	}	
	sk_armature_setToSetupPose(v_armature);
	if(sk_struct_isof(v_anim,sk_type_animation)){
		sk_animation_apply(v_anim,v_timeLast,v_time,sk_mixPose_add,1,true);
		v_anim_name = sk_struct_get_name(v_anim);
		global.current_animation = v_anim;
	}
	sk_physics_boneState = noone;
	sk_armature_updateWorldTransform(v_armature);
	if(sk_struct_isof(v_bone,sk_type_bone)){
		v_bone[@ SK_BONE.XWorld] = (mouse_x-x)/v_xscale;
		v_bone[@ SK_BONE.YWorld] = (mouse_y-y)/v_yscale;
		v_bone_name = sk_struct_get_name(v_bone);
		sk_bone_updateAppliedTransform(v_bone);
	}
	sk_physics_boneState = v_phys;
	sk_armature_updateWorldTransform(v_armature);
	
	v_timeLast = v_time;
	if(sk_struct_isof(v_atlas,sk_type_atlas)){
		v_bufftex = vertex_bake_armature(v_armature,v_atlas,v_buffskel);
		v_buffinit = true; // so there is no error
	}
}
