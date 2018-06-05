/// @desc draw buffer
if(v_buffinit){
	vertex_submit_transformed(v_buffskel,pr_trianglelist,v_bufftex,x,y,v_xscale,v_yscale,0);
}
var v_armature = global.current_ske;
if(sk_struct_exists(v_armature,sk_type_armature)){
	sk_armature_draw_debug(v_armature,x,y,v_xscale,v_yscale,0,v_debugArgs);
	draw_reset_colour;
}