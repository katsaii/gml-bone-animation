/// @desc 

var buffx = room_width div 2;
var buffy = (room_height div 2)*1.4;
vertex_submit_transformed(v_buff,pr_trianglelist,bufftex,buffx,buffy,10,10,0);

//sk_animationState_draw_debug(animationState,buffx,buffy);

sk_armature_draw_debug(armature,buffx,buffy,10,10,0,sk_debug_boneStructure);