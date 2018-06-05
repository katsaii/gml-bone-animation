/// @desc 
/// @desc draw UI
var v_atlas = global.current_atlas;
var i = 15;
if(sk_struct_exists(v_atlas,sk_type_atlas)){
	draw_text(10,20*i,"Use the arrow keys to scale the atlas sheet"); i++;
	draw_text(10,20*i,"Hold ctrl to reposition the origin"); i++;
	draw_text(10,20*i,"Press numbers 1 through 4 to set debug flags"); i++;
	i++;
	draw_text(10,20*i,"Debug Flags: "+string(v_debugArgs)); i++;
} else {
	draw_text(10,20*i,"Please load an atlas");
}
