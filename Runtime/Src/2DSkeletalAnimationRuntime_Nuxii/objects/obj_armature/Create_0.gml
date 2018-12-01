/// @desc initialise variables
v_buffinit = false;
v_buffskel = vertex_create_buffer();
v_bufftex = -1;
v_armature = noone;
v_atlas = noone;
v_xscale = 1;
v_yscale = 1;
v_anim = noone;
v_rate = random_range(0.01,0.02);
v_timeLast = 0;
v_phys = ds_map_create();

v_tick = false;