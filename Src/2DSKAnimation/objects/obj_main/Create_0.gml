show_debug_overlay(true);
gml_pragma("global","room_instance_add(room_first,0,0,obj_main);");
/// @desc 
var atlas_path = get_open_filename("","");
var img_path = get_open_filename("","");
var atlas_scl = get_integer("Scale:",1);
var arm_path = get_open_filename("","");
var arm_scl = get_integer("Scale:",1);
xscale = arm_scl;
yscale = arm_scl;
if(show_question("DragonBones?")){
	atlas = sk_atlas_create_dragonbones(atlas_path,sprite_add(img_path,0,false,false,0,0),0,atlas_scl);
	arm = sk_armature_create_dragonbones(arm_path,0);
}else{
	atlas = sk_atlas_create_libgdx(atlas_path,sprite_add(img_path,0,false,false,0,0),0,atlas_scl);
	arm = sk_armature_create_spine(arm_path);
}

vertex = vertex_create_buffer();
sk_armature_set_atlas(arm,atlas);

anims = ds_list_create();
sk_armature_get_animations(arm,anims);
var a1 = anims[| 3];
var a2 = anims[| 4];
anim1 = sk_animation_exists(a1) ? sk_animation_get_name(a1) : undefined;
anim2 = sk_animation_exists(a2) ? sk_animation_get_name(a2) : undefined;

state = sk_animationState_create(arm);
sk_animationState_set_defaultMix(state,0.1);
sk_animationState_set_timescale(state,1);
sk_animationState_clear(state,anim1,-1);

thrownEvents = ds_list_create();