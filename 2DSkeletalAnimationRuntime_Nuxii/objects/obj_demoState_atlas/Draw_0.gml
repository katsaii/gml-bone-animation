/// @desc draw atlas
if(sk_struct_exists(global.current_atlas,sk_type_atlas)){
	var v_width = 200*v_xscale;
	var v_height = 200*v_yscale;
	sk_atlas_draw_debug(global.current_atlas,x-v_width*0.5,y-v_height*0.5,v_width,v_height,v_debugArgs);
}