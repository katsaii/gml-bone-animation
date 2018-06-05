/// @desc draw UI
var v_armature = global.current_ske;
var i = 15;
if(sk_struct_exists(v_armature,sk_type_armature)){
	draw_text(10,20*i,"Left click to iterate through animations"); i++;
	draw_text(10,20*i,"Right click to iterate through bones"); i++;
	draw_text(10,20*i,"Press space to iterate through skins"); i++;
	draw_text(10,20*i,"Scroll to increase and decrease the rate of animation playback"); i++;
	draw_text(10,20*i,"Hold ctrl to reposition the root"); i++;
	draw_text(10,20*i,"Press numbers 1 through 6 to set debug flags"); i++;
	i++;
	draw_text(10,20*i,"Bone Current: "+string(v_bone_name)); i++;
	draw_text(10,20*i,"Skin Current: "+string(v_skin_name)); i++;
	draw_text(10,20*i,"Anim Current: "+string(v_anim_name)); i++;
	draw_text(10,20*i,"Bone Count: "+string(ds_list_size(v_armature[SK_ARMATURE.bones]))); i++;
	draw_text(10,20*i,"Slot Count: "+string(ds_list_size(v_armature[SK_ARMATURE.slots]))); i++;
	draw_text(10,20*i,"Skin Count: "+string(ds_list_size(v_armature[SK_ARMATURE.skins]))); i++;
	draw_text(10,20*i,"Constraint Count: "+string(ds_list_size(v_armature[SK_ARMATURE.constraints]))); i++;
	draw_text(10,20*i,"Attachment Count: "+string(ds_list_size(v_armature[SK_ARMATURE.attachments]))); i++;
	draw_text(10,20*i,"Anim Count: "+string(ds_list_size(v_armature[SK_ARMATURE.animations]))); i++;
	draw_text(10,20*i,"Debug Flags: "+string(v_debugArgs)); i++;
} else {
	draw_text(10,20*i,"Please load an armature");
}