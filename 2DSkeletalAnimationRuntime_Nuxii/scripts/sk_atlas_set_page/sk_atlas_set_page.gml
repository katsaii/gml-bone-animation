gml_pragma("forceinline");
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
	var sk_UVs = sprite_get_uvs(sk_sprite,sk_subimg);
	var uv_u = sk_UVs[0];
	var uv_v = sk_UVs[1];
	var uv_u2 = sk_UVs[2];
	var uv_v2 = sk_UVs[3];
	var uv_dx = sk_UVs[4]; // number of pixels trimmed from the left
	var uv_dy = sk_UVs[5]; // number of pixels trimmed from the top
	var uv_a = sk_UVs[6]; // ratio of discarded pixels horizontally
	var uv_b = sk_UVs[7]; // ratio of discarded pixels vertically
	var uv_width = (uv_u2-uv_u)/uv_a;
	var uv_height = (uv_v2-uv_v)/uv_b;
	var uv_kw = uv_width/sk_w;
	var uv_kh = uv_height/sk_h;
	// set data
	argument0[@ SK_ATLAS.texturePage] = sprite_get_texture(sk_sprite,sk_subimg);
	argument0[@ SK_ATLAS.UV_left] = uv_u-uv_dx*uv_kw;
	argument0[@ SK_ATLAS.UV_top] = uv_v-uv_dy*uv_kh;
	argument0[@ SK_ATLAS.UV_right] = argument0[SK_ATLAS.UV_left]+uv_width;
	argument0[@ SK_ATLAS.UV_bottom] = argument0[SK_ATLAS.UV_top]+uv_height;
} else {
	argument0[@ SK_ATLAS.texturePage] = -1;
	argument0[@ SK_ATLAS.UV_left] = 0;
	argument0[@ SK_ATLAS.UV_top] = 0;
	argument0[@ SK_ATLAS.UV_right] = 1;
	argument0[@ SK_ATLAS.UV_bottom] = 1;
}