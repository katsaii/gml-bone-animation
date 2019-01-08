/// @desc loads an armature file
/// @param json
/// @param armature_name_or_id
var sk_db_armature = undefined;
// extract armature data from dragonbones json
var sk_db_arm = json_decode(argument0);
if(sk_db_arm==-1) then return undefined;
var sk_db_armatures = sk_db_arm[? "armature"];
if(is_real(sk_db_armatures)&&ds_exists(sk_db_armatures,ds_type_list)){
	var sk_db_armature_count = ds_list_size(sk_db_armatures);
    for(var sk_db_armature_id = 0; sk_db_armature_id < sk_db_armature_count; sk_db_armature_id++){
        var sk_db_armature_data = sk_db_armatures[| sk_db_armature_id];
        if(
			is_real(sk_db_armature_data)&&ds_exists(sk_db_armature_data,ds_type_map)&&
			(sk_db_armature_data[? "type"]=="Armature")&&((sk_db_armature_data[? "name"]==argument1)||(sk_db_armature_id==argument1))
		){
    		// armature found
			sk_db_armature = sk_db_armature_data;
			break;
    	}
    }
}
if(sk_db_armature==undefined){
	ds_map_destroy(sk_db_arm);
	return undefined;
}
// extract important data
var sk_db_bones = sk_db_armature[? "bone"];
var sk_db_slots = sk_db_armature[? "slot"];
var sk_db_skins = sk_db_armature[? "skin"];
var sk_db_IK = sk_db_armature[? "ik"];
var sk_db_animations = sk_db_armature[? "animation"];
var sk_db_fps = 1; //30/max(real(sk_db_armature[? "frameRate"]),1); // 30 fps baseline /* THIS WAS AN EXPERIMENTAL FEATURE FOR MAPPING THE FRAMERATE OF ANIMATIONS TO GAMESPEED*/
// create containers
var sk_bones = ds_list_create();
var sk_constraints = ds_list_create();
var sk_slots = ds_list_create();
var sk_animations = ds_list_create();
var sk_skins = ds_list_create();
var sk_attachments = ds_list_create();
var sk_events = ds_list_create();
// transfer bone data
if(is_real(sk_db_bones)&&ds_exists(sk_db_bones,ds_type_list)){
	var sk_db_bone_count = ds_list_size(sk_db_bones);
	for(var sk_db_bone_id = 0; sk_db_bone_id < sk_db_bone_count; sk_db_bone_id++){
	    var sk_db_bone_record = sk_db_bones[| sk_db_bone_id];
	    if(is_real(sk_db_bone_record)&&ds_exists(sk_db_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(sk_db_bone_record[? "name"]);
	        var sk_bone_len = real(sk_db_bone_record[? "length"]);
	        var sk_bone_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_bone_record[? "parent"])];
			var sk_bone_xpos = 0;
	        var sk_bone_ypos = 0;
	        var sk_bone_xsc = 1;
	        var sk_bone_ysc = 1;
	        var sk_bone_xsh = 0;
			var sk_bone_ysh = 0;
	        var sk_bone_inherit_rotation = !is_real(sk_db_bone_record[? "inheritRotation"])||sk_db_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(sk_db_bone_record[? "inheritScale"])||sk_db_bone_record[? "inheritScale"];
			var sk_bone_inheritance = real(
				(SK_TRANSFORM_MODE_ROTATE*sk_bone_inherit_rotation)|
				(SK_TRANSFORM_MODE_SCALE*sk_bone_inherit_scale)|
				SK_TRANSFORM_MODE_TRANSLATE|
				SK_TRANSFORM_MODE_SKEW
			);
	        // obtain transformation data
	        var sk_db_bone_transformations = sk_db_bone_record[? "transform"];
	        if(is_real(sk_db_bone_transformations)&&ds_exists(sk_db_bone_transformations,ds_type_map)){
				sk_bone_xpos = real(sk_db_bone_transformations[? "x"]);
				sk_bone_ypos = real(sk_db_bone_transformations[? "y"]);
				sk_bone_xsc = is_real(sk_db_bone_transformations[? "scX"]) ? sk_db_bone_transformations[? "scX"] : 1;
				sk_bone_ysc = is_real(sk_db_bone_transformations[? "scY"]) ? sk_db_bone_transformations[? "scY"] : 1;
				sk_bone_xsh = -real(sk_db_bone_transformations[? "skX"]);
				sk_bone_ysh = -real(sk_db_bone_transformations[? "skY"]);
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name,sk_bone_par,sk_bone_len);
			sk_bone_set_pose(
				sk_bone,
				sk_bone_xpos,sk_bone_ypos,
				sk_bone_xsc,sk_bone_ysc,
				sk_bone_xsh,sk_bone_ysh,
				0,
				sk_bone_inheritance
			);
			ds_list_add(sk_bones,sk_bone);
			#endregion
	    }
	}
}
// transfer slot data
if(is_real(sk_db_slots)&&ds_exists(sk_db_slots,ds_type_list)){
	var sk_db_slot_count = ds_list_size(sk_db_slots);
	for(var sk_db_slot_id = 0; sk_db_slot_id < sk_db_slot_count; sk_db_slot_id++){
	    var sk_db_slot_record = sk_db_slots[| sk_db_slot_id];
	    if(is_real(sk_db_slot_record)&&ds_exists(sk_db_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(sk_db_slot_record[? "name"]);
   			var sk_slot_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_slot_record[? "parent"])];
			var sk_slot_displayIndex = string(real(sk_db_slot_record[? "displayIndex"]));
			var sk_slot_col = $ffffff;
	        var sk_slot_a = 1;
	        // obtain colour data
	        var sk_db_slot_colourData = sk_db_slot_record[? "color"];
	        if(is_real(sk_db_slot_colourData)&&ds_exists(sk_db_slot_colourData,ds_type_map)){
	            var sk_rgba_r = sk_db_slot_colourData[? "rM"];
	            var sk_rgba_g = sk_db_slot_colourData[? "gM"];
	            var sk_rgba_b = sk_db_slot_colourData[? "bM"];
	            var sk_rgba_a = sk_db_slot_colourData[? "aM"];
	            sk_slot_col = make_colour_rgb(
					is_real(sk_rgba_r) ? sk_rgba_r : 255,
					is_real(sk_rgba_g) ? sk_rgba_g : 255,
					is_real(sk_rgba_b) ? sk_rgba_b : 255
				);
	            sk_slot_a = is_real(sk_rgba_a) ? sk_rgba_a : 1;
	        }
			// create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name);
			sk_slot_set_pose(
				sk_slot,
				sk_slot_col,
				sk_slot_a,
				sk_slot_par,
				sk_slot_displayIndex
			);
			ds_list_add(sk_slots,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(sk_db_skins)&&ds_exists(sk_db_skins,ds_type_list)){
	var sk_db_skin_count = ds_list_size(sk_db_skins);
	for(var sk_db_skin_id = 0; sk_db_skin_id < sk_db_skin_count; sk_db_skin_id++){
	    var sk_db_skin_record = sk_db_skins[| sk_db_skin_id];
	    if(is_real(sk_db_skin_record)&&ds_exists(sk_db_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin_name = is_string(sk_db_skin_record[? "name"]) ? sk_db_skin_record[? "name"] : "";
			var sk_skin = sk_skin_create(sk_skin_name);
			ds_list_add(sk_skins,sk_skin);
			// compile slot attachment data
			var sk_db_skin_slots = sk_db_skin_record[? "slot"];
			if(is_real(sk_db_skin_slots)&&ds_exists(sk_db_skin_slots,ds_type_list)){
				// iterate through skin slots and add their display data
				var sk_db_skin_slot_count = ds_list_size(sk_db_skin_slots);
				for(var sk_db_skin_slot_id = 0; sk_db_skin_slot_id < sk_db_skin_slot_count; sk_db_skin_slot_id++){
				    var sk_db_skin_slot_record = sk_db_skin_slots[| sk_db_skin_slot_id];
				    if(is_real(sk_db_skin_slot_record)&&ds_exists(sk_db_skin_slot_record,ds_type_map)){
						var sk_skin_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_db_skin_slot_record[? "name"])];
						var sk_db_skin_slot_displays = sk_db_skin_slot_record[? "display"];
						if((sk_skin_slotData!=undefined)&&is_real(sk_db_skin_slot_displays)&&ds_exists(sk_db_skin_slot_displays,ds_type_list)){
							// iterate through slot displays and create attachments
							var sk_db_skin_slot_display_count = ds_list_size(sk_db_skin_slot_displays);
							for(var sk_db_skin_slot_display_id = 0; sk_db_skin_slot_display_id < sk_db_skin_slot_display_count; sk_db_skin_slot_display_id++){
							    var sk_db_skin_slot_display_record = sk_db_skin_slot_displays[| sk_db_skin_slot_display_id];
							    if(is_real(sk_db_skin_slot_display_record)&&ds_exists(sk_db_skin_slot_display_record,ds_type_map)){
									#region // add attachment to skin
									// attachment name is a combination of its parent slot and the path of the texture
									var sk_attachment_name = string(sk_slot_get_name(sk_skin_slotData))+"."+string(sk_db_skin_slot_display_record[? "name"]);
									switch(sk_db_skin_slot_display_record[? "type"]){
										case "mesh": case "point": break; // not supported
										case "image": default:
											// create plane attachment
											var sk_attachment_textureName = sk_db_skin_slot_display_record[? "name"];
											var sk_attachment_x = 0;
											var sk_attachment_y = 0;
											var sk_attachment_xscale = 1;
											var sk_attachment_yscale = 1;
											var sk_attachment_xshear = 0;
											var sk_attachment_yshear = 0;
											// compile transformation data
											var sk_db_attachment_transformations = sk_db_skin_slot_display_record[? "transform"];
											if(is_real(sk_db_attachment_transformations)&&ds_exists(sk_db_attachment_transformations,ds_type_map)){
						                        sk_attachment_x = real(sk_db_attachment_transformations[? "x"]);
						                        sk_attachment_y = real(sk_db_attachment_transformations[? "y"]);
						                        sk_attachment_xscale = is_real(sk_db_attachment_transformations[? "scX"]) ? sk_db_attachment_transformations[? "scX"] : 1;
						                        sk_attachment_yscale = is_real(sk_db_attachment_transformations[? "scY"]) ? sk_db_attachment_transformations[? "scY"] : 1;
						                        sk_attachment_xshear = -real(sk_db_attachment_transformations[? "skX"]);
												sk_attachment_yshear = -real(sk_db_attachment_transformations[? "skY"]);
						                    }
											// create a new attachment and add it to the skin
											var sk_attachment = sk_plane_attachment_create(sk_attachment_name);
											sk_plane_attachment_set_regionKey(sk_attachment,sk_attachment_textureName);
											sk_plane_attachment_set_matrix(
												sk_attachment,
												sk_attachment_x,sk_attachment_y,
												sk_attachment_xscale,sk_attachment_yscale,
												sk_attachment_xshear,sk_attachment_yshear,0
											);
											ds_list_add(sk_attachments,sk_attachment);
											sk_skin_record_add(
												sk_skin,
												sk_skin_slotData,
												sk_attachment,
												string(sk_db_skin_slot_display_id)
											);
										break;
									}
									#endregion
								}
							}
						}
					}
				}
			}
			#endregion
		}
	}
}
// transfer IKConstraint data 
if(is_real(sk_db_IK)&&ds_exists(sk_db_IK,ds_type_list)){
	var sk_db_IK_count = ds_list_size(sk_db_IK);
	for(var sk_db_IK_id = 0; sk_db_IK_id < sk_db_IK_count; sk_db_IK_id++){
	    var sk_db_IK_record = sk_db_IK[| sk_db_IK_id];
	    if(is_real(sk_db_IK_record)&&ds_exists(sk_db_IK_record,ds_type_map)){
			#region // add IK constraint
			var sk_IK_name = string(sk_db_IK_record[? "name"]);
			var sk_IK_chain = sk_db_IK_record[? "chain"]||false;
	        var sk_IK_boneTarget = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_IK_record[? "target"])];
			var sk_IK_boneJoint = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_db_IK_record[? "bone"])];
			var sk_IK_positive = (is_undefined(sk_db_IK_record[? "bendPositive"])||sk_db_IK_record[? "bendPositive"]) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE;
			var sk_IK_weight = is_real(sk_db_IK_record[? "weight"]) ? sk_db_IK_record[? "weight"] : 1;
			// create new record and set data
			var sk_constraint = sk_ik_constraint_create(sk_IK_name,sk_IK_boneJoint,sk_IK_boneTarget,sk_IK_chain);
			sk_ik_constraint_set_pose(
				sk_constraint,
				sk_IK_positive,
				sk_IK_weight
			);
			ds_list_add(sk_constraints,sk_constraint);
			#endregion
	    }
	}
}
// transfer animation data
if(is_real(sk_db_animations)&&ds_exists(sk_db_animations,ds_type_list)){
	var sk_db_anim_count = ds_list_size(sk_db_animations);
	for(var sk_db_anim_id = 0; sk_db_anim_id < sk_db_anim_count; sk_db_anim_id++){
	    var sk_db_anim_record = sk_db_animations[| sk_db_anim_id];
	    if(is_real(sk_db_anim_record)&&ds_exists(sk_db_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(sk_db_anim_record[? "name"]));
			sk_animation_set_duration(sk_anim,real(sk_db_anim_record[? "duration"])*sk_db_fps,false);
			ds_list_add(sk_animations,sk_anim);
			var sk_anim_timelines = ds_list_create();
			// compile timeline data
			var sk_db_anim_bones = sk_db_anim_record[? "bone"];
			var sk_db_anim_slots = sk_db_anim_record[? "slot"];
			var sk_db_anim_ik = sk_db_anim_record[? "ik"];
			var sk_db_anim_events = sk_db_anim_record[? "frame"];
			var sk_db_anim_order = sk_db_anim_record[? "zOrder"];
			// iterate through bone data
			if(is_real(sk_db_anim_bones)&&ds_exists(sk_db_anim_bones,ds_type_list)){
	            var sk_db_anim_bone_count = ds_list_size(sk_db_anim_bones);
	            for(var sk_db_anim_bone_id = 0; sk_db_anim_bone_id < sk_db_anim_bone_count; sk_db_anim_bone_id++){
	                var sk_db_anim_bone_record = sk_db_anim_bones[| sk_db_anim_bone_id];
	                if(is_real(sk_db_anim_bone_record)&&ds_exists(sk_db_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(sk_db_anim_bone_record[? "name"]);
						var sk_anim_timeline_boneData = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_anim_timeline_boneName)];
						var sk_db_anim_bone_translate = sk_db_anim_bone_record[? "translateFrame"];
						var sk_db_anim_bone_scale = sk_db_anim_bone_record[? "scaleFrame"];
						var sk_db_anim_bone_rotate = sk_db_anim_bone_record[? "rotateFrame"];
						#region // compile translate timeline
						if(is_real(sk_db_anim_bone_translate)&&ds_exists(sk_db_anim_bone_translate,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_bone_translate);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_translate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_bone_translate[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_db_anim_frame_record[? "x"],
											sk_db_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_translate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(sk_db_anim_bone_scale)&&ds_exists(sk_db_anim_bone_scale,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_bone_scale);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_scale_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_bone_scale[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_db_anim_frame_record[? "x"],
											sk_db_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_scale_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
						#region // compile rotate timeline
						if(is_real(sk_db_anim_bone_rotate)&&ds_exists(sk_db_anim_bone_rotate,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_bone_rotate);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_rotate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_bone_rotate[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											-real(sk_db_anim_frame_record[? "rotate"]),
											-real(sk_db_anim_frame_record[? "clockwise"]), // this value is multiplied to the next frame to get the amount of extra periods of rotation
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_rotate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through slot data
			if(is_real(sk_db_anim_slots)&&ds_exists(sk_db_anim_slots,ds_type_list)){
	            var sk_db_anim_slot_count = ds_list_size(sk_db_anim_slots);
	            for(var sk_db_anim_slot_id = 0; sk_db_anim_slot_id < sk_db_anim_slot_count; sk_db_anim_slot_id++){
	                var sk_db_anim_slot_record = sk_db_anim_slots[| sk_db_anim_slot_id];
	                if(is_real(sk_db_anim_slot_record)&&ds_exists(sk_db_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(sk_db_anim_slot_record[? "name"]);
						var sk_anim_timeline_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_anim_timeline_slotName)];
						var sk_db_anim_slot_colour = sk_db_anim_slot_record[? "colorFrame"];
						var sk_db_anim_slot_display = sk_db_anim_slot_record[? "displayFrame"];
						#region // compile colour timeline
						if(is_real(sk_db_anim_slot_colour)&&ds_exists(sk_db_anim_slot_colour,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_slot_colour);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_colour_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_slot_colour[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
										// get colour
										var sk_anim_frame_colour = $ffffff;
		                                var sk_anim_frame_alpha = 1;
										var sk_db_anim_frame_colourData = sk_db_anim_frame_record[? "color"];
		                                if(is_real(sk_db_anim_frame_colourData)&&ds_exists(sk_db_anim_frame_colourData,ds_type_map)){
		                                    var sk_anim_frame_r = sk_db_anim_frame_colourData[? "rM"];
		                                    var sk_anim_frame_g = sk_db_anim_frame_colourData[? "gM"];
		                                    var sk_anim_frame_b = sk_db_anim_frame_colourData[? "bM"];
		                                    var sk_anim_frame_a = sk_db_anim_frame_colourData[? "aM"];
		                                    sk_anim_frame_colour = make_colour_rgb(
												is_real(sk_anim_frame_r) ? sk_anim_frame_r : 255,
												is_real(sk_anim_frame_g) ? sk_anim_frame_g : 255,
												is_real(sk_anim_frame_b) ? sk_anim_frame_b : 255
											);
		                                    sk_anim_frame_alpha = is_real(sk_anim_frame_a) ? sk_anim_frame_a : 1;
		                                }
		                                // append keyframe data in format [time, colour, alpha, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_anim_frame_colour,
											sk_anim_frame_alpha,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_colour_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
						#region // compile display timeline
						if(is_real(sk_db_anim_slot_display)&&ds_exists(sk_db_anim_slot_display,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_slot_display);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_attachment_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_slot_display[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
										// append keyframe data in format [time, displayIndex]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											string(real(sk_db_anim_frame_record[? "value"]))
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_attachment_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through ik data
			if(is_real(sk_db_anim_ik)&&ds_exists(sk_db_anim_ik,ds_type_list)){
	            var sk_db_anim_ik_count = ds_list_size(sk_db_anim_ik);
	            for(var sk_db_anim_ik_id = 0; sk_db_anim_ik_id < sk_db_anim_ik_count; sk_db_anim_ik_id++){
	                var sk_db_anim_ik_record = sk_db_anim_ik[| sk_db_anim_ik_id];
	                if(is_real(sk_db_anim_ik_record)&&ds_exists(sk_db_anim_ik_record,ds_type_map)){
						// add ik timeline data to animation
						var sk_anim_timeline_ikName = string(sk_db_anim_ik_record[? "name"]);
						var sk_anim_timeline_ikData = sk_constraints[| ds_list_find_index_sk_ik_constraint(sk_constraints,sk_anim_timeline_ikName)];
						var sk_db_anim_ik_frames = sk_db_anim_ik_record[? "frame"];
						#region // compile ik timeline
						if(is_real(sk_db_anim_ik_frames)&&ds_exists(sk_db_anim_ik_frames,ds_type_list)){
	                        var sk_db_anim_frame_count = ds_list_size(sk_db_anim_ik_frames);
							if(sk_db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_ik_timeline_create(sk_anim_timeline_ikData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_time = 0;
		                        for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
		                            var sk_db_anim_frame_record = sk_db_anim_ik_frames[| sk_db_anim_frame_id];
		                            if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){// add frame
		                                // add frame
		                                var sk_anim_frame_tween = SK_EASE_NONE;
										if(is_real(sk_db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = SK_EASE_LINEAR;
										} else {
											var sk_anim_frame_bezier = sk_db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_ease_function_from_bezier(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, bendDir, weight, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											(is_undefined(sk_db_anim_frame_record[? "bendPositive"])||sk_db_anim_frame_record[? "bendPositive"]) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE,
											sk_db_anim_frame_record[? "weight"],
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
		                            }
		                        }
								sk_ik_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
							}
	                    }
						#endregion
					}
				}
			}
			/*#region // compile event timelines
			var DB_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(sk_db_anim_record,"|DB_EVENT_TIMELINE_MAP|",DB_EVENT_TIMELINE_MAP); // store it in the dragonbones json temporarily so it can be destroyed easily
			if(is_real(sk_db_anim_events)&&ds_exists(sk_db_anim_events,ds_type_list)){
	            var sk_db_anim_event_count = ds_list_size(sk_db_anim_events);
				if(sk_db_anim_event_count>0){
					var sk_anim_frame_time = 0; // this is used for events which appear halfway through the timeline
		            for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_event_count; sk_db_anim_frame_id++){
		                var sk_db_anim_frame_record = sk_db_anim_events[| sk_db_anim_frame_id];
		                if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
							// add frame
							var sk_db_anim_frame_events = sk_db_anim_frame_record[? "events"];
							var sk_event_sound = asset_get_index(string(sk_db_anim_frame_record[? "sound"]));
							if(is_real(sk_db_anim_frame_events)&&ds_exists(sk_db_anim_frame_events,ds_type_list)){
								// iterate through events and set their timelines
								var sk_db_event_id;
								var sk_db_event_count = ds_list_size(sk_db_anim_frame_events);
								for(sk_db_event_id = 0; sk_db_event_id < sk_db_event_count; sk_db_event_id++){
									var sk_db_event = sk_db_anim_frame_events[| sk_db_event_id];
									if(is_real(sk_db_event)&&ds_exists(sk_db_event,ds_type_map)){
										// add event
										var sk_event_name = sk_db_event[? "name"];
										//show_message(sk_event_name+string(sk_db_anim_frame_id));
										var sk_event = sk_armature_find_event(sk_arm,sk_event_name);
										if(!sk_struct_isof(sk_event,sk_type_event)){
											// the event doesn't exist yet, so create it
											sk_event = sk_event_create(sk_event_name);
											sk_armature_add_event(sk_arm,sk_event);
										}
										var sk_event_timeline = DB_EVENT_TIMELINE_MAP[? sk_event_name];
										if(!sk_struct_isof(sk_event_timeline,sk_type_timeline)){
											// the event timeline doesn't exist yet, so create it
											sk_event_timeline = sk_timeline_create_event(sk_event_name+".timelineEvent",sk_event);
											sk_animation_add_timeline(sk_anim,sk_event_timeline);
											DB_EVENT_TIMELINE_MAP[? sk_event_name] = sk_event_timeline;
										}
										// get data types
										var sk_event_bone = sk_armature_find_bone(sk_arm,sk_db_event[? "bone"]);
										var sk_event_string = undefined;
										var sk_event_float = undefined;
										var sk_event_int = undefined;
										var sk_db_event_strings = sk_db_event[? "strings"];
										if(is_real(sk_db_event_strings)&&ds_exists(sk_db_event_strings,ds_type_list)){
											sk_event_string = string(sk_db_event_strings[| 0]);
										}
										var sk_db_event_floats = sk_db_event[? "floats"];
										if(is_real(sk_db_event_floats)&&ds_exists(sk_db_event_floats,ds_type_list)){
											sk_event_float = real(sk_db_event_floats[| 0]);
										}
										var sk_db_event_ints = sk_db_event[? "ints"];
										if(is_real(sk_db_event_ints)&&ds_exists(sk_db_event_ints,ds_type_list)){
											sk_event_int = int64(sk_db_event_ints[| 0]);
										}
										// append timeline data
										sk_timeline_frame_add_event(
											sk_event_timeline,
											sk_anim_frame_time,
											sk_event_bone,
											sk_event_string,
											sk_event_float,
											sk_event_int,
											sk_event_sound
										);
									}
								}
							}
							// set next duration
							sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
						}
					}
				}
			}
			#endregion*/
			/*#region // compile draw order timeline
			if(is_real(sk_db_anim_order)&&ds_exists(sk_db_anim_order,ds_type_map)){
				var sk_db_anim_order_frames = sk_db_anim_order[? "frame"];
				if(is_real(sk_db_anim_order_frames)&&ds_exists(sk_db_anim_order_frames,ds_type_list)){
		            var sk_db_anim_frame_count = ds_list_size(sk_db_anim_order_frames);
					if(sk_db_anim_frame_count>0){
						var sk_anim_frame_time = 0;
						var sk_order_timeline = sk_timeline_create_draworder("Armature.timelineDrawOrder",sk_arm);
						sk_animation_add_timeline(sk_anim,sk_order_timeline);
			            for(var sk_db_anim_frame_id = 0; sk_db_anim_frame_id < sk_db_anim_frame_count; sk_db_anim_frame_id++){
			                var sk_db_anim_frame_record = sk_db_anim_order_frames[| sk_db_anim_frame_id];
			                if(is_real(sk_db_anim_frame_record)&&ds_exists(sk_db_anim_frame_record,ds_type_map)){
								// add frame
								var sk_order_itemOffsetTuple = ds_list_create();
								// find original slot from slots array
								var sk_db_order_zOrder = sk_db_anim_frame_record[? "zOrder"];
								if(is_real(sk_db_order_zOrder)&&ds_exists(sk_db_order_zOrder,ds_type_list)){
									var sk_db_order_id;
									var sk_db_order_last = ds_list_size(sk_db_order_zOrder);
									for(sk_db_order_id = 0; sk_db_order_id < sk_db_order_last; sk_db_order_id+=2){
										var sk_order_z = real(sk_db_order_zOrder[| sk_db_order_id+0]);
										var sk_order_shift = real(sk_db_order_zOrder[| sk_db_order_id+1]);
										// use z value to locate the desired slot to shift
										var sk_order_slot = sk_slots[| sk_order_z];
										if(!sk_struct_isof(sk_order_slot,sk_type_slot)){
											// slot is invalid
											continue;
										}
										// add slot and offset to tuple
										ds_list_add(
											sk_order_itemOffsetTuple,
											sk_order_slot,
											sk_order_shift
										);
									}
								}
								// append timeline data
								sk_timeline_frame_add_draworder(
									sk_order_timeline,
									sk_anim_frame_time,
									sk_order_itemOffsetTuple
								);
								// set next duration
								sk_anim_frame_time += real(sk_db_anim_frame_record[? "duration"])*sk_db_fps;
							}
						}
					}
				}
			}
			#endregion*/
			sk_animation_set_timelines(sk_anim,sk_anim_timelines);
			ds_list_destroy(sk_anim_timelines);
			#endregion
		}
	}
}
// destroy dragonbones json
ds_map_destroy(sk_db_arm);
// create armature
var sk_arm = sk_armature_create();
sk_armature_set_bones(sk_arm,sk_bones);
sk_armature_set_constraints(sk_arm,sk_constraints);
sk_armature_set_slots(sk_arm,sk_slots);
sk_armature_set_animations(sk_arm,sk_animations);
sk_armature_set_skins(sk_arm,sk_skins);
sk_armature_set_attachments(sk_arm,sk_attachments);
sk_armature_set_events(sk_arm,sk_events);
sk_armature_update_cache(sk_arm);
sk_armature_set_default_skin(sk_arm,"");
sk_armature_set_skin(sk_arm);
sk_armature_pose_setup(sk_arm);
sk_armature_pose_update(sk_arm);
// destroy containers
ds_list_destroy(sk_bones);
ds_list_destroy(sk_constraints);
ds_list_destroy(sk_slots);
ds_list_destroy(sk_animations);
ds_list_destroy(sk_skins);
ds_list_destroy(sk_attachments);
ds_list_destroy(sk_events);
// return armature
return sk_arm;