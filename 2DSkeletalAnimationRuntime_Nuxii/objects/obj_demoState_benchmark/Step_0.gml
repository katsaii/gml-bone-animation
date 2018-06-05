/// @desc create armatures
if(keyboard_check(vk_control)){
	with(obj_armature){
		x += mouse_x-global.mouse_xprevious;
		y += mouse_y-global.mouse_yprevious;
	}
	exit;
}

v_xscale += (keyboard_check(vk_right)-keyboard_check(vk_left))*0.1;
v_yscale -= (keyboard_check(vk_down)-keyboard_check(vk_up))*0.1;

if(mouse_check_button_pressed(mb_left)){
	var sk = global.current_ske;
	var at = global.current_atlas;
	if(sk_struct_exists(sk,sk_type_armature)&&sk_struct_exists(at,sk_type_atlas)){
		var xscale = v_xscale;
		var yscale = v_yscale;
		with(instance_create_layer(mouse_x,mouse_y,layer,obj_armature)){
			v_armature = sk;
			v_atlas = at;
			
			v_xscale = xscale;
			v_yscale = yscale;
			v_anim = global.current_animation;
		}
	}
}