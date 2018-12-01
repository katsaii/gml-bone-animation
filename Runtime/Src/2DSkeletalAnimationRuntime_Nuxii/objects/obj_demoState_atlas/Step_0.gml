/// @desc update atlas
var v_atlas = global.current_atlas;

if(sk_struct_isof(v_atlas,sk_type_atlas)){
	
	if(keyboard_check(vk_control)){
		x += mouse_x-global.mouse_xprevious;
		y += mouse_y-global.mouse_yprevious;
		exit;
	}
	
	v_xscale += (keyboard_check(vk_right)-keyboard_check(vk_left))*0.1;
	v_yscale -= (keyboard_check(vk_down)-keyboard_check(vk_up))*0.1;

	
	if(keyboard_check_pressed(ord("1"))){	v_debugArgs ^= sk_debug_atlas_texture;	}
	if(keyboard_check_pressed(ord("2"))){	v_debugArgs ^= sk_debug_atlas_regions;	}
	if(keyboard_check_pressed(ord("3"))){	v_debugArgs ^= sk_debug_atlas_regionOrigins;	}
	if(keyboard_check_pressed(ord("4"))){	v_debugArgs ^= sk_debug_atlas_regionNames;	}
		
}
