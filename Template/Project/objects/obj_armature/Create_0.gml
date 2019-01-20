/// @desc load armature
if(show_question("Santa?")){
	atlas = sk_atlas_create_dragonbones("Santa_tex.json",spr_santa,0,1);
	arm = sk_armature_create_dragonbones("Santa_ske.json","Armature");
	anim1 = "Run";
	anim2 = "Walk";
}else{
	atlas = sk_atlas_create_dragonbones("Dragon_tex.json",spr_dragon,0,1);
	arm = sk_armature_create_dragonbones("Dragon_ske.json","Dragon");
	anim1 = "walk";
	anim2 = "stand";
}

sk_armature_set_atlas(arm,atlas);

buff = vertex_create_buffer();
tex = sk_atlas_get_texture(atlas);

state = sk_animationState_create(arm);
sk_animationState_set_defaultMix(state,0.1);
sk_animationState_set_timescale(state,0.5);
sk_animationState_clear(state,anim2,-1);

image_xscale = 0.9;
image_yscale = image_xscale;