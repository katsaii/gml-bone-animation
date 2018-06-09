/// @desc initialise variables
v_buffinit = false;
v_buffskel = vertex_create_buffer();
v_bufftex = -1;
v_anim_id = -1;	v_anim_name = "N/A";
v_bone_id = -1;	v_bone_name = "N/A";
v_skin_id = -1;	v_skin_name = "N/A";
v_rate = 0.03;
v_timeLast = 0;
v_debugArgs = sk_debug_bones;
v_xscale = 1;
v_yscale = 1;

v_init = true;

v_phys = ds_map_create();

x = room_width div 2;
y = room_height div 2;