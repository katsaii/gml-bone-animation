SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc sets a property
/// @param atlas
/// @param sprite
/// @param subimg
var sk_sprite = argument1;
var sk_subimg = argument2;
if(sprite_exists(sk_sprite)){
	// correct dimensions of uv coordinates beyond the texture atlas dimensions
	// this allows texture pages to be stored and cropped without having to be a power of two format
	var sk_w = sprite_get_width(sk_sprite);
	var sk_h = sprite_get_height(sk_sprite);
	var sk_uvs = sprite_get_uvs(sk_sprite,sk_subimg);
	var sk_uv_u = sk_uvs[0];
	var sk_uv_v = sk_uvs[1];
	var sk_uv_u2 = sk_uvs[2];
	var sk_uv_v2 = sk_uvs[3];
	var sk_uv_dx = sk_uvs[4]; // number of pixels trimmed from the left
	var sk_uv_dy = sk_uvs[5]; // number of pixels trimmed from the top
	var sk_uv_a = sk_uvs[6]; // ratio of discarded pixels horizontally
	var sk_uv_b = sk_uvs[7]; // ratio of discarded pixels vertically
	var sk_uv_width = (sk_uv_u2-sk_uv_u)/sk_uv_a;
	var sk_uv_height = (sk_uv_v2-sk_uv_v)/sk_uv_b;
	var sk_uv_kw = sk_uv_width/sk_w;
	var sk_uv_kh = sk_uv_height/sk_h;
	// set data
	argument0[@ sk_atlas.texturePage] = sprite_get_texture(sk_sprite,sk_subimg);
	argument0[@ sk_atlas.UVLeft] = sk_uv_u-sk_uv_dx*sk_uv_kw;
	argument0[@ sk_atlas.UVTop] = sk_uv_v-sk_uv_dy*sk_uv_kh;
	argument0[@ sk_atlas.UVRight] = argument0[sk_atlas.UVLeft]+sk_uv_width;
	argument0[@ sk_atlas.UVBottom] = argument0[sk_atlas.UVTop]+sk_uv_height;
}else{
	argument0[@ sk_atlas.texturePage] = -1;
	argument0[@ sk_atlas.UVLeft] = 0;
	argument0[@ sk_atlas.UVTop] = 0;
	argument0[@ sk_atlas.UVRight] = 1;
	argument0[@ sk_atlas.UVBottom] = 1;
}