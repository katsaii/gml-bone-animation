THIS FILE WAS AUTOMATICALLY GENERATED

#define array_hook_sk_structure
enum SK_STRUCT_H{
	parity, // whether the structure exists (should equate to true at all times)
	protector, // if this contains a structure, the child structure cannot be destroyed
	type, // the type of structure used as an identifier, cannot/must not be changed
	name, // the name given to the structure
	scr_setup, // used during polymorphism to initialise the structure
	scr_apply, // used during polymorphism to apply the structues state
	scr_destroy, // used during polymorphism to destroy the structure without knowing its type
	sizeof
}
/// @desc adds header data to the array
/// @param arr
/// @param type
/// @param name
/// @param [setup_script_id_or_name
/// @param apply_script_id_or_name
/// @param destroy_script_id_or_name]
var sk_struct = argument[0];
sk_struct[@ 1,SK_STRUCT_H.parity] = true;
sk_struct[@ 1,SK_STRUCT_H.protector] = noone;
sk_struct[@ 1,SK_STRUCT_H.type] = argument[1];
sk_struct_set_name(sk_struct,argument[2]);
if(argument_count==6){
	sk_struct_set_setup_script(sk_struct,argument[3]);
	sk_struct_set_apply_script(sk_struct,argument[4]);
	sk_struct_set_destroy_script(sk_struct,argument[5]);
}

#define array_unhook_sk_structure
/// @desc removes header data from the structure array
/// @param struct
if(sk_struct_protected(argument0)){
	// cannot destroy a protected structure
	return false;
}
argument0[@ 1,SK_STRUCT_H.parity] = false;
argument0[@ 1,SK_STRUCT_H.type] = undefined;
sk_struct_set_name(argument0,"");
sk_struct_set_setup_script(argument0,-1);
sk_struct_set_apply_script(argument0,-1);
sk_struct_set_destroy_script(argument0,-1);
return true;

#define ds_list_find_sk
/// @desc locates a structure
/// @param id
/// @param nameOrID
/// @param [type]
var sk_list = argument[0];
var sk_record_count = ds_list_size(sk_list);
var sk_record_id;
for(sk_record_id = 0; sk_record_id < sk_record_count; sk_record_id++){
	var sk_record = sk_list[| sk_record_id];
	if(
		sk_struct_exists(sk_record)&&
		(
			(argument_count<3)||
			(sk_struct_get_type(sk_record)==argument[2])
		)&&
		(
			(sk_record_id==argument[1])||
			(sk_struct_get_name(sk_record)==argument[1])
		)
	){
		return sk_record;
	}
}
return noone;

#define sk_animationState_add_animation
/// @desc adds an animation to the state
/// @param animationState
/// @param anim
/// @param [alias] used to identify the animation
var sk_struct = argument[0];
var sk_animations = sk_struct[SK_ANIMATIONSTATE.animations];
var sk_animation = argument[1];
if(sk_struct_isof(sk_animation,sk_type_animation)){
	var sk_alias = (argument_count==3) ? argument[2] : sk_struct_get_name(sk_animation);
	sk_animations[? sk_alias] = sk_animation;
}

#define sk_animationState_add_armature
/// @desc adds all animations from an armature to the state
/// @param animationState
/// @param armature
var sk_armature_animations = ds_list_create();
sk_armature_copy_animations(argument1,sk_armature_animations);
var sk_animation_count = ds_list_size(sk_armature_animations);
for(var sk_animation_id = 0; sk_animation_id < sk_animation_count; sk_animation_id++){
	sk_animationState_add_animation(argument0,sk_armature_animations[| sk_animation_id]);
}
ds_list_destroy(sk_armature_animations);

#define sk_animationState_apply
/// @desc applies the animations
/// @param animationState
/// @param alpha
var sk_animationQueue = argument0[SK_ANIMATIONSTATE.animationQueue];
var sk_time = argument0[SK_ANIMATIONSTATE.timerTime];
var sk_timeLast = argument0[SK_ANIMATIONSTATE.timerTimeLast];
var sk_queue_length = ds_list_size(sk_animationQueue);
for(var sk_queueItem_id = 0; sk_queueItem_id < sk_queue_length; sk_queueItem_id++){
	var sk_queueItem = sk_animationQueue[| sk_queueItem_id];
	var sk_queueItem_anim = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_anim];
	var sk_queueItem_looping = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_loop];
	var sk_queueItem_mix = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_mix]*argument1;
	var sk_queueItem_timeOffset = sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_timerOffset];
	if(sk_struct_isof(sk_queueItem_anim,sk_type_animation)){
		sk_animation_apply(
			sk_queueItem_anim,
			sk_timeLast-sk_queueItem_timeOffset,
			sk_time-sk_queueItem_timeOffset,
			sk_mixPose_add,
			sk_queueItem_mix,
			sk_queueItem_looping
		);
	}
}

#define sk_animationState_create
#macro sk_type_animationState sk_animationState_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ANIMATIONSTATE{
	animations,timescale,
	mixTable,mixSpeedDefault,
	timerTime,timerTimeLast, // a global timer which can be used to syncronise animations
	animationQueue,animationCurrent,animationMixSpeedCurrent, // the current rate to fade in the front animation and fade out the back animation
	sizeof,
		queueItem_anim = 0, // the reference of the animation
		queueItem_loop, // whether the animation loops
		queueItem_mix, // the alpha to apply the animation with
		queueItem_timerOffset, // the offset from the global timer (if 0 then the animation plays in sync with all others of the same duration)
		queueItem_ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ANIMATIONSTATE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_animationState,argument0,
	-1, // setup script
	-1, // apply script
	"sk_animationState_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ANIMATIONSTATE.animations] = ds_map_create(); // create structures for mixing animations
sk_struct[@ SK_ANIMATIONSTATE.mixTable] = ds_map_create();
sk_struct[@ SK_ANIMATIONSTATE.animationQueue] = ds_list_create();
sk_struct[@ SK_ANIMATIONSTATE.timerTime] = 0;
sk_struct[@ SK_ANIMATIONSTATE.timerTimeLast] = 0;
sk_animationState_play_animation(sk_struct,undefined,false);
// set default property values
sk_animationState_set_timescale(sk_struct,1);
sk_animationState_set_default_mix(sk_struct,1);
// return to caller
return sk_struct;

#define sk_animationState_current_animation
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
return argument0[SK_ANIMATIONSTATE.animationCurrent];

#define sk_animationState_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_map_destroy(argument0[SK_ANIMATIONSTATE.animations]);
	ds_map_destroy(argument0[SK_ANIMATIONSTATE.mixTable]);
	ds_list_destroy(argument0[SK_ANIMATIONSTATE.animationQueue]);
}

#define sk_animationState_draw_debug
/// @desc draws debug data
/// @param animationState
/// @param x
/// @param y
var i = 0;
draw_text( argument1,argument2+i*20,"count: "+string(ds_map_size(argument0[SK_ANIMATIONSTATE.animations])) );
i++;
draw_text( argument1,argument2+i*20,"timescale: "+string(argument0[SK_ANIMATIONSTATE.timescale]) );
i++;
draw_text( argument1,argument2+i*20,"mixSpeedDefault: "+string(argument0[SK_ANIMATIONSTATE.mixSpeedDefault]) );
i++;
draw_text( argument1,argument2+i*20,"queueLength: "+string(ds_list_size(argument0[SK_ANIMATIONSTATE.animationQueue])) );
i++;
draw_text( argument1,argument2+i*20,"animCurrent: "+string(argument0[SK_ANIMATIONSTATE.animationCurrent]) );
i++;
draw_text( argument1,argument2+i*20,"mixSpeedCurrent: "+string(argument0[SK_ANIMATIONSTATE.animationMixSpeedCurrent]) );
i++;
draw_text( argument1,argument2+i*20,"time: "+string(argument0[SK_ANIMATIONSTATE.timerTime]) );
i++;
draw_text( argument1,argument2+i*20,"timeLast: "+string(argument0[SK_ANIMATIONSTATE.timerTimeLast]) );

#define sk_animationState_find_animation
/// @desc adds an animation to the state
/// @param animationState
/// @param name
return ds_map_find_value(argument0[SK_ANIMATIONSTATE.animations],argument1);

#define sk_animationState_get_animation_mix
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
/// @param animfrom
/// @param animto
var sk_mix = ds_map_find_value(argument0[SK_ANIMATIONSTATE.mixTable],sk_createCompoundKey(argument1,argument2));
if(is_real(sk_mix)){
	return sk_mix;
}	return argument0[SK_ANIMATIONSTATE.mixSpeedDefault];

#define sk_animationState_get_default_mix
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
return argument0[SK_ANIMATIONSTATE.mixSpeedDefault];

#define sk_animationState_get_timescale
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
return argument0[SK_ANIMATIONSTATE.timescale];

#define sk_animationState_play_animation
/// @desc pushes an animation to the animation queue
/// @param animationState
/// @param animationName
/// @param loop
var sk_animationName_previous = argument0[SK_ANIMATIONSTATE.animationCurrent];
var sk_animationName = argument1;
if(sk_animationName_previous!=sk_animationName){
	var sk_animationQueue = argument0[SK_ANIMATIONSTATE.animationQueue];
	var sk_queueItem = array_create(SK_ANIMATIONSTATE.queueItem_ENTRIES);
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_anim] = ds_map_find_value(argument0[SK_ANIMATIONSTATE.animations],sk_animationName);
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_loop] = argument2;
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_mix] = ds_list_empty(sk_animationQueue); // mix starts at 0 and increments to 1
	sk_queueItem[@ SK_ANIMATIONSTATE.queueItem_timerOffset] = argument2 ? 0 : argument0[SK_ANIMATIONSTATE.timerTime]; // if not looping, then offset time so the animation begins at 0
	ds_list_add(sk_animationQueue,sk_queueItem);
	// update mixspeed
	argument0[@ SK_ANIMATIONSTATE.animationMixSpeedCurrent] = sk_animationState_get_animation_mix(argument0,sk_animationName_previous,sk_animationName);
	argument0[@ SK_ANIMATIONSTATE.animationCurrent] = sk_animationName;
}

#define sk_animationState_set_animation_mix
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
/// @param animfrom
/// @param animto
/// @param speed
ds_map_add(argument0[SK_ANIMATIONSTATE.mixTable],sk_createCompoundKey(argument1,argument2),real(argument3));

#define sk_animationState_set_default_mix
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
/// @param speed
argument0[@ SK_ANIMATIONSTATE.mixSpeedDefault] = real(argument1);

#define sk_animationState_set_timescale
gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
argument0[@ SK_ANIMATIONSTATE.timescale] = max(real(argument1),0);

#define sk_animationState_update
/// @desc updates the animation state
/// @param animationState
/// @param timestep
var sk_animationQueue = argument0[SK_ANIMATIONSTATE.animationQueue];
var sk_dt = argument1*argument0[SK_ANIMATIONSTATE.timescale];
argument0[@ SK_ANIMATIONSTATE.timerTimeLast] = argument0[SK_ANIMATIONSTATE.timerTime];
argument0[@ SK_ANIMATIONSTATE.timerTime] += sk_dt;
var sk_mix_difference = sk_dt*argument0[SK_ANIMATIONSTATE.animationMixSpeedCurrent];
var sk_queue_length = ds_list_size(sk_animationQueue);
if(sk_queue_length>1){
	// update top mix
	var sk_queueItem_top = sk_animationQueue[| sk_queue_length-1];
	sk_queueItem_top[@ SK_ANIMATIONSTATE.queueItem_mix] += sk_mix_difference;
	// update previous animations
	repeat(sk_queue_length-1){
		var sk_queueItem_bottom = sk_animationQueue[| 0];
		var sk_queueItem_mix = sk_queueItem_bottom[SK_ANIMATIONSTATE.queueItem_mix] - sk_mix_difference;
		sk_queueItem_bottom[@ SK_ANIMATIONSTATE.queueItem_mix] = sk_queueItem_mix;
		if(sk_queueItem_mix>0){
			// animation has not been fully faded out
			return;
		}
		// dequeue the animation, since it has been fully dequeued, and carry remaining mix to next animation until queue is empty
		ds_list_delete(sk_animationQueue,0);
		sk_mix_difference = abs(sk_mix_difference);
	}
	// clamp final animation to 1
	sk_queueItem_top[@ SK_ANIMATIONSTATE.queueItem_mix] = 1;
}

#define sk_animation_add_timeline
/// @desc appends a timeline to the animation's timeline list
/// @param animation
/// @param timeline
ds_list_add(argument0[SK_ANIMATION.timelines],argument1);

#define sk_animation_apply
/// @desc sets the pose for the specified time
/// @param animation
/// @param timeLast - this is required for events
/// @param time
/// @param mixPose
/// @param alpha
/// @param wrap
var sk_alpha = argument4;
if(sk_alpha<0.001){ // zero effect
	return;
}
var sk_anim = argument0;
var sk_anim_duration = sk_anim[SK_ANIMATION.duration];
var sk_anim_timelines = sk_anim[SK_ANIMATION.timelines];
var sk_anim_loopTime = sk_anim[SK_ANIMATION.looping] ? sk_anim_duration : -1;
var sk_timeLast = argument1;
var sk_time = argument2;
if(sk_anim_duration>0){
	var sk_wrap = argument5;
	if(sk_wrap){
		sk_timeLast = sk_timeLast mod sk_anim_duration;
		sk_time = sk_time mod sk_anim_duration;
	} else {
		sk_timeLast = sk_anim_duration;
		sk_time = sk_anim_duration;
	}
}
var sk_mixPose = argument3;
// iterate through timelines
var sk_timeline_count = ds_list_size(sk_anim_timelines);
var sk_timeline_id;
for(sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
	var sk_timelineData = sk_anim_timelines[| sk_timeline_id];
	sk_timeline_apply(sk_timelineData,sk_time,sk_timeLast,sk_mixPose,sk_alpha,sk_anim_loopTime);
}

#define sk_animation_create
#macro sk_type_animation sk_animation_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ANIMATION{
	duration,looping,
	timelines,
	sizeof
}
#macro sk_mixPose_mix 0 /* interpolates between the current pose and next pose */
#macro sk_mixPose_add 1 /* adds the next pose to the current pose */
#macro sk_mixPose_overwrite 2 /* permanently overwrites the setup pose with the supplied animation, this is useful for changing colours and transforms globally - THIS IS NOT A REVERTABLE ACTION */
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ANIMATION.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_animation,argument0,
	-1, // setup script
	-1, // apply script
	"sk_animation_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ANIMATION.timelines] = ds_list_create(); // create list for storing timeline data
// set default property values
sk_animation_set_duration(sk_struct,0);
sk_animation_set_looping(sk_struct,false);
// return to caller
return sk_struct;

#define sk_animation_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param event
if(array_unhook_sk_structure(argument0)){
	// iterate through timelines and dispose
	var sk_anim_timelines = argument0[SK_ANIMATION.timelines];
	var sk_timeline_count = ds_list_size(sk_anim_timelines);
	for(var sk_timeline_id = 0; sk_timeline_id < sk_timeline_count; sk_timeline_id++){
		var sk_timeline = sk_anim_timelines[| sk_timeline_id];
		if(sk_struct_exists(sk_timeline)){
			sk_struct_destroy(sk_timeline);
		}
	}
	// destroy dynamic data structures
	ds_list_destroy(sk_anim_timelines);
}

#define sk_animation_get_duration
gml_pragma("forceinline");
/// @desc gets a property
/// @param animation
return argument0[SK_ANIMATION.duration];

#define sk_animation_get_looping
gml_pragma("forceinline");
/// @desc gets a property
/// @param animation
return argument0[SK_ANIMATION.looping];

#define sk_animation_set_duration
gml_pragma("forceinline");
/// @desc sets a property
/// @param animation
/// @param duration
argument0[@ SK_ANIMATION.duration] = max(real(argument1),0);

#define sk_animation_set_looping
gml_pragma("forceinline");
/// @desc sets a property
/// @param animation
/// @param enabled
argument0[@ SK_ANIMATION.looping] = argument1;

#define sk_armature_add_animation
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.animations],argument1);
}

#define sk_armature_add_attachment
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.attachments],argument1);
}

#define sk_armature_add_bone
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.bones],argument1);
}

#define sk_armature_add_constraint
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.constraints],argument1);
}

#define sk_armature_add_event
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.events],argument1);
}

#define sk_armature_add_skin
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.skins],argument1);
}

#define sk_armature_add_slot
/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.slots],argument1);
}

#define sk_armature_build_dragonbones
/// @desc loads an armature file
/// @param json
/// @param armature_name_or_id
var db_armature = noone;
// extract armature data from dragonbones json
var db_skel = json_decode(argument0);
if(ds_exists(db_skel,ds_type_map)){
	var db_armature_found = false;
	var db_armatures = db_skel[? "armature"];
	if(is_real(db_armatures)&&ds_exists(db_armatures,ds_type_list)){
		var db_armature_count = ds_list_size(db_armatures);
        for(var db_armature_id = 0; db_armature_id < db_armature_count; db_armature_id++){
            var db_armature_data = db_armatures[| db_armature_id];
            if(is_real(db_armature_data)&&ds_exists(db_armature_data,ds_type_map)
			&&(db_armature_data[? "type"]=="Armature")&&( (db_armature_data[? "name"]==argument1)||(db_armature_id==argument1) )){
    			// armature found
				db_armature = db_armature_data;
    			db_armature_found = true;
				break;
    		}
        }
	}
	if(!db_armature_found){
		ds_map_destroy(db_skel);
		return noone;
	}
} else {
	return noone;
}
// extract important data
var db_bones = db_armature[? "bone"];
var db_slots = db_armature[? "slot"];
var db_skins = db_armature[? "skin"];
var db_IK = db_armature[? "ik"];
var db_animations = db_armature[? "animation"];
var db_fps = 1; //30/max(real(db_armature[? "frameRate"]),1); // 30 fps baseline /* THIS WAS AN EXPERIMENTAL FEATURE FOR MAPPING THE FRAMERATE OF ANIMATIONS TO GAMESPEED*/
// create armature
var sk_skel = sk_armature_create(string(db_armature[? "name"]));
// transfer bone data
if(is_real(db_bones)&&ds_exists(db_bones,ds_type_list)){
	var db_bone_count = ds_list_size(db_bones);
	for(var db_bone_id = 0; db_bone_id < db_bone_count; db_bone_id++){
	    var db_bone_record = db_bones[| db_bone_id];
	    if(is_real(db_bone_record)&&ds_exists(db_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(db_bone_record[? "name"]);
	        var sk_bone_len = real(db_bone_record[? "length"]);
	        var sk_bone_par = sk_armature_find_bone(sk_skel,db_bone_record[? "parent"]);
			var sk_bone_xpos = 0;
	        var sk_bone_ypos = 0;
	        var sk_bone_xsc = 1;
	        var sk_bone_ysc = 1;
	        var sk_bone_xsh = 0;
			var sk_bone_ysh = 0;
	        var sk_bone_inherit_rotation = !is_real(db_bone_record[? "inheritRotation"])||db_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(db_bone_record[? "inheritScale"])||db_bone_record[? "inheritScale"];
			var sk_bone_inheritance = (sk_transformMode_rotate*sk_bone_inherit_rotation)
									|	(sk_transformMode_scale*sk_bone_inherit_scale)
									|	sk_transformMode_translate
									|	sk_transformMode_skew;
	        // obtain transformation data
	        var db_bone_transformations = db_bone_record[? "transform"];
	        if(is_real(db_bone_transformations)&&ds_exists(db_bone_transformations,ds_type_map)){
				sk_bone_xpos = real(db_bone_transformations[? "x"]);
				sk_bone_ypos = real(db_bone_transformations[? "y"]);
				sk_bone_xsc = is_real(db_bone_transformations[? "scX"]) ? db_bone_transformations[? "scX"] : 1;
				sk_bone_ysc = is_real(db_bone_transformations[? "scY"]) ? db_bone_transformations[? "scY"] : 1;
				sk_bone_xsh = -real(db_bone_transformations[? "skX"]);
				sk_bone_ysh = -real(db_bone_transformations[? "skY"]);
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name,sk_bone_par);
			sk_bone_set_transformMode(sk_bone,sk_bone_inheritance);
			sk_bone_set_length(sk_bone,sk_bone_len);
			sk_bone_set_position(sk_bone,sk_bone_xpos,sk_bone_ypos);
			sk_bone_set_scale(sk_bone,sk_bone_xsc,sk_bone_ysc);
			sk_bone_set_shear(sk_bone,sk_bone_xsh,sk_bone_ysh);
			sk_bone_set_rotation(sk_bone,0);
			sk_armature_add_bone(sk_skel,sk_bone);
			#endregion
	    }
	}
}
// transfer slot data
if(is_real(db_slots)&&ds_exists(db_slots,ds_type_list)){
	var db_slot_count = ds_list_size(db_slots);
	for(var db_slot_id = 0; db_slot_id < db_slot_count; db_slot_id++){
	    var db_slot_record = db_slots[| db_slot_id];
	    if(is_real(db_slot_record)&&ds_exists(db_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(db_slot_record[? "name"]);
   			var sk_slot_par = sk_armature_find_bone(sk_skel,db_slot_record[? "parent"]);
			var sk_slot_displayIndex = string(real(db_slot_record[? "displayIndex"]));
			var sk_slot_col = $ffffff;
	        var sk_slot_a = 1;
	        // obtain colour data
	        var db_slot_colourData = db_slot_record[? "color"];
	        if(is_real(db_slot_colourData)&&ds_exists(db_slot_colourData,ds_type_map)){
	            var sk_rgba_r = db_slot_colourData[? "rM"];
	            var sk_rgba_g = db_slot_colourData[? "gM"];
	            var sk_rgba_b = db_slot_colourData[? "bM"];
	            var sk_rgba_a = db_slot_colourData[? "aM"];
	            sk_slot_col = make_colour_rgb(
					is_real(sk_rgba_r) ? sk_rgba_r : 255,
					is_real(sk_rgba_g) ? sk_rgba_g : 255,
					is_real(sk_rgba_b) ? sk_rgba_b : 255
				);
	            sk_slot_a = is_real(sk_rgba_a) ? sk_rgba_a : 1;
	        }
			// create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name,sk_slot_par);
			sk_slot_set_defaultDisplay(sk_slot,sk_slot_displayIndex);
			sk_slot_set_colour(sk_slot,sk_slot_col,sk_slot_a);
			sk_armature_add_slot(sk_skel,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(db_skins)&&ds_exists(db_skins,ds_type_list)){
	var db_skin_count = ds_list_size(db_skins);
	for(var db_skin_id = 0; db_skin_id < db_skin_count; db_skin_id++){
	    var db_skin_record = db_skins[| db_skin_id];
	    if(is_real(db_skin_record)&&ds_exists(db_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin;
			if(is_string(db_skin_record[? "name"])&&(db_skin_record[? "name"]!="")){
				sk_skin = sk_skin_create(db_skin_record[? "name"]);
				sk_armature_add_skin(sk_skel,sk_skin);
			} else {
				sk_skin = sk_armature_default_skin(sk_skel);
			}
			// compile slot attachment data
			var db_skin_slots = db_skin_record[? "slot"];
			if(is_real(db_skin_slots)&&ds_exists(db_skin_slots,ds_type_list)){
				// iterate through skin slots and add their display data
				var db_skin_slot_count = ds_list_size(db_skin_slots);
				for(var db_skin_slot_id = 0; db_skin_slot_id < db_skin_slot_count; db_skin_slot_id++){
				    var db_skin_slot_record = db_skin_slots[| db_skin_slot_id];
				    if(is_real(db_skin_slot_record)&&ds_exists(db_skin_slot_record,ds_type_map)){
						var sk_skin_slotData = sk_armature_find_slot(sk_skel,db_skin_slot_record[? "name"],sk_type_slot);
						var db_skin_slot_displays = db_skin_slot_record[? "display"];
						if(sk_struct_isof(sk_skin_slotData,sk_type_slot)&&is_real(db_skin_slot_displays)&&ds_exists(db_skin_slot_displays,ds_type_list)){
							// iterate through slot displays and create attachments
							var db_skin_slot_display_count = ds_list_size(db_skin_slot_displays);
							for(var db_skin_slot_display_id = 0; db_skin_slot_display_id < db_skin_slot_display_count; db_skin_slot_display_id++){
							    var db_skin_slot_display_record = db_skin_slot_displays[| db_skin_slot_display_id];
							    if(is_real(db_skin_slot_display_record)&&ds_exists(db_skin_slot_display_record,ds_type_map)){
									#region // add attachment to skin
									// attachment name is a combination of its parent slot and the path of the texture
									var sk_attachment_name = string(sk_struct_get_name(sk_skin_slotData))+"."+string(db_skin_slot_display_record[? "name"]);
									switch(db_skin_slot_display_record[? "type"]){
										case "mesh": case "point": break; // not supported
										case "image": default:
											// create plane attachment
											var sk_attachment_textureName = db_skin_slot_display_record[? "name"];
											var sk_attachment_x = 0;
											var sk_attachment_y = 0;
											var sk_attachment_xscale = 1;
											var sk_attachment_yscale = 1;
											var sk_attachment_xshear = 0;
											var sk_attachment_yshear = 0;
											// compile transformation data
											var db_attachment_transformations = db_skin_slot_display_record[? "transform"];
											if(is_real(db_attachment_transformations)&&ds_exists(db_attachment_transformations,ds_type_map)){
						                        sk_attachment_x = real(db_attachment_transformations[? "x"]);
						                        sk_attachment_y = real(db_attachment_transformations[? "y"]);
						                        sk_attachment_xscale = is_real(db_attachment_transformations[? "scX"]) ? db_attachment_transformations[? "scX"] : 1;
						                        sk_attachment_yscale = is_real(db_attachment_transformations[? "scY"]) ? db_attachment_transformations[? "scY"] : 1;
						                        sk_attachment_xshear = -real(db_attachment_transformations[? "skX"]);
												sk_attachment_yshear = -real(db_attachment_transformations[? "skY"]);
						                    }
											// create a new attachment and add it to the skin
											var sk_attachment = sk_attachment_create_plane(sk_attachment_name,sk_attachment_textureName);
											sk_attachment_plane_set_matrix(
												sk_attachment,
												sk_attachment_x,sk_attachment_y,
												sk_attachment_xscale,sk_attachment_yscale,
												sk_attachment_xshear,sk_attachment_yshear,0
											);
											sk_armature_add_attachment(sk_skel,sk_attachment);
											sk_skin_record_add(
												sk_skin,
												sk_skin_slotData,
												sk_attachment,
												string(db_skin_slot_display_id)
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
if(is_real(db_IK)&&ds_exists(db_IK,ds_type_list)){
	var db_IK_count = ds_list_size(db_IK);
	for(var db_IK_id = 0; db_IK_id < db_IK_count; db_IK_id++){
	    var db_IK_record = db_IK[| db_IK_id];
	    if(is_real(db_IK_record)&&ds_exists(db_IK_record,ds_type_map)){
			#region // add IK constraint
			var sk_IK_name = string(db_IK_record[? "name"]);
			var sk_IK_chain = db_IK_record[? "chain"]||false;
	        var sk_IK_boneTarget = sk_armature_find_bone(sk_skel,db_IK_record[? "target"]);
			var sk_IK_boneJoint = sk_armature_find_bone(sk_skel,db_IK_record[? "bone"]);
			var sk_IK_positive = (is_undefined(db_IK_record[? "bendPositive"])||db_IK_record[? "bendPositive"]) ? sk_bendDir_positive : sk_bendDir_negative;
			var sk_IK_weight = is_real(db_IK_record[? "weight"]) ? db_IK_record[? "weight"] : 1;
			if(sk_struct_isof(sk_IK_boneTarget,sk_type_bone)&&sk_struct_isof(sk_IK_boneJoint,sk_type_bone)){
				// create new record and set data
				var sk_constraint = sk_constraint_create_ik(sk_IK_name,sk_IK_boneJoint,sk_IK_boneTarget);
				sk_constraint_ik_set_mix(sk_constraint,sk_IK_positive,sk_IK_weight);
				sk_constraint_ik_set_chain(sk_constraint,sk_IK_chain);
				sk_armature_add_constraint(sk_skel,sk_constraint);
			}
			#endregion
	    }
	}
}
// apply setup
sk_armature_updateCache(sk_skel);
sk_armature_setToDefaultSkin(sk_skel);
sk_armature_setToSetupPose(sk_skel);
sk_armature_updateWorldTransform(sk_skel);
// get slot list
var sk_slots = ds_list_create();
ds_map_add_list(db_armature,"|sk_slots|",sk_slots);
sk_armature_copy_slots(sk_skel,sk_slots);
// transfer animation data
if(is_real(db_animations)&&ds_exists(db_animations,ds_type_list)){
	var db_anim_count = ds_list_size(db_animations);
	for(var db_anim_id = 0; db_anim_id < db_anim_count; db_anim_id++){
	    var db_anim_record = db_animations[| db_anim_id];
	    if(is_real(db_anim_record)&&ds_exists(db_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(db_anim_record[? "name"]));
			sk_animation_set_duration(sk_anim,real(db_anim_record[? "duration"])*db_fps);
			sk_armature_add_animation(sk_skel,sk_anim);
			// compile timeline data
			var db_anim_bones = db_anim_record[? "bone"];
			var db_anim_slots = db_anim_record[? "slot"];
			var db_anim_ik = db_anim_record[? "ik"];
			var db_anim_events = db_anim_record[? "frame"];
			var db_anim_order = db_anim_record[? "zOrder"];
			// iterate through bone data
			if(is_real(db_anim_bones)&&ds_exists(db_anim_bones,ds_type_list)){
	            var db_anim_bone_count = ds_list_size(db_anim_bones);
	            for(var db_anim_bone_id = 0; db_anim_bone_id < db_anim_bone_count; db_anim_bone_id++){
	                var db_anim_bone_record = db_anim_bones[| db_anim_bone_id];
	                if(is_real(db_anim_bone_record)&&ds_exists(db_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(db_anim_bone_record[? "name"]);
						var sk_anim_timeline_boneData = sk_armature_find_bone(sk_skel,sk_anim_timeline_boneName);
						var db_anim_bone_translate = db_anim_bone_record[? "translateFrame"];
						var db_anim_bone_scale = db_anim_bone_record[? "scaleFrame"];
						var db_anim_bone_rotate = db_anim_bone_record[? "rotateFrame"];
						#region // compile translate timeline
						if(is_real(db_anim_bone_translate)&&ds_exists(db_anim_bone_translate,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_bone_translate);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_translate(sk_anim_timeline_boneName+".TimelineTranslate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_bone_translate[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_frame_add_translate(
											sk_timelineData,
											sk_anim_frame_time,
											real(db_anim_frame_record[? "x"]),
											real(db_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(db_anim_bone_scale)&&ds_exists(db_anim_bone_scale,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_bone_scale);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_scale(sk_anim_timeline_boneName+".TimelineScale",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_bone_scale[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_frame_add_scale(
											sk_timelineData,
											sk_anim_frame_time,
											is_real(db_anim_frame_record[? "x"]) ? db_anim_frame_record[? "x"] : 1,
											is_real(db_anim_frame_record[? "y"]) ? db_anim_frame_record[? "y"] : 1,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
						#region // compile rotate timeline
						if(is_real(db_anim_bone_rotate)&&ds_exists(db_anim_bone_rotate,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_bone_rotate);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_rotate(sk_anim_timeline_boneName+".TimelineRotate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_bone_rotate[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, drotation, clockwiseMultiplier, tween]
										sk_timeline_frame_add_rotate(
											sk_timelineData,
											sk_anim_frame_time,
											-real(db_anim_frame_record[? "rotate"]),
											-real(db_anim_frame_record[? "clockwise"]), // this value is multiplied to the next frame to get the amount of extra periods of rotation
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through slot data
			if(is_real(db_anim_slots)&&ds_exists(db_anim_slots,ds_type_list)){
	            var db_anim_slot_count = ds_list_size(db_anim_slots);
	            for(var db_anim_slot_id = 0; db_anim_slot_id < db_anim_slot_count; db_anim_slot_id++){
	                var db_anim_slot_record = db_anim_slots[| db_anim_slot_id];
	                if(is_real(db_anim_slot_record)&&ds_exists(db_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(db_anim_slot_record[? "name"]);
						var sk_anim_timeline_slotData = sk_armature_find_slot(sk_skel,sk_anim_timeline_slotName,sk_type_slot);
						var db_anim_slot_colour = db_anim_slot_record[? "colorFrame"];
						var db_anim_slot_display = db_anim_slot_record[? "displayFrame"];
						#region // compile colour timeline
						if(is_real(db_anim_slot_colour)&&ds_exists(db_anim_slot_colour,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_slot_colour);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_colour(sk_anim_timeline_slotName+".timelineColour",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_slot_colour[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
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
										var db_anim_frame_colourData = db_anim_frame_record[? "color"];
		                                if(is_real(db_anim_frame_colourData)&&ds_exists(db_anim_frame_colourData,ds_type_map)){
		                                    var sk_anim_frame_r = db_anim_frame_colourData[? "rM"];
		                                    var sk_anim_frame_g = db_anim_frame_colourData[? "gM"];
		                                    var sk_anim_frame_b = db_anim_frame_colourData[? "bM"];
		                                    var sk_anim_frame_a = db_anim_frame_colourData[? "aM"];
		                                    sk_anim_frame_colour = make_colour_rgb(
												is_real(sk_anim_frame_r) ? sk_anim_frame_r : 255,
												is_real(sk_anim_frame_g) ? sk_anim_frame_g : 255,
												is_real(sk_anim_frame_b) ? sk_anim_frame_b : 255
											);
		                                    sk_anim_frame_alpha = is_real(sk_anim_frame_a) ? sk_anim_frame_a : 1;
		                                }
		                                // append keyframe data in format [time, colour, alpha, tween]
										sk_timeline_frame_add_colour(
											sk_timelineData,
											sk_anim_frame_time,
											sk_anim_frame_colour,
											sk_anim_frame_alpha,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
						#region // compile display timeline
						if(is_real(db_anim_slot_display)&&ds_exists(db_anim_slot_display,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_slot_display);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_display(sk_anim_timeline_slotName+".timelineDisplay",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_slot_display[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){// add frame
		                                // append keyframe data in format [time, displayIndex]
										sk_timeline_frame_add_display(
											sk_timelineData,
											sk_anim_frame_time,
											string(real(db_anim_frame_record[? "value"]))
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through ik data
			if(is_real(db_anim_ik)&&ds_exists(db_anim_ik,ds_type_list)){
	            var db_anim_ik_count = ds_list_size(db_anim_ik);
	            for(var db_anim_ik_id = 0; db_anim_ik_id < db_anim_ik_count; db_anim_ik_id++){
	                var db_anim_ik_record = db_anim_ik[| db_anim_ik_id];
	                if(is_real(db_anim_ik_record)&&ds_exists(db_anim_ik_record,ds_type_map)){
						// add ik timeline data to animation
						var sk_anim_timeline_ikName = string(db_anim_ik_record[? "name"]);
						var sk_anim_timeline_ikData = sk_armature_find_constraint(sk_skel,sk_anim_timeline_ikName,sk_type_constraint_ik);
						var db_anim_ik_frames = db_anim_ik_record[? "frame"];
						#region // compile ik timeline
						if(is_real(db_anim_ik_frames)&&ds_exists(db_anim_ik_frames,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_ik_frames);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_ik(sk_anim_timeline_ikName+".timelineIK",sk_anim_timeline_ikData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_ik_frames[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){// add frame
		                                // add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, bendDir, weight, tween]
										sk_timeline_frame_add_ik(
											sk_timelineData,
											sk_anim_frame_time,
											(is_undefined(db_anim_frame_record[? "bendPositive"])||db_anim_frame_record[? "bendPositive"]) ? sk_bendDir_positive : sk_bendDir_negative,
											is_real(db_anim_frame_record[? "weight"]) ? db_anim_frame_record[? "weight"] : 1,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
					}
				}
			}
			#region // compile event timelines
			var DB_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(db_anim_record,"|DB_EVENT_TIMELINE_MAP|",DB_EVENT_TIMELINE_MAP); // store it in the dragonbones json temporarily so it can be destroyed easily
			if(is_real(db_anim_events)&&ds_exists(db_anim_events,ds_type_list)){
	            var db_anim_event_count = ds_list_size(db_anim_events);
				if(db_anim_event_count>0){
					var sk_anim_frame_time = 0; // this is used for events which appear halfway through the timeline
		            for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_event_count; db_anim_frame_id++){
		                var db_anim_frame_record = db_anim_events[| db_anim_frame_id];
		                if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
							// add frame
							var db_anim_frame_events = db_anim_frame_record[? "events"];
							var sk_event_sound = asset_get_index(string(db_anim_frame_record[? "sound"]));
							if(is_real(db_anim_frame_events)&&ds_exists(db_anim_frame_events,ds_type_list)){
								// iterate through events and set their timelines
								var db_event_id;
								var db_event_count = ds_list_size(db_anim_frame_events);
								for(db_event_id = 0; db_event_id < db_event_count; db_event_id++){
									var db_event = db_anim_frame_events[| db_event_id];
									if(is_real(db_event)&&ds_exists(db_event,ds_type_map)){
										// add event
										var sk_event_name = db_event[? "name"];
										//show_message(sk_event_name+string(db_anim_frame_id));
										var sk_event = sk_armature_find_event(sk_skel,sk_event_name);
										if(!sk_struct_isof(sk_event,sk_type_event)){
											// the event doesn't exist yet, so create it
											sk_event = sk_event_create(sk_event_name);
											sk_armature_add_event(sk_skel,sk_event);
										}
										var sk_event_timeline = DB_EVENT_TIMELINE_MAP[? sk_event_name];
										if(!sk_struct_isof(sk_event_timeline,sk_type_timeline)){
											// the event timeline doesn't exist yet, so create it
											sk_event_timeline = sk_timeline_create_event(sk_event_name+".timelineEvent",sk_event);
											sk_animation_add_timeline(sk_anim,sk_event_timeline);
											DB_EVENT_TIMELINE_MAP[? sk_event_name] = sk_event_timeline;
										}
										// get data types
										var sk_event_bone = sk_armature_find_bone(sk_skel,db_event[? "bone"]);
										var sk_event_string = undefined;
										var sk_event_float = undefined;
										var sk_event_int = undefined;
										var db_event_strings = db_event[? "strings"];
										if(is_real(db_event_strings)&&ds_exists(db_event_strings,ds_type_list)){
											sk_event_string = string(db_event_strings[| 0]);
										}
										var db_event_floats = db_event[? "floats"];
										if(is_real(db_event_floats)&&ds_exists(db_event_floats,ds_type_list)){
											sk_event_float = real(db_event_floats[| 0]);
										}
										var db_event_ints = db_event[? "ints"];
										if(is_real(db_event_ints)&&ds_exists(db_event_ints,ds_type_list)){
											sk_event_int = int64(db_event_ints[| 0]);
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
							sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
						}
					}
				}
			}
			#endregion
			#region // compile draw order timeline
			if(is_real(db_anim_order)&&ds_exists(db_anim_order,ds_type_map)){
				var db_anim_order_frames = db_anim_order[? "frame"];
				if(is_real(db_anim_order_frames)&&ds_exists(db_anim_order_frames,ds_type_list)){
		            var db_anim_frame_count = ds_list_size(db_anim_order_frames);
					if(db_anim_frame_count>0){
						var sk_anim_frame_time = 0;
						var sk_order_timeline = sk_timeline_create_draworder("Armature.timelineDrawOrder",sk_skel);
						sk_animation_add_timeline(sk_anim,sk_order_timeline);
			            for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
			                var db_anim_frame_record = db_anim_order_frames[| db_anim_frame_id];
			                if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
								// add frame
								var sk_order_itemOffsetTuple = ds_list_create();
								// find original slot from slots array
								var db_order_zOrder = db_anim_frame_record[? "zOrder"];
								if(is_real(db_order_zOrder)&&ds_exists(db_order_zOrder,ds_type_list)){
									var db_order_id;
									var db_order_last = ds_list_size(db_order_zOrder);
									for(db_order_id = 0; db_order_id < db_order_last; db_order_id+=2){
										var sk_order_z = real(db_order_zOrder[| db_order_id+0]);
										var sk_order_shift = real(db_order_zOrder[| db_order_id+1]);
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
								sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
							}
						}
					}
				}
			}
			#endregion
			#endregion
		}
	}
}
// return final structure
ds_map_destroy(db_skel);
return sk_skel;

#define sk_armature_build_spine
/// @desc loads an armature file
/// @param json
/// @param name
var sp_armature = noone;
// extract armature data from spriter json
var sp_skel = json_decode(argument0);
if(ds_exists(sp_skel,ds_type_map)){
	/*
		SPINE ONLY HAS A SINGLE ARMATURE; the supplied armature name is only used to name the armature, and could be anything!
	*/
	sp_armature = sp_skel;
} else {
	return noone;
}
// extract important data
var sp_meta = sp_armature[? "skeleton"];
var sp_bones = sp_armature[? "bones"];
var sp_slots = sp_armature[? "slots"];
var sp_skins = sp_armature[? "skins"];
var sp_constraints_IK = sp_armature[? "ik"];
var sp_constraints_transform = sp_armature[? "transform"];
var sp_constraints_path = sp_armature[? "path"]; // not used
var sp_animations = sp_armature[? "animations"];
var sp_events = sp_armature[? "events"];
// create armature
var sk_skel = sk_armature_create(string(argument1));
// transfer bone data
if(is_real(sp_bones)&&ds_exists(sp_bones,ds_type_list)){
	var sp_bone_count = ds_list_size(sp_bones);
	for(var sp_bone_id = 0; sp_bone_id < sp_bone_count; sp_bone_id++){
	    var sp_bone_record = sp_bones[| sp_bone_id];
	    if(is_real(sp_bone_record)&&ds_exists(sp_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(sp_bone_record[? "name"]);
	        var sk_bone_len = real(sp_bone_record[? "length"]);
	        var sk_bone_par = sk_armature_find_bone(sk_skel,sp_bone_record[? "parent"]);
			var sk_bone_xpos = real(sp_bone_record[? "x"]);
	        var sk_bone_ypos = -real(sp_bone_record[? "y"]);
	        var sk_bone_xsc = is_real(sp_bone_record[? "scaleX"]) ? sp_bone_record[? "scaleX"] : 1;
	        var sk_bone_ysc = is_real(sp_bone_record[? "scaleY"]) ? sp_bone_record[? "scaleY"] : 1;
	        var sk_bone_xsh = real(sp_bone_record[? "shearX"]);
			var sk_bone_ysh = real(sp_bone_record[? "shearY"]);
			var sk_bone_rot = real(sp_bone_record[? "rotation"]);
	        var sk_bone_inherit_rotation = !is_real(sp_bone_record[? "inheritRotation"])||sp_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(sp_bone_record[? "inheritScale"])||sp_bone_record[? "inheritScale"];
			var sk_bone_inheritance = sk_transformMode_normal;
			switch(sp_bone_record[? "transform"]){
				case "onlyTranslation": sk_bone_inheritance = sk_transformMode_noScaleOrRotation; break;
				case "noRotationOrReflection": sk_bone_inheritance = sk_transformMode_noRotation; break;
				case "noScale": case "noScaleOrReflection": sk_bone_inheritance = sk_transformMode_noScale; break;
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name,sk_bone_par);
			sk_bone_set_transformMode(sk_bone,sk_bone_inheritance);
			sk_bone_set_length(sk_bone,sk_bone_len);
			sk_bone_set_position(sk_bone,sk_bone_xpos,sk_bone_ypos);
			sk_bone_set_scale(sk_bone,sk_bone_xsc,sk_bone_ysc);
			sk_bone_set_shear(sk_bone,sk_bone_xsh,sk_bone_ysh);
			sk_bone_set_rotation(sk_bone,sk_bone_rot);
			sk_armature_add_bone(sk_skel,sk_bone);
			#endregion
		}
	}
}
// transfer slot data
if(is_real(sp_slots)&&ds_exists(sp_slots,ds_type_list)){
	var sp_slot_count = ds_list_size(sp_slots);
	for(var sp_slot_id = 0; sp_slot_id < sp_slot_count; sp_slot_id++){
	    var sp_slot_record = sp_slots[| sp_slot_id];
	    if(is_real(sp_slot_record)&&ds_exists(sp_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(sp_slot_record[? "name"]);
   			var sk_slot_par = sk_armature_find_bone(sk_skel,sp_slot_record[? "bone"]);
			var sk_slot_attachmentName = string(sp_slot_record[? "attachment"]);
			var sk_slot_rgba = is_string(sp_slot_record[? "color"]) ? sp_slot_record[? "color"] : "FFFFFFFF";
	        // create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name,sk_slot_par);
			sk_slot_set_defaultDisplay(sk_slot,sk_slot_attachmentName);
			sk_slot_set_colour(sk_slot,sk_hex_get_colour(sk_slot_rgba,false),sk_hex_get_alpha(sk_slot_rgba,false));
			sk_armature_add_slot(sk_skel,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(sp_skins)&&ds_exists(sp_skins,ds_type_map)){
	var sp_skin_count = ds_map_size(sp_skins);
	var sp_skin_name = ds_map_find_first(sp_skins);
	repeat(sp_skin_count){
		var sp_skin_record = sp_skins[? sp_skin_name];
		if(is_real(sp_skin_record)&&ds_exists(sp_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin;
			if(sp_skin_name=="default"){
				sk_skin = sk_armature_default_skin(sk_skel);
			} else {
				sk_skin = sk_skin_create(sp_skin_name);
				sk_armature_add_skin(sk_skel,sk_skin);
			}
			// compile slot attachment data
			var sp_skin_slots = sp_skin_record;
			// iterate through skin slots and add their display data
			var sp_skin_slot_count = ds_map_size(sp_skin_slots);
			var sp_skin_slot_name = ds_map_find_first(sp_skin_slots);
			repeat(sp_skin_slot_count){
				var sp_skin_slot_record = sp_skin_slots[? sp_skin_slot_name];
				if(is_real(sp_skin_slot_record)&&ds_exists(sp_skin_slot_record,ds_type_map)){
					var sk_skin_slotData = sk_armature_find_slot(sk_skel,sp_skin_slot_name,sk_type_slot);
					var sp_skin_slot_attachments = sp_skin_slot_record;
					if(sk_struct_isof(sk_skin_slotData,sk_type_slot)){
						// iterate through slot attachments and add create attachments
						var sp_skin_slot_attachment_count = ds_map_size(sp_skin_slot_attachments);
						var sp_skin_slot_attachment_key = ds_map_find_first(sp_skin_slot_attachments);
						repeat(sp_skin_slot_attachment_count){
							var sp_skin_slot_attachment_record = sp_skin_slot_attachments[? sp_skin_slot_attachment_key];
							if(is_real(sp_skin_slot_attachment_record)&&ds_exists(sp_skin_slot_attachment_record,ds_type_map)){
								#region // add attachment to skin
								// attachment name is a combination of its parent slot's name and its attachment key
								var sk_attachment_name = sk_createCompoundKey(sp_skin_slot_name,sp_skin_slot_attachment_key);
								var sk_attachment = noone;
								switch(sp_skin_slot_attachment_record[? "type"]){
									case "mesh": case "linkedmesh": case "boundingbox": case "path": case "clipping": break; // not supported
									case "point":
										// create point attachment
										var sk_attachment_x = real(sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_rotation = real(sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_attachment_create_point(sk_attachment_name);
										sk_attachment_point_set_offsets(sk_attachment,sk_attachment_x,sk_attachment_y,sk_attachment_rotation);
										sk_armature_add_attachment(sk_skel,sk_attachment);
									break;
									case "region": default:
										// create plane (region) attachment
										var sk_attachment_textureName = is_string(sp_skin_slot_attachment_record[? "name"]) ? sp_skin_slot_attachment_record[? "name"] : string(sp_skin_slot_attachment_key);
										var sk_attachment_x = real(sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_xscale = is_real(sp_skin_slot_attachment_record[? "scaleX"]) ? sp_skin_slot_attachment_record[? "scaleX"] : 1;
										var sk_attachment_yscale = is_real(sp_skin_slot_attachment_record[? "scaleY"]) ? sp_skin_slot_attachment_record[? "scaleY"] : 1;
										var sk_attachment_rotation = real(sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_attachment_create_plane(sk_attachment_name,sk_attachment_textureName);
										sk_attachment_plane_set_matrix(
											sk_attachment,
											sk_attachment_x,sk_attachment_y,
											sk_attachment_xscale,sk_attachment_yscale,
											0,0,sk_attachment_rotation
										);
										sk_armature_add_attachment(sk_skel,sk_attachment);
									break;
								}
								// add attachment to the skin (even if it doesn't exist, because those will be null attachments)
								sk_skin_record_add(
									sk_skin,
									sk_skin_slotData,
									sk_attachment,
									sp_skin_slot_attachment_key
								);
								#endregion
							}
							// goto next attachment
							sp_skin_slot_attachment_key = ds_map_find_next(sp_skin_slot_attachments,sp_skin_slot_attachment_key);
						}
					}
				}
				// goto next slot
				sp_skin_slot_name = ds_map_find_next(sp_skin_slots,sp_skin_slot_name);
			}
			#endregion
		}
		// goto next skin
		sp_skin_name = ds_map_find_next(sp_skins,sp_skin_name);
	}
}
// transfer constraint data
var sp_ik_count = 0;
if(is_real(sp_constraints_IK)&&ds_exists(sp_constraints_IK,ds_type_list)){
	sp_ik_count = ds_list_size(sp_constraints_IK);
}
var sp_transform_count = 0;
if(is_real(sp_constraints_transform)&&ds_exists(sp_constraints_transform,ds_type_list)){
	sp_transform_count = ds_list_size(sp_constraints_transform);
}
var sp_path_count = 0;
if(is_real(sp_constraints_path)&&ds_exists(sp_constraints_path,ds_type_list)){
	sp_path_count = ds_list_size(sp_constraints_path);
}
var sp_constraint_count = sp_ik_count + sp_transform_count + sp_path_count;
for(var sp_constraint_id = 0; sp_constraint_id < sp_constraint_count; sp_constraint_id++){
	// iterate through all constraints and add them by order
	if(sp_ik_count>0){
		for(var sp_ik_id = 0; sp_ik_id < sp_ik_count; sp_ik_id++){
			var sp_ik_record = sp_constraints_IK[| sp_ik_id];
			if(is_real(sp_ik_record)&&ds_exists(sp_ik_record,ds_type_map)){
				if(sp_constraint_id==sp_ik_record[? "order"]){
					var sp_IK_bones = sp_ik_record[? "bones"];
					if(is_real(sp_IK_bones)&&ds_exists(sp_IK_bones,ds_type_list)){
						#region // add IK constraint
						var sk_IK_name = string(sp_ik_record[? "name"]);
				        var sk_IK_chain = ds_list_size(sp_IK_bones)>1;
						var sk_IK_boneTarget = sk_armature_find_bone(sk_skel,sp_ik_record[? "target"]);
						var sk_IK_boneJoint = sk_armature_find_bone(sk_skel,sp_IK_bones[| sk_IK_chain]);
						var sk_IK_positive = (is_real(sp_ik_record[? "bendPositive"])&&(!sp_ik_record[? "bendPositive"])) ? sk_bendDir_positive : sk_bendDir_negative; //  this is because spines +ve y axis is up (not down)
						var sk_IK_weight = is_real(sp_ik_record[? "mix"]) ? sp_ik_record[? "mix"] : 1;
						if(sk_struct_isof(sk_IK_boneTarget,sk_type_bone)&&sk_struct_isof(sk_IK_boneJoint,sk_type_bone)){
							// create new record and set data
							var sk_constraint = sk_constraint_create_ik(sk_IK_name,sk_IK_boneJoint,sk_IK_boneTarget);
							sk_constraint_ik_set_mix(sk_constraint,sk_IK_positive,sk_IK_weight);
							sk_constraint_ik_set_chain(sk_constraint,sk_IK_chain);
							sk_armature_add_constraint(sk_skel,sk_constraint);
						}
						#endregion
					}
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sp_transform_count>0){
		for(var sp_transform_id = 0; sp_transform_id < sp_transform_count; sp_transform_id++){
			var sp_transform_record = sp_constraints_transform[| sp_transform_id];
			if(is_real(sp_transform_record)&&ds_exists(sp_transform_record,ds_type_map)){
				if(sp_constraint_id==sp_transform_record[? "order"]){
					#region // add transformation constraint
					var sk_transform_name = string(sp_transform_record[? "name"]);
					var sk_transform_boneTarget = sk_armature_find_bone(sk_skel,sp_transform_record[? "target"]);
					var sk_transform_bones = sp_transform_record[? "bones"];
					var sk_transform_x = real(sp_transform_record[? "x"]);
					var sk_transform_y = -real(sp_transform_record[? "y"]);
					var sk_transform_xscale = real(sp_transform_record[? "scaleX"]);
					var sk_transform_yscale = real(sp_transform_record[? "scaleY"]);
					var sk_transform_yshear = real(sp_transform_record[? "shearY"]);
					var sk_transform_rotation = real(sp_transform_record[? "rotation"]);
					var sk_transform_translateMix = is_real(sp_transform_record[? "translateMix"]) ? sp_transform_record[? "translateMix"] : 1;
					var sk_transform_scaleMix = is_real(sp_transform_record[? "scaleMix"]) ? sp_transform_record[? "scaleMix"] : 1;
					var sk_transform_shearMix = is_real(sp_transform_record[? "shearMix"]) ? sp_transform_record[? "shearMix"] : 1;
					var sk_transform_rotateMix = is_real(sp_transform_record[? "rotateMix"]) ? sp_transform_record[? "rotateMix"] : 1;
					var sk_transform_local = real(sp_transform_record[? "local"]);
					var sk_transform_relative = real(sp_transform_record[? "relative"]);
					if(sk_struct_isof(sk_transform_boneTarget,sk_type_bone)){
						// create new record and set data
						var sk_constraint = sk_constraint_create_transform(sk_transform_name,sk_transform_boneTarget);
						sk_constraint_transform_set_local(sk_constraint,sk_transform_local);
						sk_constraint_transform_set_relative(sk_constraint,sk_transform_relative);
						sk_constraint_transform_set_offset(
							sk_constraint,
							sk_transform_x,sk_transform_y,
							sk_transform_xscale,sk_transform_yscale,
							sk_transform_yshear,sk_transform_rotation
						);
						sk_constraint_transform_set_mix(
							sk_constraint,
							sk_transform_translateMix,
							sk_transform_scaleMix,
							sk_transform_shearMix,
							sk_transform_rotateMix
						);
						// add child bones
						if(is_real(sk_transform_bones)&&ds_exists(sk_transform_bones,ds_type_list)){
							var sk_transform_bone_count = ds_list_size(sk_transform_bones);
							for(var sk_transform_bone_id = 0; sk_transform_bone_id < sk_transform_bone_count; sk_transform_bone_id++){
								var sk_transform_bone = sk_armature_find_bone(sk_skel,sk_transform_bones[| sk_transform_bone_id]);
								if(sk_struct_isof(sk_transform_bone,sk_type_bone)){
									sk_constraint_transform_bone_children_add(sk_constraint,sk_transform_bone);
								}
							}
						}
						sk_armature_add_constraint(sk_skel,sk_constraint);
					}
					#endregion
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sp_path_count>0){
		for(var sp_path_id = 0; sp_path_id < sp_path_count; sp_path_id++){
			var sp_path_record = sp_constraints_path[| sp_path_id];
			if(is_real(sp_path_record)&&ds_exists(sp_path_record,ds_type_map)){
				if(sp_constraint_id==sp_path_record[? "order"]){
					#region // add path constraint
					// TBA
					#endregion
				}
			}
		}
	}
}
// transfer event data
if(is_real(sp_events)&&ds_exists(sp_events,ds_type_map)){
	var sp_event_count = ds_map_size(sp_events);
	var sp_event_name = ds_map_find_first(sp_events);
	repeat(sp_event_count){
	    var sp_event_record = sp_events[? sp_event_name];
	    if(is_real(sp_event_record)&&ds_exists(sp_event_record,ds_type_map)){
			#region // add event
			var sk_event_string = is_string(sp_event_record[? "string"]) ? sp_event_record[? "string"] : "";
			var sk_event_float = real(sp_event_record[? "float"]);
			var sk_event_int = int64(sp_event_record[? "int"]);
			// create a new event and add it to the armature
			var sk_event = sk_event_create(string(sp_event_name));
			sk_event_data_set(sk_event,noone,sk_event_string,sk_event_float,sk_event_int,-1);
			sk_armature_add_event(sk_skel,sk_event);
			#endregion
		}
		// goto next event
		sp_event_name = ds_map_find_next(sp_events,sp_event_name);
	}
}
// apply setup
sk_armature_setToDefaultSkin(sk_skel);
sk_armature_updateCache(sk_skel);
sk_armature_setToSetupPose(sk_skel);
sk_armature_updateWorldTransform(sk_skel);
// transfer animation data
var sp_fps = 60;
if(is_real(sp_animations)&&ds_exists(sp_animations,ds_type_map)){
	var sp_anim_count = ds_map_size(sp_animations);
	var sp_anim_name = ds_map_find_first(sp_animations);
	repeat(sp_anim_count){
	    var sp_anim_record = sp_animations[? sp_anim_name];
	    if(is_real(sp_anim_record)&&ds_exists(sp_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(sp_anim_name));
			sk_armature_add_animation(sk_skel,sk_anim);
			var sk_anim_duration = 0;
			// compile timeline data
			var sp_anim_bones = sp_anim_record[? "bones"];
			var sp_anim_slots = sp_anim_record[? "slots"];
			var sp_anim_ik = sp_anim_record[? "ik"];
			var sp_anim_transform = sp_anim_record[? "transform"];
			var sp_anim_events = sp_anim_record[? "events"];
			var sp_anim_drawOrder = sp_anim_record[? "draworder"];
			// iterate through bone data
			if(is_real(sp_anim_bones)&&ds_exists(sp_anim_bones,ds_type_map)){
				var sp_anim_bone_count = ds_map_size(sp_anim_bones);
				var sp_anim_bone_name = ds_map_find_first(sp_anim_bones);
				repeat(sp_anim_bone_count){
				    var sp_anim_bone_record = sp_anim_bones[? sp_anim_bone_name];
				    if(is_real(sp_anim_bone_record)&&ds_exists(sp_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(sp_anim_bone_name);
						var sk_anim_timeline_boneData = sk_armature_find_bone(sk_skel,sk_anim_timeline_boneName);
						var sp_anim_bone_translate = sp_anim_bone_record[? "translate"];
						var sp_anim_bone_scale = sp_anim_bone_record[? "scale"];
						var sp_anim_bone_shear = sp_anim_bone_record[? "shear"];
						var sp_anim_bone_rotate = sp_anim_bone_record[? "rotate"];
						#region // compile translate timeline
						if(is_real(sp_anim_bone_translate)&&ds_exists(sp_anim_bone_translate,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_translate);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_translate(sk_anim_timeline_boneName+".TimelineTranslate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_translate[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_frame_add_translate(
											sk_timelineData,
											sk_anim_frame_time,
											real(sp_anim_frame_record[? "x"]),
											-real(sp_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(sp_anim_bone_scale)&&ds_exists(sp_anim_bone_scale,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_scale);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_scale(sk_anim_timeline_boneName+".TimelineScale",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_scale[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_frame_add_scale(
											sk_timelineData,
											sk_anim_frame_time,
											is_real(sp_anim_frame_record[? "x"]) ? sp_anim_frame_record[? "x"] : 1,
											is_real(sp_anim_frame_record[? "y"]) ? sp_anim_frame_record[? "y"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile shear timeline
						if(is_real(sp_anim_bone_shear)&&ds_exists(sp_anim_bone_shear,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_shear);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_shear(sk_anim_timeline_boneName+".TimelineShear",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_shear[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_frame_add_shear(
											sk_timelineData,
											sk_anim_frame_time,
											real(sp_anim_frame_record[? "x"]),
											real(sp_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile rotation timeline
						if(is_real(sp_anim_bone_rotate)&&ds_exists(sp_anim_bone_rotate,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_rotate);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_rotate(sk_anim_timeline_boneName+".TimelineRotate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_rotate[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_frame_add_rotate(
											sk_timelineData,
											sk_anim_frame_time,
											real(sp_anim_frame_record[? "angle"]),
											0,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next bone
					sp_anim_bone_name = ds_map_find_next(sp_anim_bones,sp_anim_bone_name);
				}
			}
			// iterate through slot data
			if(is_real(sp_anim_slots)&&ds_exists(sp_anim_slots,ds_type_map)){
				var sp_anim_slot_count = ds_map_size(sp_anim_slots);
				var sp_anim_slot_name = ds_map_find_first(sp_anim_slots);
				repeat(sp_anim_slot_count){
				    var sp_anim_slot_record = sp_anim_slots[? sp_anim_slot_name];
				    if(is_real(sp_anim_slot_record)&&ds_exists(sp_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(sp_anim_slot_name);
						var sk_anim_timeline_slotData = sk_armature_find_slot(sk_skel,sk_anim_timeline_slotName,sk_type_slot);
						var sp_anim_slot_colour = sp_anim_slot_record[? "color"];
						var sp_anim_slot_attachment = sp_anim_slot_record[? "attachment"];
						#region // compile colour timeline
						if(is_real(sp_anim_slot_colour)&&ds_exists(sp_anim_slot_colour,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_slot_colour);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_colour(sk_anim_timeline_slotName+".TimelineColour",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_slot_colour[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
										// get colour
										var sk_anim_frame_rgba = is_string(sp_anim_frame_record[? "color"]) ? sp_anim_frame_record[? "color"] : "FFFFFFFF";
										// append keyframe data in format [time, colour, alpha, tween]
										sk_timeline_frame_add_colour(
											sk_timelineData,
											sk_anim_frame_time,
											sk_hex_get_colour(sk_anim_frame_rgba,false),
											sk_hex_get_alpha(sk_anim_frame_rgba,false),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile display (attachment) timeline
						if(is_real(sp_anim_slot_attachment)&&ds_exists(sp_anim_slot_attachment,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_slot_attachment);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_display(sk_anim_timeline_slotName+".TimelineDisplay",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_slot_attachment[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// append keyframe data in format [time, attachmentName]
										sk_timeline_frame_add_display(
											sk_timelineData,
											sk_anim_frame_time,
											string(sp_anim_frame_record[? "name"])
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next slot
					sp_anim_slot_name = ds_map_find_next(sp_anim_slots,sp_anim_slot_name);
				}
			}
			// iterate through ik data
			if(is_real(sp_anim_ik)&&ds_exists(sp_anim_ik,ds_type_map)){
				var sp_anim_ik_count = ds_map_size(sp_anim_ik);
				var sp_anim_ik_name = ds_map_find_first(sp_anim_ik);
				repeat(sp_anim_ik_count){
				    var sp_anim_ik_record = sp_anim_ik[? sp_anim_ik_name];
				    if(is_real(sp_anim_ik_record)&&ds_exists(sp_anim_ik_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_ikName = string(sp_anim_ik_name);
						var sk_anim_timeline_ikData = sk_armature_find_constraint(sk_skel,sk_anim_timeline_ikName,sk_type_constraint_ik);
						var sp_anim_ik_frames = sp_anim_ik_record;
						#region // compile IK timeline
						if(true){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_ik_frames);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_ik(sk_anim_timeline_ikName+".TimelineIK",sk_anim_timeline_ikData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_ik_frames[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, bendDir, weight, tweenEasing]
										sk_timeline_frame_add_ik(
											sk_timelineData,
											sk_anim_frame_time,
											sp_anim_frame_record[? "bendPositive"] ? sk_bendDir_negative : sk_bendDir_positive,
											is_real(sp_anim_frame_record[? "mix"]) ? sp_anim_frame_record[? "mix"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next ik constraint
					sp_anim_ik_name = ds_map_find_next(sp_anim_ik,sp_anim_ik_name);
				}
			}
			// iterate through transformation data
			if(is_real(sp_anim_transform)&&ds_exists(sp_anim_transform,ds_type_map)){
				var sp_anim_transform_count = ds_map_size(sp_anim_transform);
				var sp_anim_transform_name = ds_map_find_first(sp_anim_transform);
				repeat(sp_anim_transform_count){
				    var sp_anim_transform_record = sp_anim_transform[? sp_anim_transform_name];
				    if(is_real(sp_anim_transform_record)&&ds_exists(sp_anim_transform_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_transformName = string(sp_anim_transform_name);
						var sk_anim_timeline_transformData = sk_armature_find_constraint(sk_skel,sk_anim_timeline_transformName,sk_type_constraint_transform);
						var sp_anim_transform_frames = sp_anim_transform_record;
						#region // compile transformation timeline
						if(true){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_transform_frames);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_transform(sk_anim_timeline_transformName+".TimelineTransform",sk_anim_timeline_transformData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_transform_frames[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, translateMix, scaleMix, shearMix, rotateMix, tweenEasing]
										sk_timeline_frame_add_transform(
											sk_timelineData,
											sk_anim_frame_time,
											is_real(sp_anim_frame_record[? "translateMix"]) ? sp_anim_frame_record[? "translateMix"] : 1,
											is_real(sp_anim_frame_record[? "scaleMix"]) ? sp_anim_frame_record[? "scaleMix"] : 1,
											is_real(sp_anim_frame_record[? "shearMix"]) ? sp_anim_frame_record[? "shearMix"] : 1,
											is_real(sp_anim_frame_record[? "rotateMix"]) ? sp_anim_frame_record[? "rotateMix"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next transformation constraint
					sp_anim_transform_name = ds_map_find_next(sp_anim_transform,sp_anim_transform_name);
				}
			}
			// iterate through event data
			var SP_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(sp_anim_record,"|SP_EVENT_TIMELINE_MAP|",SP_EVENT_TIMELINE_MAP); // store it in the spine json temporarily so it can be destroyed easily
			if(is_real(sp_anim_events)&&ds_exists(sp_anim_events,ds_type_list)){
				var sp_anim_event_count = ds_list_size(sp_anim_events);
				if(sp_anim_event_count>0){
					var sk_anim_frame_duration = 0;
		            for(var sp_anim_event_id = 0; sp_anim_event_id < sp_anim_event_count; sp_anim_event_id++){
		                var sp_anim_event_record = sp_anim_events[| sp_anim_event_id];
		                if(is_real(sp_anim_event_record)&&ds_exists(sp_anim_event_record,ds_type_map)){
							#region // compile event timeline
							var sk_anim_frame_time = real(sp_anim_event_record[? "time"])*sp_fps;
							var sk_anim_frame_eventName = sp_anim_event_record[? "name"];
							// get event
							var sk_anim_frame_event = sk_armature_find_event(sk_skel,sk_anim_frame_eventName);
							if(!sk_struct_isof(sk_event,sk_type_event)){
								// event doesn't exist, that's okay, create a new event
								sk_anim_frame_event = sk_event_create(sk_anim_frame_time);
								sk_armature_add_event(sk_skel,sk_anim_frame_event);
							}
							// get timeline
							var sk_anim_frame_timeline = SP_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName];
							if(!sk_struct_isof(sk_anim_frame_timeline,sk_type_timeline)){
								// timeline doesn't exist, create it
								sk_anim_frame_timeline = sk_timeline_create_event(sk_anim_frame_eventName+".timelineEvent",sk_anim_frame_event);
								sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline);
								SP_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName] = sk_anim_frame_timeline;
							}
							// get event data
							var sk_anim_frame_int = sp_anim_event_record[? "int"];
							var sk_anim_frame_float = sp_anim_event_record[? "float"];
							var sk_anim_frame_string = sp_anim_event_record[? "string"];
							// append timeline data
							sk_timeline_frame_add_event(
								sk_anim_frame_timeline,
								sk_anim_frame_time,
								noone,
								sk_anim_frame_string,
								sk_anim_frame_float,
								sk_anim_frame_int,
								-1
							);
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
							#endregion
						}
					}
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// iterate through drawOrder data
			if(is_real(sp_anim_drawOrder)&&ds_exists(sp_anim_drawOrder,ds_type_list)){
				var sp_anim_frame_count = ds_list_size(sp_anim_drawOrder);
				if(sp_anim_frame_count>0){
					// add timeline to animation
					var sk_timelineData = sk_timeline_create_draworder("Armature.TimelineDrawOrder",sk_skel);
					sk_animation_add_timeline(sk_anim,sk_timelineData);
					#region // compile order frames
					var sk_anim_frame_duration = 0;
		            for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                var sp_anim_frame_record = sp_anim_drawOrder[| sp_anim_frame_id];
		                if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
							// add frame
							var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
							var sk_order_itemOffsetTuple = ds_list_create();
							// find original slot from slots array
							var sp_order_offsets = sp_anim_frame_record[? "offsets"];
							if(is_real(sp_order_offsets)&&ds_exists(sp_order_offsets,ds_type_list)){
								var sp_order_offset_count = ds_list_size(sp_order_offsets);
								for(var sp_order_offset_id = 0; sp_order_offset_id < sp_order_offset_count; sp_order_offset_id++){
									var sp_order_record = sp_order_offsets[| sp_order_offset_id];
									if(is_real(sp_order_record)&&ds_exists(sp_order_record,ds_type_map)){
										var sk_order_slot = sk_armature_find_slot(sk_skel,sp_order_record[? "slot"],sk_type_slot);
										var sk_order_shift = real(sp_order_record[? "slot"]);
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
							}
							// append timeline data
							sk_timeline_frame_add_draworder(
								sk_timelineData,
								sk_anim_frame_time,
								sk_order_itemOffsetTuple
							);
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
						}
					}
					#endregion
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// set final duration
			sk_animation_set_duration(sk_anim,sk_anim_duration);
			#endregion
		}
		// goto next animation
		sp_anim_name = ds_map_find_next(sp_animations,sp_anim_name);
	}
}
// return final structure
ds_map_destroy(sp_skel);
return sk_skel;

#define sk_armature_build_spriter
/// @desc loads an armature file
/// @param json
/// @param entity_name_or_id
var sp_armature = noone;
// extract armature data from spriter json
var sp_skel = json_decode(argument0);
if(ds_exists(sp_skel,ds_type_map)){
	var sp_armature_found = false;
	var sp_armatures = sp_skel[? "entity"];
	if(is_real(sp_armatures)&&ds_exists(sp_armatures,ds_type_list)){
		var sp_armature_count = ds_list_size(sp_armatures);
        for(var sp_armature_id = 0; sp_armature_id < sp_armature_count; sp_armature_id++){
            var sp_armature_data = sp_armatures[| sp_armature_id];
            if(is_real(sp_armature_data)&&ds_exists(sp_armature_data,ds_type_map)
			&&( (sp_armature_data[? "name"]==argument1)||(sp_armature_data[? "id"]==argument1) )){
    			// armature found
				sp_armature = sp_armature_data;
    			sp_armature_found = true;
				break;
    		}
        }
	}
	if(!sp_armature_found){
		ds_map_destroy(sp_skel);
		return noone;
	}
} else {
	return noone;
}
// extract important data
var sp_folders = sp_skel[? "folder"];
var sp_objInfo = sp_armature[? "obj_info"];
var sp_characterMaps = sp_armature[? "character_map"];
var sp_animations = sp_armature[? "animation"];
// create armature
var sk_skel = sk_armature_create(sp_armature[? "name"]);
// transfer sprite data (attachments)
if(is_real(sp_folders)&&ds_exists(sp_folders,ds_type_list)){
	var sp_folder_count = ds_list_size(sp_folders);
	for(var sp_folder_id = 0; sp_folder_id < sp_folder_count; sp_folder_id++){
		var sp_folder = sp_folders[| sp_folder_id];
		if(is_real(sp_folder)&&ds_exists(sp_folder,ds_type_map)){
			var sp_files = sp_folder[? "file"];
			if(is_real(sp_files)&&ds_exists(sp_files,ds_type_list)){
				var sp_file_count = ds_list_size(sp_files);
				for(var sp_file_id = 0; sp_file_id < sp_file_count; sp_file_id++){
					var sp_sprite = sp_files[| sp_file_id];
					if(is_real(sp_sprite)&&ds_exists(sp_sprite,ds_type_map)){
						#region // add attachment
						var sk_attachment_name = sk_createCompoundKey(sp_folder_id,sp_file_id); // a tuple consisting of the folder and file indicies
						var sk_attachment_path = string(sp_sprite[? "name"]);
						// create new record and append data
						var sk_attachment_pivot_x = real(sp_sprite[? "pivot_x"]);
						var sk_attachment_pivot_y = 1-(is_real(sp_sprite[? "pivot_y"]) ? sp_sprite[? "pivot_y"] : 1);
						var sk_attachment_pivot_w = real(sp_sprite[? "width"]);
						var sk_attachment_pivot_h = real(sp_sprite[? "height"]);
						var sk_attachment = sk_attachment_create_plane(sk_attachment_name,sk_attachment_path);
						sk_attachment_plane_set_matrix(
							sk_attachment,
							-(sk_attachment_pivot_x-0.5)*sk_attachment_pivot_w, // attachments are drawn with a default origin at their centre
							-(sk_attachment_pivot_y-0.5)*sk_attachment_pivot_h,
							1,1,0,0,0
						);
						sk_armature_add_attachment(sk_skel,sk_attachment);
						#endregion
					}
				}
			}
		}
	}
}
// transfer object data (bones and constraints)
if(is_real(sp_objInfo)&&ds_exists(sp_objInfo,ds_type_list)){
	var sp_obj_count = ds_list_size(sp_objInfo);
	for(var sp_obj_id = 0; sp_obj_id < sp_obj_count; sp_obj_id++){
	    var sp_obj_record = sp_objInfo[| sp_obj_id];
	    if(is_real(sp_obj_record)&&ds_exists(sp_obj_record,ds_type_map)){
			switch(sp_obj_record[? "type"]){
				case "bone":
					#region // add bone
					var sk_bone = sk_bone_create(string(sp_obj_record[? "name"]),noone);
					sk_bone_set_transformMode(sk_bone,sk_transformMode_ex_spriter); // spriter doesn't have skew transforms
					sk_bone_set_length(sk_bone,sp_obj_record[? "w"]);
					sk_armature_add_bone(sk_skel,sk_bone);
					#endregion
				break;
			}
		}
	}
}
// create a default hierarchy constraint
var sk_bone_hierarchy = sk_constraint_create_hierarchy("spriter_bone_hierarchy");
sk_armature_add_constraint(sk_skel,sk_bone_hierarchy);
// create a default skin and define remap data
var sk_defaultSkin = sk_armature_default_skin(sk_skel);
if(is_real(sp_characterMaps)&&ds_exists(sp_characterMaps,ds_type_list)){
	var sp_map_count = ds_list_size(sp_characterMaps);
	for(var sp_map_id = 0; sp_map_id < sp_map_count; sp_map_id++){
	    var sp_map_record = sp_characterMaps[| sp_map_id];
	    if(is_real(sp_map_record)&&ds_exists(sp_map_record,ds_type_map)){
			#region // add character map
			var sk_map_key = string(sp_map_record[? "name"]);
			var sk_map = ds_map_create();
			sk_skin_remaps_add(sk_defaultSkin,sk_map,sk_map_key);
			// fill ds_map
			var sp_map = sp_map_record[? "map"];
			if(is_real(sp_map)&&ds_exists(sp_map,ds_type_list)){
				var sp_item_count = ds_list_size(sp_map);
				for(var sp_item_id = 0; sp_item_id < sp_item_count; sp_item_id++){
				    var sp_remap_record = sp_map[| sp_item_id];
					if(is_real(sp_remap_record)&&ds_exists(sp_remap_record,ds_type_map)){
						var sp_remap_current = sk_createCompoundKey(sp_remap_record[? "folder"],sp_remap_record[? "file"]);
						var sp_remap_target = sk_createCompoundKey(sp_remap_record[? "target_folder"],sp_remap_record[? "target_file"]);
						// get the current and target attachments
						var sk_remap_attachment_current = sk_armature_find_attachment(sk_skel,sp_remap_current,sk_type_attachment_plane);
						var sk_remap_attachment_target = sk_armature_find_attachment(sk_skel,sp_remap_target,sk_type_attachment_plane);
						// remap
						if(sk_struct_isof(sk_remap_attachment_current,sk_type_attachment_plane)){
							sk_map[? sk_remap_attachment_current] = sk_remap_attachment_target;
						}
					}
				}
			}
			#endregion
		}
	}
}
// iterate through all the animation timelines and compile a list of symbols
if(is_real(sp_animations)&&ds_exists(sp_animations,ds_type_list)){
	var sp_anim_count = ds_list_size(sp_animations);
	for(var sp_anim_id = 0; sp_anim_id < sp_anim_count; sp_anim_id++){
	    var sp_anim_record = sp_animations[| sp_anim_id];
	    if(is_real(sp_anim_record)&&ds_exists(sp_anim_record,ds_type_map)){
			// get animation timelines
			var sp_anim_timelines = sp_anim_record[? "timeline"];
			if(is_real(sp_anim_timelines)&&ds_exists(sp_anim_timelines,ds_type_list)){
				var sp_timeline_count = ds_list_size(sp_anim_timelines);
				for(var sp_timeline_id = 0; sp_timeline_id < sp_timeline_count; sp_timeline_id++){
					var sp_timeline_record = sp_anim_timelines[| sp_timeline_id];
					if(is_real(sp_timeline_record)&&ds_exists(sp_timeline_record,ds_type_map)){
						// timeline exists
						var sp_timeline_type = is_string(sp_timeline_record[? "object_type"]) ? sp_timeline_record[? "object_type"] : "sprite";
						if(sp_timeline_type=="sprite"){
							#region // add symbol
							var sk_symbol_name = sp_timeline_record[? "name"];
							if(sk_armature_find_slot(sk_skel,sk_symbol_name,sk_type_symbol)==noone){
								// symbol doesn't exist, create it
								var sk_symbol = sk_symbol_create(sk_symbol_name,noone);
								sk_bone_set_transformMode(sk_symbol_get_nested_bone(sk_symbol),sk_transformMode_ex_spriter); // no skew transform
								sk_armature_add_slot(sk_skel,sk_symbol);
							}
							#endregion
						}
					}
				}
			}
		}
	}
}
// get symbol list
var sk_symbols = ds_list_create();
ds_map_add_list(sp_armature,"|sk_symbols|",sk_symbols);
sk_armature_copy_slots(sk_skel,sk_symbols);
// transfer animation data
if(is_real(sp_animations)&&ds_exists(sp_animations,ds_type_list)){
	var sp_anim_count = ds_list_size(sp_animations);
	for(var sp_anim_id = 0; sp_anim_id < sp_anim_count; sp_anim_id++){
	    var sp_anim_record = sp_animations[| sp_anim_id];
	    if(is_real(sp_anim_record)&&ds_exists(sp_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim_name = string(sp_anim_record[? "name"]);
			var sk_anim = sk_animation_create(sk_anim_name);
			sk_animation_set_duration(sk_anim,sp_anim_record[? "length"]);
			sk_animation_set_looping(sk_anim,sp_anim_record[? "looping"]!="false");
			sk_armature_add_animation(sk_skel,sk_anim);
			// create and add the draw order timeline
			var sk_anim_timeline_drawOrder = sk_timeline_create_draworder("Armature.TimelineDrawOrder",sk_skel);
			sk_animation_add_timeline(sk_anim,sk_anim_timeline_drawOrder);
			// create and add the hierarchy timeline
			var sk_anim_timeline_hierarchy = sk_timeline_create_hierarchy("Armature.TimelineHierarchy",sk_bone_hierarchy);
			sk_animation_add_timeline(sk_anim,sk_anim_timeline_hierarchy);
			// create a map to easily look up the timeline attributed to the object
			var SP_BONE_TIMELINE_MAP_TRANSLATE = ds_map_create();
			var SP_BONE_TIMELINE_MAP_SCALE = ds_map_create();
			var SP_BONE_TIMELINE_MAP_ROTATE = ds_map_create();
			var SP_SYMBOL_TIMELINE_MAP_TRANSLATE = ds_map_create();
			var SP_SYMBOL_TIMELINE_MAP_SCALE = ds_map_create();
			var SP_SYMBOL_TIMELINE_MAP_ROTATE = ds_map_create();
			var SP_SYMBOL_TIMELINE_MAP_COLOUR = ds_map_create();
			var SP_SYMBOL_TIMELINE_MAP_DISPLAY = ds_map_create();
			var SP_SYMBOL_TIMELINE_MAP_PARENT = ds_map_create();
			ds_map_add_map(sp_anim_record,"|SP_BONE_TIMELINE_MAP_TRANSLATE|",SP_BONE_TIMELINE_MAP_TRANSLATE);
			ds_map_add_map(sp_anim_record,"|SP_BONE_TIMELINE_MAP_SCALE|",SP_BONE_TIMELINE_MAP_SCALE);
			ds_map_add_map(sp_anim_record,"|SP_BONE_TIMELINE_MAP_ROTATE|",SP_BONE_TIMELINE_MAP_ROTATE);
			ds_map_add_map(sp_anim_record,"|SP_SYMBOL_TIMELINE_MAP_TRANSLATE|",SP_SYMBOL_TIMELINE_MAP_TRANSLATE);
			ds_map_add_map(sp_anim_record,"|SP_SYMBOL_TIMELINE_MAP_SCALE|",SP_SYMBOL_TIMELINE_MAP_SCALE);
			ds_map_add_map(sp_anim_record,"|SP_SYMBOL_TIMELINE_MAP_ROTATE|",SP_SYMBOL_TIMELINE_MAP_ROTATE);
			ds_map_add_map(sp_anim_record,"|SP_SYMBOL_TIMELINE_MAP_COLOUR|",SP_SYMBOL_TIMELINE_MAP_COLOUR);
			ds_map_add_map(sp_anim_record,"|SP_SYMBOL_TIMELINE_MAP_DISPLAY|",SP_SYMBOL_TIMELINE_MAP_DISPLAY);
			ds_map_add_map(sp_anim_record,"|SP_SYMBOL_TIMELINE_MAP_PARENT|",SP_SYMBOL_TIMELINE_MAP_PARENT);
			// iterate through mainline
			var sp_anim_timelines = sp_anim_record[? "timeline"];
			if(is_real(sp_anim_timelines)&&ds_exists(sp_anim_timelines,ds_type_list)){
				var sp_anim_mainline = sp_anim_record[? "mainline"];
				if(is_real(sp_anim_mainline)&&ds_exists(sp_anim_mainline,ds_type_map)){
					var sp_anim_mainline_frames = sp_anim_mainline[? "key"];
					if(is_real(sp_anim_mainline_frames)&&ds_exists(sp_anim_mainline_frames,ds_type_list)){
						var sp_anim_mainline_frame_count = ds_list_size(sp_anim_mainline_frames);
						for(var sp_anim_mainline_frame_id = 0; sp_anim_mainline_frame_id < sp_anim_mainline_frame_count; sp_anim_mainline_frame_id++){
							var sp_anim_mainline_frame = sp_anim_mainline_frames[| sp_anim_mainline_frame_id];
							if(is_real(sp_anim_mainline_frame)&&ds_exists(sp_anim_mainline_frame,ds_type_map)){
								// frame exists
								var sp_anim_mainline_frame_bones = sp_anim_mainline_frame[? "bone_ref"];
								var sp_anim_mainline_frame_objects = sp_anim_mainline_frame[? "object_ref"];
								var sp_anim_mainline_frame_time = max(real(sp_anim_mainline_frame[? "time"]),0);
								// get curve
								var sk_anim_frame_curve = sk_tweenEasing_linear;
								switch(sp_anim_mainline_frame[? "curve_type"]){
									case "instant": sk_anim_frame_curve = sk_tweenEasing_none; break;
									case "bezier": sk_anim_frame_curve = sk_bezier_aproximateCurve(
											real(sp_anim_mainline_frame[? "c1"]),
											real(sp_anim_mainline_frame[? "c2"]),
											real(sp_anim_mainline_frame[? "c3"]),
											real(sp_anim_mainline_frame[? "c4"])
										);
									break;
								}
								// create lists for constructing future order timelines
								var SK_OBJECT_ZORDER_FRAMES = ds_list_create();
								ds_map_add_list(sp_anim_mainline_frame,"|SK_OBJECT_ZORDER_FRAMES|",SK_OBJECT_ZORDER_FRAMES);
								// create a new frame for the hierarchy constraint timeline
								var sk_anim_frame_hierarchy_tupleKey = sk_createCompoundKey(sk_anim_name,sp_anim_mainline_frame_id);
								var sk_anim_frame_hierarchy_boneParentTuple = sk_constraint_hierarchy_find_tuple(sk_bone_hierarchy,sk_anim_frame_hierarchy_tupleKey);
								sk_timeline_frame_add_hierarchy(
									sk_anim_timeline_hierarchy,
									sp_anim_mainline_frame_time,
									sk_anim_frame_hierarchy_tupleKey
								);
								#region // compile bone frames
								if(is_real(sp_anim_mainline_frame_bones)&&ds_exists(sp_anim_mainline_frame_bones,ds_type_list)){
									var sp_anim_bone_count = ds_list_size(sp_anim_mainline_frame_bones);
									for(var sp_anim_bone_id = 0; sp_anim_bone_id < sp_anim_bone_count; sp_anim_bone_id++){
										var sp_anim_bone_record = sp_anim_mainline_frame_bones[| sp_anim_bone_id];
										if(is_real(sp_anim_bone_record)&&ds_exists(sp_anim_bone_record,ds_type_map)){
											var sp_anim_bone_keyframe_id = sp_anim_bone_record[? "key"];
											var sp_anim_bone_timeline_id = sp_anim_bone_record[? "timeline"];
											var sp_anim_bone_parent_id = sp_anim_bone_record[? "parent"];
											// get parent
											var sk_anim_bone_parent = noone;
											if(!is_undefined(sp_anim_bone_parent_id)){
												var sp_anim_bone_parent = sp_anim_mainline_frame_bones[| sp_anim_bone_parent_id];
												if(is_real(sp_anim_bone_parent)&&ds_exists(sp_anim_bone_parent,ds_type_map)){
													var sp_anim_parent_timeline_id = sp_anim_bone_parent[? "timeline"];
													if(!is_undefined(sp_anim_parent_timeline_id)){
														sp_anim_parent_timeline_id = real(sp_anim_parent_timeline_id);
														var sp_anim_parent_timeline_record = sp_anim_timelines[| sp_anim_parent_timeline_id];
														if(is_real(sp_anim_parent_timeline_record)&&ds_exists(sp_anim_parent_timeline_record,ds_type_map)){
															// parent timeline exists
															if(sp_anim_parent_timeline_record[? "object_type"]=="bone"){
																// get parent structure from timeline's name
																sk_anim_bone_parent = sk_armature_find_bone(sk_skel,sp_anim_parent_timeline_record[? "name"]);
															}
														}
													}
												}
											}
											// lookup timeline data
											if(!is_undefined(sp_anim_bone_keyframe_id)&&!is_undefined(sp_anim_bone_timeline_id)){
												sp_anim_bone_keyframe_id = real(sp_anim_bone_keyframe_id);
												sp_anim_bone_timeline_id = real(sp_anim_bone_timeline_id);
												var sp_anim_bone_timeline_record = sp_anim_timelines[| sp_anim_bone_timeline_id];
												if(is_real(sp_anim_bone_timeline_record)&&ds_exists(sp_anim_bone_timeline_record,ds_type_map)){
													// timeline exists
													var sp_anim_bone_timeline_keys = sp_anim_bone_timeline_record[? "key"];
													if(is_real(sp_anim_bone_timeline_keys)&&ds_exists(sp_anim_bone_timeline_keys,ds_type_list)){
														var sp_anim_bone_timeline_keyframe = sp_anim_bone_timeline_keys[| sp_anim_bone_keyframe_id];
														if(is_real(sp_anim_bone_timeline_keyframe)&&ds_exists(sp_anim_bone_timeline_keyframe,ds_type_map)){
															// keyframe exists
															var sp_anim_timeline_type = is_string(sp_anim_bone_timeline_record[? "object_type"]) ? sp_anim_bone_timeline_record[? "object_type"] : "sprite";
															switch(sp_anim_timeline_type){
																case "bone":
																	var sk_anim_bone_name = sp_anim_bone_timeline_record[? "name"];
																	var sk_anim_bone = sk_armature_find_bone(sk_skel,sk_anim_bone_name);
																	if(sk_struct_isof(sk_anim_bone,sk_type_bone)){
																		// add frame
																		var sk_anim_frame_timeline_translate = SP_BONE_TIMELINE_MAP_TRANSLATE[? sk_anim_bone_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_translate)){
																			sk_anim_frame_timeline_translate = sk_timeline_create_translate(string(sk_anim_bone_name)+".TimelineTranslate",sk_anim_bone);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_translate);
																			SP_BONE_TIMELINE_MAP_TRANSLATE[? sk_anim_bone_name] = sk_anim_frame_timeline_translate;
																		}
																		var sk_anim_frame_timeline_scale = SP_BONE_TIMELINE_MAP_SCALE[? sk_anim_bone_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_scale)){
																			sk_anim_frame_timeline_scale = sk_timeline_create_scale(string(sk_anim_bone_name)+".TimelineScale",sk_anim_bone);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_scale);
																			SP_BONE_TIMELINE_MAP_SCALE[? sk_anim_bone_name] = sk_anim_frame_timeline_scale;
																		}
																		var sk_anim_frame_timeline_rotate = SP_BONE_TIMELINE_MAP_ROTATE[? sk_anim_bone_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_rotate)){
																			sk_anim_frame_timeline_rotate = sk_timeline_create_rotate(string(sk_anim_bone_name)+".TimelineRotate",sk_anim_bone);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_rotate);
																			SP_BONE_TIMELINE_MAP_ROTATE[? sk_anim_bone_name] = sk_anim_frame_timeline_rotate;
																		}
																		// get frame data
																		var sk_anim_bone_x = 0;
																		var sk_anim_bone_y = 0;
																		var sk_anim_bone_rotation = 0;
																		var sk_anim_bone_xscale = 1;
																		var sk_anim_bone_yscale = 1;
																		var sk_anim_frame_time = real(sp_anim_bone_timeline_keyframe[? "time"]); // this fixes a bug where timelines were interpolated wrong
																		var sk_anim_frame_spin = is_real(sp_anim_bone_timeline_keyframe[? "spin"]) ? sp_anim_bone_timeline_keyframe[? "spin"] : 1;
																		// compile transformation data
																		var sp_anim_frame_boneTransform = sp_anim_bone_timeline_keyframe[? "bone"];
																		if(is_real(sp_anim_frame_boneTransform)&&ds_exists(sp_anim_frame_boneTransform,ds_type_map)){
																			sk_anim_bone_x = real(sp_anim_frame_boneTransform[? "x"]);
																			sk_anim_bone_y = real(sp_anim_frame_boneTransform[? "y"]);
																			sk_anim_bone_rotation = real(sp_anim_frame_boneTransform[? "angle"]);
																			sk_anim_bone_xscale = is_real(sp_anim_frame_boneTransform[? "scale_x"]) ? sp_anim_frame_boneTransform[? "scale_x"] : 1;
																			sk_anim_bone_yscale = is_real(sp_anim_frame_boneTransform[? "scale_y"]) ? sp_anim_frame_boneTransform[? "scale_y"] : 1;
																		}
																		// add data to timelines
																		sk_timeline_frame_add_translate(
																			sk_anim_frame_timeline_translate,
																			sk_anim_frame_time,
																			sk_anim_bone_x,
																			-sk_anim_bone_y,
																			sk_anim_frame_curve
																		);
																		sk_timeline_frame_add_scale(
																			sk_anim_frame_timeline_scale,
																			sk_anim_frame_time,
																			sk_anim_bone_xscale,
																			sk_anim_bone_yscale,
																			sk_anim_frame_curve
																		);
																		sk_timeline_frame_add_rotate(
																			sk_anim_frame_timeline_rotate,
																			sk_anim_frame_time,
																			sk_anim_bone_rotation,
																			0,
																			sk_anim_frame_curve
																		);
																		// add bone and parent to hierarchy tuple
																		ds_list_add(
																			sk_anim_frame_hierarchy_boneParentTuple,
																			sk_anim_bone,
																			ds_list_find_index(
																				sk_anim_frame_hierarchy_boneParentTuple,
																				sk_anim_bone_parent
																			)
																		);
																	}
																break;
															}
														}
													}
												}
											}
										}
									}
								}
								#endregion
								#region // compile object frames
								if(is_real(sp_anim_mainline_frame_objects)&&ds_exists(sp_anim_mainline_frame_objects,ds_type_list)){
									var sp_anim_object_count = ds_list_size(sp_anim_mainline_frame_objects);
									for(var sp_anim_object_id = 0; sp_anim_object_id < sp_anim_object_count; sp_anim_object_id++){
										var sp_anim_object_record = sp_anim_mainline_frame_objects[| sp_anim_object_id];
										if(is_real(sp_anim_object_record)&&ds_exists(sp_anim_object_record,ds_type_map)){
											var sp_anim_object_keyframe_id = sp_anim_object_record[? "key"];
											var sp_anim_object_timeline_id = sp_anim_object_record[? "timeline"];
											var sp_anim_object_parent_id = sp_anim_object_record[? "parent"];
											// get zOrder
											var sk_anim_object_zIndex = max(real(sp_anim_object_record[? "z_index"]),0);
											// get parent
											var sk_anim_object_parent = noone;
											if(!is_undefined(sp_anim_object_parent_id)){
												var sp_anim_object_parent = sp_anim_mainline_frame_bones[| sp_anim_object_parent_id];
												if(is_real(sp_anim_object_parent)&&ds_exists(sp_anim_object_parent,ds_type_map)){
													var sp_anim_parent_timeline_id = sp_anim_object_parent[? "timeline"];
													if(!is_undefined(sp_anim_parent_timeline_id)){
														sp_anim_parent_timeline_id = real(sp_anim_parent_timeline_id);
														var sp_anim_parent_timeline_record = sp_anim_timelines[| sp_anim_parent_timeline_id];
														if(is_real(sp_anim_parent_timeline_record)&&ds_exists(sp_anim_parent_timeline_record,ds_type_map)){
															// parent timeline exists
															if(sp_anim_parent_timeline_record[? "object_type"]=="bone"){
																// get parent structure from timeline's name
																sk_anim_object_parent = sk_armature_find_bone(sk_skel,sp_anim_parent_timeline_record[? "name"]);
															}
														}
													}
												}
											}
											// lookup timeline data
											if(!is_undefined(sp_anim_object_keyframe_id)&&!is_undefined(sp_anim_object_timeline_id)){
												sp_anim_object_keyframe_id = real(sp_anim_object_keyframe_id);
												sp_anim_object_timeline_id = real(sp_anim_object_timeline_id);
												var sp_anim_object_timeline_record = sp_anim_timelines[| sp_anim_object_timeline_id];
												if(is_real(sp_anim_object_timeline_record)&&ds_exists(sp_anim_object_timeline_record,ds_type_map)){
													// timeline exists
													var sp_anim_object_timeline_keys = sp_anim_object_timeline_record[? "key"];
													if(is_real(sp_anim_object_timeline_keys)&&ds_exists(sp_anim_object_timeline_keys,ds_type_list)){
														var sp_anim_object_timeline_keyframe = sp_anim_object_timeline_keys[| sp_anim_object_keyframe_id];
														if(is_real(sp_anim_object_timeline_keyframe)&&ds_exists(sp_anim_object_timeline_keyframe,ds_type_map)){
															// keyframe exists
															var sp_anim_timeline_type = is_string(sp_anim_object_timeline_record[? "object_type"]) ? sp_anim_object_timeline_record[? "object_type"] : "sprite";
															switch(sp_anim_timeline_type){
																case "sprite":
																	var sk_anim_symbol_name = sp_anim_object_timeline_record[? "name"];
																	var sk_anim_symbol = sk_armature_find_slot(sk_skel,sk_anim_symbol_name,sk_type_symbol);
																	if(sk_struct_isof(sk_anim_symbol,sk_type_symbol)){
																		var sk_anim_symbol_nestedBone = sk_symbol_get_nested_bone(sk_anim_symbol);
																		var sk_anim_symbol_nestedSlot = sk_symbol_get_nested_slot(sk_anim_symbol);
																		// add frame
																		var sk_anim_frame_timeline_translate = SP_SYMBOL_TIMELINE_MAP_TRANSLATE[? sk_anim_symbol_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_translate)){
																			sk_anim_frame_timeline_translate = sk_timeline_create_translate(string(sk_anim_symbol_name)+".Symbol.TimelineTranslate",sk_anim_symbol_nestedBone);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_translate);
																			SP_SYMBOL_TIMELINE_MAP_TRANSLATE[? sk_anim_symbol_name] = sk_anim_frame_timeline_translate;
																		}
																		var sk_anim_frame_timeline_scale = SP_SYMBOL_TIMELINE_MAP_SCALE[? sk_anim_symbol_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_scale)){
																			sk_anim_frame_timeline_scale = sk_timeline_create_scale(string(sk_anim_symbol_name)+".Symbol.TimelineScale",sk_anim_symbol_nestedBone);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_scale);
																			SP_SYMBOL_TIMELINE_MAP_SCALE[? sk_anim_symbol_name] = sk_anim_frame_timeline_scale;
																		}
																		var sk_anim_frame_timeline_rotate = SP_SYMBOL_TIMELINE_MAP_ROTATE[? sk_anim_symbol_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_rotate)){
																			sk_anim_frame_timeline_rotate = sk_timeline_create_rotate(string(sk_anim_symbol_name)+".Symbol.TimelineRotate",sk_anim_symbol_nestedBone);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_rotate);
																			SP_SYMBOL_TIMELINE_MAP_ROTATE[? sk_anim_symbol_name] = sk_anim_frame_timeline_rotate;
																		}
																		var sk_anim_frame_timeline_colour = SP_SYMBOL_TIMELINE_MAP_COLOUR[? sk_anim_symbol_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_colour)){
																			sk_anim_frame_timeline_colour = sk_timeline_create_colour(string(sk_anim_symbol_name)+".Symbol.TimelineColour",sk_anim_symbol_nestedSlot);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_colour);
																			SP_SYMBOL_TIMELINE_MAP_COLOUR[? sk_anim_symbol_name] = sk_anim_frame_timeline_colour;
																		}
																		var sk_anim_frame_timeline_display = SP_SYMBOL_TIMELINE_MAP_DISPLAY[? sk_anim_symbol_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_display)){
																			sk_anim_frame_timeline_display = sk_timeline_create_display(string(sk_anim_symbol_name)+".Symbol.TimelineDisplay",sk_anim_symbol_nestedSlot);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_display);
																			SP_SYMBOL_TIMELINE_MAP_DISPLAY[? sk_anim_symbol_name] = sk_anim_frame_timeline_display;
																		}
																		var sk_anim_frame_timeline_parent = SP_SYMBOL_TIMELINE_MAP_PARENT[? sk_anim_symbol_name];
																		if(!sk_struct_exists(sk_anim_frame_timeline_parent)){
																			sk_anim_frame_timeline_parent = sk_timeline_create_parent(string(sk_anim_symbol_name)+".Symbol.TimelineParent",sk_anim_symbol_nestedSlot);
																			sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline_parent);
																			SP_SYMBOL_TIMELINE_MAP_PARENT[? sk_anim_symbol_name] = sk_anim_frame_timeline_parent;
																		}
																		// get frame data
																		var sk_anim_symbol_file = 0;
																		var sk_anim_symbol_folder = 0;
																		var sk_anim_symbol_x = 0;
																		var sk_anim_symbol_y = 0;
																		var sk_anim_symbol_rotation = 0;
																		var sk_anim_symbol_xscale = 1;
																		var sk_anim_symbol_yscale = 1;
																		var sk_anim_symbol_alpha = 1;
																		var sk_anim_frame_time = real(sp_anim_object_timeline_keyframe[? "time"]); // this fixes a bug where timelines were interpolated wrong
																		// compile transformation data
																		var sp_anim_frame_objectTransform = sp_anim_object_timeline_keyframe[? "object"];
																		if(is_real(sp_anim_frame_objectTransform)&&ds_exists(sp_anim_frame_objectTransform,ds_type_map)){
																			sk_anim_symbol_file = real(sp_anim_frame_objectTransform[? "file"]);
																			sk_anim_symbol_folder = real(sp_anim_frame_objectTransform[? "folder"]);
																			sk_anim_symbol_x = real(sp_anim_frame_objectTransform[? "x"]);
																			sk_anim_symbol_y = real(sp_anim_frame_objectTransform[? "y"]);
																			sk_anim_symbol_rotation = real(sp_anim_frame_objectTransform[? "angle"]);
																			sk_anim_symbol_xscale = is_real(sp_anim_frame_objectTransform[? "scale_x"]) ? sp_anim_frame_objectTransform[? "scale_x"] : 1;
																			sk_anim_symbol_yscale = is_real(sp_anim_frame_objectTransform[? "scale_y"]) ? sp_anim_frame_objectTransform[? "scale_y"] : 1;
																			sk_anim_symbol_alpha = is_real(sp_anim_frame_objectTransform[? "a"]) ? sp_anim_frame_objectTransform[? "a"] : 1;
																		}
																		// get attachment key
																		var sk_anim_symbol_attachmentKey = sk_createCompoundKey(sk_anim_symbol_folder,sk_anim_symbol_file);
																		// add record to skin
																		if(!sk_skin_record_exists(sk_defaultSkin,sk_anim_symbol,sk_anim_symbol_attachmentKey)){
																			sk_skin_record_add(
																				sk_defaultSkin,
																				sk_anim_symbol,
																				sk_armature_find_attachment(sk_skel,sk_anim_symbol_attachmentKey,sk_type_attachment_plane),
																				sk_anim_symbol_attachmentKey
																			);
																		}
																		// add data to timelines
																		sk_timeline_frame_add_translate(
																			sk_anim_frame_timeline_translate,
																			sk_anim_frame_time,
																			sk_anim_symbol_x,
																			-sk_anim_symbol_y,
																			sk_anim_frame_curve
																		);
																		sk_timeline_frame_add_scale(
																			sk_anim_frame_timeline_scale,
																			sk_anim_frame_time,
																			sk_anim_symbol_xscale,
																			sk_anim_symbol_yscale,
																			sk_anim_frame_curve
																		);
																		sk_timeline_frame_add_rotate(
																			sk_anim_frame_timeline_rotate,
																			sk_anim_frame_time,
																			sk_anim_symbol_rotation,
																			0,
																			sk_anim_frame_curve
																		);
																		sk_timeline_frame_add_colour(
																			sk_anim_frame_timeline_colour,
																			sk_anim_frame_time,
																			$ffffff,
																			sk_anim_symbol_alpha,
																			sk_anim_frame_curve
																		);
																		sk_timeline_frame_add_display(
																			sk_anim_frame_timeline_display,
																			sk_anim_frame_time,
																			sk_anim_symbol_attachmentKey
																		);
																		sk_timeline_frame_add_parent(
																			sk_anim_frame_timeline_parent,
																			sk_anim_frame_time,
																			sk_anim_object_parent
																		);
																		// add symbol to drawOrder
																		SK_OBJECT_ZORDER_FRAMES[| sk_anim_object_zIndex] = sk_anim_symbol;
																	}
																break;
															}
														}
													}
												}
											}
										}
									}
								}
								#endregion
								#region // compile draw order frames (SK_OBJECT_ZORDER_FRAMES)
								var sk_anim_frame_itemOffsetTuple = ds_list_create();
								sk_timeline_frame_add_draworder(
									sk_anim_timeline_drawOrder,
									sp_anim_mainline_frame_time,
									sk_anim_frame_itemOffsetTuple
								);
								// construct order tuple
								var SK_OBJECT_ZORDER_FRAME_COUNT = ds_list_size(SK_OBJECT_ZORDER_FRAMES);
								for(var SK_OBJECT_ZORDER_FRAME_ID = SK_OBJECT_ZORDER_FRAME_COUNT-1; SK_OBJECT_ZORDER_FRAME_ID >= 0; SK_OBJECT_ZORDER_FRAME_ID--){
									// iterate backwards through the zorder and add the order data (a higher zorder => drawn last)
									var sk_anim_frame_zorder_symbol = SK_OBJECT_ZORDER_FRAMES[| SK_OBJECT_ZORDER_FRAME_ID];
									if(sk_struct_isof(sk_anim_frame_zorder_symbol,sk_type_symbol)){
										ds_list_add(
											sk_anim_frame_itemOffsetTuple,
											sk_anim_frame_zorder_symbol,
											sk_shift_back
										);
									}
								}
								// add remaining slots with null shifts (this deletes the item from the order)
								var sk_slot_count = ds_list_size(sk_symbols);
								for(var sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
									var sk_anim_frame_zorder_symbol = sk_symbols[| sk_slot_id];
									if(sk_struct_isof(sk_anim_frame_zorder_symbol,sk_type_symbol)&&(ds_list_find_index(SK_OBJECT_ZORDER_FRAMES,sk_anim_frame_zorder_symbol)==-1)){
										// if the symbol exists and is not in the current order, remove it
										ds_list_add(
											sk_anim_frame_itemOffsetTuple,
											sk_anim_frame_zorder_symbol,
											undefined // this will purge the symbol from the order 
										);
									}
								}
								#endregion
							}
						}
					}
				}
			}
			#endregion
		}
	}
}
// apply setup
sk_armature_updateCache(sk_skel);
sk_armature_setToDefaultSkin(sk_skel);
sk_armature_setToSetupPose(sk_skel);
sk_armature_updateWorldTransform(sk_skel);
// return final structure
ds_map_destroy(sp_skel);
return sk_skel;

#define sk_armature_copy_animations
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.animations]);

#define sk_armature_copy_attachments
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.attachments]);

#define sk_armature_copy_bones
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.bones]);

#define sk_armature_copy_constraints
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.constraints]);

#define sk_armature_copy_events
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.events]);

#define sk_armature_copy_skins
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.skins]);

#define sk_armature_copy_slots
/// @desc copies armature data to a ds_list
/// @param armature
/// @param list
ds_list_copy(argument1,argument0[SK_ARMATURE.slots]);

#define sk_armature_create
#macro sk_type_armature sk_armature_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ARMATURE{
	bones,slots,skins,constraints,
	animations,events,attachments,
	updateOrder,drawOrder,drawOrderFinal, /* stores bone, slot, and constraint data in a single iterable list */
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ARMATURE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_armature,argument0,
	"sk_armature_setToSetupPose", // setup script
	"sk_armature_updateWorldTransform", // apply script
	"sk_armature_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ARMATURE.bones] = ds_list_create(); // create structures for storing armature data
sk_struct[@ SK_ARMATURE.slots] = ds_list_create();
sk_struct[@ SK_ARMATURE.skins] = ds_list_create();
sk_struct[@ SK_ARMATURE.constraints] = ds_list_create();
sk_struct[@ SK_ARMATURE.animations] = ds_list_create();
sk_struct[@ SK_ARMATURE.events] = ds_list_create();
sk_struct[@ SK_ARMATURE.attachments] = ds_list_create();
sk_struct[@ SK_ARMATURE.updateOrder] = ds_list_create();
sk_struct[@ SK_ARMATURE.drawOrder] = ds_list_create();
sk_struct[@ SK_ARMATURE.drawOrderFinal] = ds_list_create();
sk_armature_add_skin(sk_struct,sk_skin_create("default"));
// return to caller
return sk_struct;

#define sk_armature_default_skin
/// @desc returns the default skin of the armature
/// @param armature
return sk_armature_find_skin(argument0,"default");

#define sk_armature_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// destroy skeleton data
	var sk_armature_lists = [
		argument0[SK_ARMATURE.bones],
		argument0[SK_ARMATURE.slots],
		argument0[SK_ARMATURE.skins],
		argument0[SK_ARMATURE.constraints],
		argument0[SK_ARMATURE.animations],
		argument0[SK_ARMATURE.events],
		argument0[SK_ARMATURE.attachments]
	];
	var sk_armature_list_count = array_length_1d(sk_armature_lists);
	for(var sk_armature_list_id = 0; sk_armature_list_id < sk_armature_list_count; sk_armature_list_id++){
		var sk_armature_list = sk_armature_lists[sk_armature_list_id];
		var sk_item_count = ds_list_size(sk_armature_list);
		for(var sk_item_id = 0; sk_item_id < sk_item_count; sk_item_id++){
			var sk_item = sk_armature_list[| sk_item_id];
			if(sk_struct_exists(sk_item)){
				sk_struct_destroy(sk_item);
			}
		}
		ds_list_destroy(sk_armature_list);
	}
	// destroy cache
	ds_list_destroy(argument0[SK_ARMATURE.updateOrder]);
	ds_list_destroy(argument0[SK_ARMATURE.drawOrder]);
	ds_list_destroy(argument0[SK_ARMATURE.drawOrderFinal]);
}

#define sk_armature_draw_debug
/// @desc renders an abstract structure representing the skeleton data
/// @param armature
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
var sk_record_count = ds_list_size(sk_updateOrder); 
for(var sk_record_id = 0; sk_record_id < sk_record_count; sk_record_id++){
	var sk_record = sk_updateOrder[| sk_record_id];
	if(sk_struct_isof(sk_record,sk_type_bone)){
		sk_bone_draw_debug(sk_record,argument1,argument2,argument3,argument4,argument5,argument6);
	}
}

#define sk_armature_find_animation
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.animations);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_find_attachment
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.attachments);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_find_bone
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.bones);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_find_constraint
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.constraints);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_find_event
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.events);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_find_skin
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.skins);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_find_slot
/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.slots);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);

#define sk_armature_setToDefaultDisplay
/// @desc iterates through all slots and sets the default attachment for each
/// @param armature
var sk_slots = argument0[SK_ARMATURE.slots];
var sk_record_count = ds_list_size(sk_slots); 
var sk_record_id;
for(sk_record_id = 0; sk_record_id < sk_record_count; sk_record_id++){
	var sk_slot = sk_slots[| sk_record_id];
	switch(sk_struct_get_type(sk_slot)){
		case sk_type_slot: sk_slot_setToDefaultDisplay(sk_slot); break;
		case sk_type_symbol: sk_symbol_setToDefaultDisplay(sk_slot); break;
	}
}

#define sk_armature_setToDefaultSkin
/// @desc sets the default skin (if it exists)
/// @param armature
var sk_slots = argument0[SK_ARMATURE.slots];
// clear ALL slot attachments
var sk_slot_count = ds_list_size(sk_slots);
for(var sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
	var sk_slot = sk_slots[| sk_slot_id];
	switch(sk_struct_get_type(sk_slot)){
		case sk_type_slot: sk_slot_clear_attachments(sk_slot); break;
		case sk_type_symbol: sk_slot_clear_attachments(sk_symbol_get_nested_slot(sk_slot)); break;
	}
}
// set default skin
sk_skin_apply(sk_armature_default_skin(argument0),false);
// set default attachments for all slots
sk_armature_setToDefaultDisplay(argument0);

#define sk_armature_setToSetupPose
/// @desc sets the local transforms of the bones, slots, and constraints
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
var sk_drawOrder = argument0[SK_ARMATURE.drawOrderFinal];
ds_list_copy(sk_drawOrder,argument0[SK_ARMATURE.drawOrder]);
// set bones to setup pose
for(var sk_update_item_id = 0, sk_update_item_count = ds_list_size(sk_updateOrder); sk_update_item_id < sk_update_item_count; sk_update_item_id++){
	var sk_update_item = sk_updateOrder[| sk_update_item_id];
	var sk_setup_script = sk_struct_get_setup_script(sk_update_item);
	if(sk_setup_script!=-1){
		script_execute(sk_setup_script,sk_update_item);
	}
}
// set slots to setup pose
for(var sk_update_item_id = 0, sk_update_item_count = ds_list_size(sk_drawOrder); sk_update_item_id < sk_update_item_count; sk_update_item_id++){
	var sk_update_item = sk_drawOrder[| sk_update_item_id];
	var sk_setup_script = sk_struct_get_setup_script(sk_update_item);
	if(sk_setup_script!=-1){
		script_execute(sk_setup_script,sk_update_item);
	}
}

#define sk_armature_updateCache
/// @desc Caches information about bones, slots, and constraints.
///		| THIS MUST BE CALLED IN THE FOLLOWING CASES:
///		| * Changes to the bone hierarchy (changing a parent, this may not apply to slots, but be aware and call this just incase)
///		| * Changes to the default draw order (deleting or adding a slot)
///		| * Changes to a constraint data sets, such as changing the end effector of an IKConstraint
///		| * New bones, slots, or constraints are created or removed from the armature
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
var sk_drawOrder = argument0[SK_ARMATURE.drawOrder];
var sk_bones = argument0[SK_ARMATURE.bones];
var sk_slots = argument0[SK_ARMATURE.slots];
var sk_constraints = argument0[SK_ARMATURE.constraints];
// clear previous cache
ds_list_clear(sk_updateOrder);
ds_list_clear(sk_drawOrder);
// sort constraints
var sk_constraint_count = ds_list_size(sk_constraints);
for(var sk_constraint_id = 0; sk_constraint_id < sk_constraint_count; sk_constraint_id++){
	var sk_constraint = sk_constraints[| sk_constraint_id];
	switch(sk_struct_get_type(sk_constraint)){
		case sk_type_constraint_ik: sk_list_sort_constraint_ik(sk_updateOrder,sk_constraint); break;
		case sk_type_constraint_transform: sk_list_sort_constraint_transform(sk_updateOrder,sk_constraint); break;
		case sk_type_constraint_hierarchy: sk_list_sort_constraint_hierarchy(sk_updateOrder,sk_constraint); break;
		case sk_type_constraint_physics: sk_list_sort_constraint_physics(sk_updateOrder,sk_constraint); break;
	}
}
// sort remaining bones
var sk_bone_count = ds_list_size(sk_bones);
for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
	sk_list_sort_bone(sk_updateOrder,sk_bones[| sk_bone_id]);
}
// add slots to drawOrder
var sk_slot_count = ds_list_size(sk_slots);
for(var sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
	ds_list_add(sk_drawOrder,sk_slots[| sk_slot_id]);
}

#define sk_armature_updateWorldTransform
/// @descc applies FK and constraints to get the final world positions of the armature bones
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
for(var sk_update_item_id = 0, sk_update_item_count = ds_list_size(sk_updateOrder); sk_update_item_id < sk_update_item_count; sk_update_item_id++){
	var sk_update_item = sk_updateOrder[| sk_update_item_id];
	var sk_setup_script = sk_struct_get_apply_script(sk_update_item);
	if(sk_setup_script!=-1){
		script_execute(sk_setup_script,sk_update_item);
	}
}

#define sk_atlas_add_region
/// @desc adds a subtexture to the subtexture map
/// @param atlas
/// @param key
/// @param region
ds_map_add(argument0[SK_ATLAS.subTextureMap],argument1,argument2);

#define sk_atlas_build_dragonbones
/// @desc builds an atlas from dragonbones json format
/// @param json
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var db_atlas = json_decode(argument0);
if(ds_exists(db_atlas,ds_type_map)){
	var db_atlas_subtextures = db_atlas[? "SubTexture"];
	if(is_real(db_atlas_subtextures)&&ds_exists(db_atlas_subtextures,ds_type_list)&&(!ds_list_empty(db_atlas_subtextures))){
		var db_texture_width = db_atlas[? "width"];
        var db_texture_height = db_atlas[? "height"];
        if(is_real(db_texture_width)&&(db_texture_width>0)&&is_real(db_texture_height)&&(db_texture_height>0)){
			// build final structure
			var sk_atlas = sk_atlas_create(db_atlas[? "name"]);
			#region // transfer atlas texture data to new structure
			var db_subtex_count = ds_list_size(db_atlas_subtextures); var db_subtex_id;
			for(db_subtex_id = 0; db_subtex_id < db_subtex_count; db_subtex_id++){
				var db_subtex_record = db_atlas_subtextures[| db_subtex_id];
				if(is_real(db_subtex_record)&&ds_exists(db_subtex_record,ds_type_map)){
				    var sk_tex_name = string(db_subtex_record[? "name"]);
				    var sk_tex_x = real(db_subtex_record[? "x"]); // defaults to '0' if not real
					var sk_tex_y = real(db_subtex_record[? "y"]);
					var sk_tex_w = real(db_subtex_record[? "width"]);
					var sk_tex_h = real(db_subtex_record[? "height"]);
					var sk_tex_dxframe = real(db_subtex_record[? "frameX"]);
					var sk_tex_dyframe = real(db_subtex_record[? "frameY"]);
					var sk_tex_wframe = is_real(db_subtex_record[? "frameWidth"]) ? db_subtex_record[? "frameWidth"] : sk_tex_w;
					var sk_tex_hframe = is_real(db_subtex_record[? "frameHeight"]) ? db_subtex_record[? "frameHeight"] : sk_tex_h;
					// insert
					var sk_tex = sk_region_create(sk_tex_name);
					sk_region_set_uvs(
						sk_tex,
						sk_tex_x/db_texture_width,
						sk_tex_y/db_texture_height,
						(sk_tex_x+sk_tex_w)/db_texture_width,
						(sk_tex_y+sk_tex_h)/db_texture_height,
						(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
						(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
						sk_tex_w*sk_atlas_scale,
						sk_tex_h*sk_atlas_scale,
						0
					);
					sk_atlas_add_region(sk_atlas,sk_tex_name,sk_tex);
				}
			}
			#endregion
			// return final structure
			ds_map_destroy(db_atlas);
			// set page
			sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
			return sk_atlas;
        }
    }
	ds_map_destroy(db_atlas);
}
return noone;

#define sk_atlas_build_libgdx
/// @desc loads an atlas file
/// @param libgdx
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sp_atlas = file_text_open_from_string(string(argument0));
// search for header
while(file_text_read_string(sp_atlas)!=""){
	if(file_text_eof(sp_atlas)){
		// header not found
		file_text_close(sp_atlas);
		return noone;
	}
	file_text_readln(sp_atlas);
}
// get image name
var sp_name = "";
do{	// while the current line is not a statement, move to the next line
	file_text_readln(sp_atlas);
	if(file_text_eof(sp_atlas)){
		// name not found
		file_text_close(sp_atlas);
		return noone;
	}
	sp_name = file_text_read_string(sp_atlas);
}until(string_count(":",sp_name)<1)
// get max atlas size
var sp_size = "";
var sp_texture_width = 0;
var sp_texture_height = 0;
do{ // while the current line is a statement, move to the next line
	file_text_readln(sp_atlas);
	if(file_text_eof(sp_atlas)){
		// name not found
		file_text_close(sp_atlas);
		return noone;
	}
	sp_size = file_text_read_string(sp_atlas);
	if(string_count(":",sp_size)>0){
		var sp_delimiter = string_pos(":",sp_size);
		if(string_replace_all(string_copy(sp_size,0,sp_delimiter)," ","")=="size:"){
			var sp_size_vector = string_replace_all(string_copy(sp_size,sp_delimiter+1,string_length(sp_size)-sp_delimiter)," ","");
			if(string_count(",",sp_size)>0){
				var sp_vector_delimiter = string_pos(",",sp_size_vector);
				sp_texture_width = real(string_copy(sp_size_vector,0,sp_vector_delimiter-1));
				sp_texture_height = real(string_copy(sp_size_vector,sp_vector_delimiter+1,string_length(sp_size_vector)-sp_vector_delimiter));
			} else { // uniform size
				sp_texture_width = real(sp_size_vector);
				sp_texture_height = sp_texture_width;
			}
			break;
		}
	}
}until(false)
if((sp_texture_width<1)||(sp_texture_height<1)){
	// size is invalid
	file_text_close(sp_atlas);
	return noone;
}
// build atlas
var sk_atlas = sk_atlas_create(sp_name);
// add regions
var sk_current_exists = false;
var sk_current_name = "";
var sk_current_x = 0;
var sk_current_y = 0;
var sk_current_w = 0;
var sk_current_h = 0;
var sk_current_xframe = 0;
var sk_current_yframe = 0;
var sk_current_wframe = 0;
var sk_current_hframe = 0;
var sk_current_rotation = 0;
do{
	file_text_readln(sp_atlas);
	var sp_data = file_text_read_string(sp_atlas);
	if(file_text_eof(sp_atlas)||(sp_data=="")||(string_count(":",sp_data)<1)){
		// current line is a statement, apply current attributes to current region and add it to the atlas
		if(sk_current_exists){
			var sk_tex = sk_region_create(sk_current_name);
			var sk_tex_dx = (sk_current_rotation>45) ? sk_current_h : sk_current_w;
			var sk_tex_dy = (sk_current_rotation>45) ? sk_current_w : sk_current_h;
			sk_region_set_uvs(
				sk_tex,
				sk_current_x/sp_texture_width,
				sk_current_y/sp_texture_height,
				(sk_current_x+sk_tex_dx)/sp_texture_width,
				(sk_current_y+sk_tex_dy)/sp_texture_height,
				(sk_current_xframe+sk_current_wframe*0.5)*sk_atlas_scale,
				(sk_current_yframe+sk_current_hframe*0.5)*sk_atlas_scale,
				sk_current_w*sk_atlas_scale,
				sk_current_h*sk_atlas_scale,
				sk_current_rotation
			);
			sk_atlas_add_region(sk_atlas,sk_current_name,sk_tex);
			// reset attributes for next round
			sk_current_x = 0;
			sk_current_y = 0;
			sk_current_w = 0;
			sk_current_h = 0;
			sk_current_xframe = 0;
			sk_current_yframe = 0;
			sk_current_wframe = 0;
			sk_current_hframe = 0;
			sk_current_rotation = 0;
		} else {
			// set initialisation flag for first cycle
			sk_current_exists = true;
		}
		if(file_text_eof(sp_atlas)||(sp_data=="")){
			// end reached
			file_text_close(sp_atlas);
			break;
		} else {
			// set the next region's name
			sk_current_name = string(sp_data);
		}
	} else {
		// current line is a assignment, set the current attribute for future use
		var sp_delimiter = string_pos(":",sp_data);
		var sp_data_vector = string_replace_all(string_copy(sp_data,sp_delimiter+1,string_length(sp_data)-sp_delimiter)," ","");
		switch(string_replace_all(string_copy(sp_data,0,sp_delimiter)," ","")){
			case "rotate:":
				sk_current_rotation = (sp_data_vector=="true") ? 90 : 0;
				//show_message(sp_data_vector+" -> "+string(sp_data_vector=="true"));
			break;
			case "xy:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_x = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_y = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
			case "size:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_w = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_h = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
			case "orig:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_wframe = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_hframe = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
			case "offset:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_xframe = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_yframe = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
		}
	}
}until(false)
// set page
sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
return sk_atlas;

#define sk_atlas_build_spriter
/// @desc loads an atlas file
/// @param json
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sp_atlas = json_decode(argument0);
if(ds_exists(sp_atlas,ds_type_map)){
	var sp_atlas_frames = sp_atlas[? "frames"];
	var sp_atlas_metaData = sp_atlas[? "meta"];
	if(is_real(sp_atlas_frames)&&ds_exists(sp_atlas_frames,ds_type_list)&&(!ds_list_empty(sp_atlas_frames))
	&& is_real(sp_atlas_metaData)&&ds_exists(sp_atlas_metaData,ds_type_map)){
		var sp_texture_scale = sp_atlas_metaData[? "scale"];
		var sp_texture_size = sp_atlas_metaData[? "size"];
		if(is_real(sp_texture_size)&&ds_exists(sp_texture_size,ds_type_map)){
			var sp_texture_width = sp_texture_size[? "w"];
			var sp_texture_height = sp_texture_size[? "h"];
			if(is_real(sp_texture_width)&&(sp_texture_width>0)&&is_real(sp_texture_height)&&(sp_texture_height>0)){
				// build final structure
				var sk_atlas = sk_atlas_create(sp_atlas_metaData[? "image"]);
				#region // transfer atlas texture data to new structure
				var sp_subtex_count = ds_list_size(sp_atlas_frames); var sp_subtex_id;
				for(sp_subtex_id = 0; sp_subtex_id < sp_subtex_count; sp_subtex_id++){
					var sp_subtex_record = sp_atlas_frames[| sp_subtex_id];
					if(is_real(sp_subtex_record)&&ds_exists(sp_subtex_record,ds_type_map)){
						var sk_tex_path = string(sp_subtex_record[? "filename"]);
						var sk_tex_rotate = sp_subtex_record[? "rotated"]=="true";
						var sk_tex_x = 0;
						var sk_tex_y = 0;
						var sk_tex_w = 0;
						var sk_tex_h = 0;
						var sk_tex_dxframe = 0;
						var sk_tex_dyframe = 0;
						var sk_tex_wframe = 0;
						var sk_tex_hframe = 0;
						// get frame data
						var sp_subtex_frameData = sp_subtex_record[? "frame"];
						if(is_real(sp_subtex_frameData)&&ds_exists(sp_subtex_frameData,ds_type_map)){
							sk_tex_x = real(sp_subtex_frameData[? "x"]); // defaults to '0' if not real
							sk_tex_y = real(sp_subtex_frameData[? "y"]);
							sk_tex_w = real(sp_subtex_frameData[? "w"]);
							sk_tex_h = real(sp_subtex_frameData[? "h"]);
						}
						// get source offset
						var sp_subtex_sourceSpriteSize = sp_subtex_record[? "spriteSourceSize"];
						if(is_real(sp_subtex_sourceSpriteSize)&&ds_exists(sp_subtex_sourceSpriteSize,ds_type_map)){
							sk_tex_dxframe = -real(sp_subtex_sourceSpriteSize[? "x"]);
							sk_tex_dyframe = -real(sp_subtex_sourceSpriteSize[? "y"]);
						}
						// get source size
						var sp_subtex_sourceSize = sp_subtex_record[? "sourceSize"];
						if(is_real(sp_subtex_sourceSize)&&ds_exists(sp_subtex_sourceSize,ds_type_map)){
							sk_tex_wframe = real(sp_subtex_sourceSize[? "w"]);
							sk_tex_hframe = real(sp_subtex_sourceSize[? "h"]);
						}
						// insert
						var sk_tex = sk_region_create(sk_tex_path);
						var sk_tex_dx = sk_tex_rotate ? sk_tex_h : sk_tex_w;
						var sk_tex_dy = sk_tex_rotate ? sk_tex_w : sk_tex_h;
						sk_region_set_uvs(
							sk_tex,
							sk_tex_x/sp_texture_width,
							sk_tex_y/sp_texture_height,
							(sk_tex_x+sk_tex_dx)/sp_texture_width,
							(sk_tex_y+sk_tex_dy)/sp_texture_height,
							(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
							(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
							sk_tex_w*sk_atlas_scale,
							sk_tex_h*sk_atlas_scale,
							sk_tex_rotate*-90 /* rotate the UVs 90 degrees clockwise */
						);
						sk_atlas_add_region(sk_atlas,sk_tex_path,sk_tex);
					}
				}
				#endregion
				// return final structure
				ds_map_destroy(sp_atlas);
				// set page
				sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
				return sk_atlas;
			}
		}
	}
	ds_map_destroy(sp_atlas);
}
return noone;

#define sk_atlas_create
#macro sk_type_atlas sk_atlas_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ATLAS{
	texturePage,
	UV_left,UV_top,UV_right,UV_bottom,
	subTextureMap,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ATLAS.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_atlas,argument0,
	-1, // setup script
	-1, // apply script
	"sk_atlas_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_ATLAS.subTextureMap] = ds_map_create(); // create map for looking up region data
// set default property values
sk_atlas_set_page(sk_struct,-1,0);
// return to caller
return sk_struct;

#define sk_atlas_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// iterate through subtextures and dispose
	var sk_atlas_subtextures = argument0[SK_ATLAS.subTextureMap];
	var sk_region_count = ds_map_size(sk_atlas_subtextures);
	var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
	repeat(sk_region_count){
		var sk_region = sk_atlas_subtextures[? sk_region_key];
		if(sk_struct_exists(sk_region)){
			sk_struct_destroy(sk_region);
		}
		// goto to next region
		sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
	}
	// destroy dynamic data structures
	ds_map_destroy(sk_atlas_subtextures);
}

#define sk_atlas_draw_debug
#macro sk_debug_atlas_texture (1<<16)
#macro sk_debug_atlas_regions (1<<17)
#macro sk_debug_atlas_regionNames (1<<18)
#macro sk_debug_atlas_regionOrigins (1<<19)
/// @desc draws the atlas and its regions
///		| NOTE: if you are using a texture which has been cropped or is not a power of two, then it will be incorrectly represented...
///		|		this does not mean that your UVs are incorrect, it just means that what is displayed is inaccurate.
/// @param atlas
/// @param x
/// @param y
/// @param w
/// @param h
/// @param debugArgs
var sk_atlas_subtextures = argument0[SK_ATLAS.subTextureMap];
var sk_atlas_texture = argument0[SK_ATLAS.texturePage];
var sk_x1 = argument1;
var sk_y1 = argument2;
var sk_x2 = sk_x1+argument3;
var sk_y2 = sk_y1+argument4;
if(argument5&sk_debug_atlas_texture){
	// draw texture
	draw_primitive_begin_texture(pr_trianglestrip,sk_atlas_texture);
	draw_vertex_texture_colour(sk_x1,sk_y1,0,0,c_white,1);
	draw_vertex_texture_colour(sk_x1,sk_y2,0,1,c_white,1);
	draw_vertex_texture_colour(sk_x2,sk_y1,1,0,c_white,1);
	draw_vertex_texture_colour(sk_x2,sk_y2,1,1,c_white,1);
	draw_primitive_end();
}
// draw regions
var sk_region_count = ds_map_size(sk_atlas_subtextures);
var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
repeat(sk_region_count){
	var sk_region = sk_atlas_subtextures[? sk_region_key];
	if(sk_struct_isof(sk_region,sk_type_region)){
		// get positions
		var ULX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_ULX]);
		var ULY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_ULY]);
		var URX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_URX]);
		var URY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_URY]);
		var BLX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_BLX]);
		var BLY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_BLY]);
		var BRX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_BRX]);
		var BRY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_BRY]);
		// get origin
		var OX = lerp(ULX,BRX,sk_region[SK_REGION.ox]/max(sk_region[SK_REGION.width],1));
		var OY = lerp(ULY,BRY,sk_region[SK_REGION.oy]/max(sk_region[SK_REGION.height],1));
		// draw polygon
		draw_primitive_begin(pr_linelist);
		if(argument5&sk_debug_atlas_regions){
			draw_vertex_colour(BLX,BLY,c_blue,1); // left
			draw_vertex_colour(ULX,ULY,c_blue,1);
			draw_vertex_colour(ULX,ULY,c_yellow,1); // top
			draw_vertex_colour(URX,URY,c_yellow,1);
			draw_vertex_colour(BRX,BRY,c_blue,1); // right
			draw_vertex_colour(URX,URY,c_blue,1);
			draw_vertex_colour(BLX,BLY,c_blue,1); // bottom
			draw_vertex_colour(BRX,BRY,c_blue,1);
		}
		if(argument5&sk_debug_atlas_regionOrigins){
			draw_vertex_colour(ULX,ULY,c_green,1); // origin
			draw_vertex_colour(OX,OY,c_green,1);
		}
		draw_primitive_end();
		if(argument5&sk_debug_atlas_regionNames){
			draw_text(OX,OY,sk_struct_get_name(sk_region));
		}
	}
	sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
}

#define sk_atlas_find_region
/// @desc adds a subtexture to the subtexture map
/// @param atlas
/// @param key
return ds_map_find_value(argument0[SK_ATLAS.subTextureMap],argument1);

#define sk_atlas_get_texture
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param atlas
return argument0[SK_ATLAS.texturePage];

#define sk_atlas_set_page
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

#define sk_attachment_create_plane
#macro sk_type_attachment_plane sk_attachment_create_plane /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ATTACHMENT_PLANE{
	regionName,
	X,Y,m00,m01,m10,m11,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param regionName
var sk_struct = array_create(SK_ATTACHMENT_PLANE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_attachment_plane,argument0,
	-1, // setup script
	-1, // apply script
	"sk_attachment_destroy_plane" // destruction script
);
// set default property values
sk_attachment_plane_set_regionName(sk_struct,argument1);
sk_attachment_plane_set_matrix(sk_struct,0,0,1,1,0,0,0);
// return to caller
return sk_struct;

#define sk_attachment_create_point
#macro sk_type_attachment_point sk_attachment_create_point /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_ATTACHMENT_POINT{
	X,Y,rotation,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_ATTACHMENT_POINT.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_attachment_point,argument0,
	-1, // setup script
	-1, // apply script
	"sk_attachment_destroy_point" // destruction script
);
// set default property values
sk_attachment_point_set_offsets(sk_struct,0,0,0);
// return to caller
return sk_struct;

#define sk_attachment_destroy_plane
/// @desc deletes the supplied structure and unhooks its array
/// @param attachment
if(array_unhook_sk_structure(argument0)){
	// nothin'
}

#define sk_attachment_destroy_point
/// @desc deletes the supplied structure and unhooks its array
/// @param attachment
if(array_unhook_sk_structure(argument0)){
	// nothin'
}

#define sk_attachment_plane_get_regionName
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param attachment
return argument0[SK_ATTACHMENT_PLANE.regionName];

#define sk_attachment_plane_set_matrix
gml_pragma("forceinline");
/// @desc sets a property
/// @param attachment
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
argument0[@ SK_ATTACHMENT_PLANE.X] = real(argument1);
argument0[@ SK_ATTACHMENT_PLANE.Y] = real(argument2);
var sk_xscale = is_real(argument3) ? argument3 : 1;
var sk_yscale = is_real(argument4) ? argument4 : 1;
var sk_rotation = real(argument7);
var sk_rotationX = sk_rotation+real(argument5);
var sk_rotationY = sk_rotation+real(argument6)+90;
argument0[@ SK_ATTACHMENT_PLANE.m00] = dcos(sk_rotationX)*sk_xscale;
argument0[@ SK_ATTACHMENT_PLANE.m01] = -dsin(sk_rotationX)*sk_xscale;
argument0[@ SK_ATTACHMENT_PLANE.m10] = dcos(sk_rotationY)*-sk_yscale;
argument0[@ SK_ATTACHMENT_PLANE.m11] = -dsin(sk_rotationY)*-sk_yscale;

#define sk_attachment_plane_set_regionName
gml_pragma("forceinline");
/// @desc sets a property
/// @param attachment
/// @param name
argument0[@ SK_ATTACHMENT_PLANE.regionName] = argument1;

#define sk_attachment_point_computeWorldPosition
/// @desc computes the world position of the attachment using the supplied bone
/// @param attachment
/// @param bone
var sk_x = argument0[SK_ATTACHMENT_POINT.X];
var sk_y = argument0[SK_ATTACHMENT_POINT.Y];
return[
	sk_bone_transform_position_x(argument1,sk_x,sk_y),
	sk_bone_transform_position_y(argument1,sk_x,sk_y)
];

#define sk_attachment_point_computeWorldRotation
/// @desc computes the world rotation of the attachment using the supplied bone
/// @param attachment
/// @param bone
return sk_bone_transform_rotation(argument1,argument0[SK_ATTACHMENT_POINT.rotation]);

#define sk_attachment_point_get_rotation
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param attachment
return argument0[SK_ATTACHMENT_POINT.rotation];

#define sk_attachment_point_get_x
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param attachment
return argument0[SK_ATTACHMENT_POINT.X];

#define sk_attachment_point_get_y
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param attachment
return argument0[SK_ATTACHMENT_POINT.Y];

#define sk_attachment_point_set_offsets
/// @desc sets the offsets of the point attachment
/// @param attachment
/// @param x
/// @param y
/// @param rotation
argument0[@ SK_ATTACHMENT_POINT.X] = real(argument1);
argument0[@ SK_ATTACHMENT_POINT.Y] = real(argument2);
argument0[@ SK_ATTACHMENT_POINT.rotation] = -angle_difference(0,real(argument3));

#define sk_bezier_aproximateCurve
#macro sk_tweenEasing_none "noTween"
#macro sk_tweenEasing_linear "linearTween"
#macro sk_tweenEasing_easeIn "easeInTween"
#macro sk_tweenEasing_easeOut "easeOutTween"
#macro sk_tweenEasing_smoothstep "SmoothTween"
#macro sk_tweenEasing_smoothstepI "SmoothTweenInverse"
/// @desc aproximates a bezier curve
/// @param x1
/// @param y1
/// @param x2
/// @param y2
var sk_x1 = clamp(argument0,0,1)+1; // clamping values between 0 and 1, then shifting up by 1 confirms all gradients are defined (no divide by zero or negative cases)
var sk_y1 = clamp(argument1,0,1)+1;
var sk_x2 = clamp(argument2,0,1)+1;
var sk_y2 = clamp(argument3,0,1)+1;

var sk_g1 = sk_x1/sk_y1;
var sk_g2 = sk_x2/sk_y2;

//show_message(string(sk_x1)+"/"+string(sk_y1)+"="+string(sk_g1));

if(abs(sk_g1-1)<0.01){
	// either easing in, out, or the interpolation is linear
	if(abs(sk_g2-1)<0.01){
		return sk_tweenEasing_linear;
	} else if(sk_g2>1){
		return sk_tweenEasing_easeIn;
	} else {
		return sk_tweenEasing_easeOut;
	}
} else if(sk_g1>1){
	// either smoothstep, or easing in
	if( (abs(sk_g2-1)<0.01)||(sk_g2>1) ){
		return sk_tweenEasing_easeIn;
	} else {
		return sk_tweenEasing_smoothstep;
	}
} else {
	// either inverse smoothstep, or easing out
	if( (abs(sk_g2-1)<0.01)||(sk_g2<1) ){
		return sk_tweenEasing_easeOut;
	} else {
		return sk_tweenEasing_smoothstepI;
	}
}

#define sk_bone_create
#macro sk_type_bone sk_bone_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_BONE{
	parent,length,transformMode,
	X,Y,XScale,YScale,XShear,YShear,rotation,
	XApplied,YApplied,XScaleApplied,YScaleApplied,XShearApplied,YShearApplied,rotationApplied,
	XWorld,YWorld,m00,m01,m10,m11,badApplied,transformModeCorrected,
	sizeof
}
#macro sk_transformMode_scale (1<<0)
#macro sk_transformMode_rotate (1<<1)
#macro sk_transformMode_translate (1<<2) /* translate, skew, and reflection are passive flags meaning they are not required */
#macro sk_transformMode_skew (1<<3) /* skewing transforms are a type of scale inheritance (not to be confused with shear transforms) */
#macro sk_transformMode_normal (sk_transformMode_scale|sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noRotation (sk_transformMode_scale|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScale (sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScaleOrRotation (sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_none 0
#macro sk_transformMode_ex_spriter (sk_transformMode_normal&(~sk_transformMode_skew)) /* spriter specific transformMode */
/// @desc creates a new structure and returns its reference
/// @param name
/// @param parent
var sk_struct = array_create(SK_BONE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_bone,argument0,
	"sk_bone_setToSetupPose", // setup script
	"sk_bone_updateWorldTransform", // apply script
	"sk_bone_destroy" // destruction script
);
// set default property values
sk_bone_set_parent(sk_struct,argument1);
sk_bone_set_length(sk_struct,100);
sk_bone_set_transformMode(sk_struct,sk_transformMode_normal);
sk_bone_set_position(sk_struct,0,0);
sk_bone_set_scale(sk_struct,1,1);
sk_bone_set_shear(sk_struct,0,0);
sk_bone_set_rotation(sk_struct,0);
// apply transforms
sk_bone_setToSetupPose(sk_struct);
sk_bone_updateWorldTransform(sk_struct);
// return to caller
return sk_struct;

#define sk_bone_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param bone
if(array_unhook_sk_structure(argument0)){
	// nothin'
}

#define sk_bone_draw_debug
#macro sk_debug_bones (1<<0)
#macro sk_debug_boneInheritance (1<<1)
#macro sk_debug_simpleBones (1<<2)
#macro sk_debug_boneNames (1<<3)
#macro sk_debug_boneVectors (1<<4)
#macro sk_debug_boneBad (1<<5)
#macro sk_debug_boneStructure (sk_debug_bones|sk_debug_boneInheritance|sk_debug_boneVectors)
#macro sk_debug_boneData (sk_debug_boneNames|sk_debug_boneBad)
/// @desc renders an abstract structure representing the bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_bone = argument0;
var sk_draw_x = argument1;
var sk_draw_y = argument2;
var sk_draw_xscale = argument3;
var sk_draw_yscale = argument4;
var sk_draw_rot = argument5;
var sk_draw_sine = (sk_draw_rot==0) ? 0 : dsin(sk_draw_rot);
var sk_draw_cosine = (sk_draw_rot==0) ? 1 : dcos(sk_draw_rot);
// transform by global scale
var sk_bone_xlocal = sk_bone[SK_BONE.XWorld]*sk_draw_xscale;
var sk_bone_ylocal = sk_bone[SK_BONE.YWorld]*sk_draw_yscale;
var sk_bone_m00 = sk_bone[SK_BONE.m00]*sk_draw_xscale; // x component of x
var sk_bone_m01 = sk_bone[SK_BONE.m01]*sk_draw_yscale; // y component of x
var sk_bone_m10 = sk_bone[SK_BONE.m10]*sk_draw_xscale; // x component of y
var sk_bone_m11 = sk_bone[SK_BONE.m11]*sk_draw_yscale; // y component of y
// transform by global rotation
var sk_bone_xworld = sk_draw_x+sk_bone_xlocal*sk_draw_cosine+sk_bone_ylocal*sk_draw_sine;
var sk_bone_yworld = sk_draw_y-sk_bone_xlocal*sk_draw_sine+sk_bone_ylocal*sk_draw_cosine;
var sk_bone_w00 = (sk_bone_m00*sk_draw_cosine)+(sk_bone_m01*sk_draw_sine);
var sk_bone_w01 = (sk_bone_m00*-sk_draw_sine)+(sk_bone_m01*sk_draw_cosine);
var sk_bone_w10 = (sk_bone_m10*sk_draw_cosine)+(sk_bone_m11*sk_draw_sine);
var sk_bone_w11 = (sk_bone_m10*-sk_draw_sine)+(sk_bone_m11*sk_draw_cosine);
// start primitive
draw_primitive_begin(pr_linelist);
var V_COLOUR = c_black;
var V_ALPHA = 1;
if(argument6&sk_debug_bones){
	V_COLOUR = $00ff00;
	var sk_bone_len = max(sk_bone[SK_BONE.length],1);
	var sk_bone_width = max(sk_bone_len,5)*0.05;
	// draw a bone in its familiar shape
	var sk_bone_xlen = sk_bone_xworld+sk_bone_w00*sk_bone_len;
	var sk_bone_ylen = sk_bone_yworld+sk_bone_w01*sk_bone_len;
	if(argument6&sk_debug_simpleBones){
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xlen,sk_bone_ylen,V_COLOUR,V_ALPHA);
	} else {
		var sk_bone_xpositive = sk_bone_xworld+sk_bone_w00*sk_bone_len*0.2+sk_bone_w10*sk_bone_width;
		var sk_bone_ypositive = sk_bone_yworld+sk_bone_w01*sk_bone_len*0.2+sk_bone_w11*sk_bone_width;
		var sk_bone_xnegative = sk_bone_xworld+sk_bone_w00*sk_bone_len*0.2-sk_bone_w10*sk_bone_width;
		var sk_bone_ynegative = sk_bone_yworld+sk_bone_w01*sk_bone_len*0.2-sk_bone_w11*sk_bone_width;
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xpositive,sk_bone_ypositive,V_COLOUR,V_ALPHA); // #1
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xnegative,sk_bone_ynegative,V_COLOUR,V_ALPHA); // #2
		draw_vertex_colour(sk_bone_xpositive,sk_bone_ypositive,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xlen,sk_bone_ylen,V_COLOUR,V_ALPHA); // #3
		draw_vertex_colour(sk_bone_xnegative,sk_bone_ynegative,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xlen,sk_bone_ylen,V_COLOUR,V_ALPHA); // #4
	}
}
if(argument6&sk_debug_boneInheritance){
	V_COLOUR = $ff00ff;
	var sk_parentData = sk_bone[SK_BONE.parent];
	if(sk_struct_isof(sk_parentData,sk_type_bone)){
		// get parent bone transforms
		var sk_parent_xlocal = sk_parentData[SK_BONE.XWorld]*sk_draw_xscale;
		var sk_parent_ylocal = sk_parentData[SK_BONE.YWorld]*sk_draw_yscale;
		var sk_parent_m00 = sk_parentData[SK_BONE.m00]*sk_draw_xscale; // x component of x
		var sk_parent_m01 = sk_parentData[SK_BONE.m01]*sk_draw_yscale; // y component of x
	/*	var sk_parent_m10 = sk_parentData[SK_BONE.m10]*sk_draw_xscale; // x component of y // not required
		var sk_parent_m11 = sk_parentData[SK_BONE.m11]*sk_draw_yscale; // y component of y	*/
		// transform by global rotation
		var sk_parent_xworld = sk_draw_x+sk_parent_xlocal*sk_draw_cosine+sk_parent_ylocal*sk_draw_sine;
		var sk_parent_yworld = sk_draw_y-sk_parent_xlocal*sk_draw_sine+sk_parent_ylocal*sk_draw_cosine;
		var sk_parent_w00 = (sk_parent_m00*sk_draw_cosine)+(sk_parent_m01*sk_draw_sine);
		var sk_parent_w01 = (sk_parent_m00*-sk_draw_sine)+(sk_parent_m01*sk_draw_cosine);
	/*	var sk_parent_w10 = (sk_parent_m10*sk_draw_cosine)+(sk_parent_m11*sk_draw_sine); // not required
		var sk_parent_w11 = (sk_parent_m10*-sk_draw_sine)+(sk_parent_m11*sk_draw_cosine);	*/
		var sk_parent_length = max(sk_parentData[SK_BONE.length],1);
		draw_vertex_colour(sk_parent_xworld+sk_parent_w00*sk_parent_length,sk_parent_yworld+sk_parent_w01*sk_parent_length,V_COLOUR,V_ALPHA);
		draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
	}
}
V_COLOUR = $ffffff;
var sk_bone_len = max(sk_bone[SK_BONE.length],1);
var sk_bone_xtext = sk_bone_xworld+sk_bone_w00*sk_bone_len*0.5;
var sk_bone_ytext = sk_bone_yworld+sk_bone_w01*sk_bone_len*0.5;
if(argument6&sk_debug_boneNames){	
	draw_text(sk_bone_xtext,sk_bone_ytext,sk_struct_get_name(sk_bone));
}
if(argument6&sk_debug_boneBad){
	draw_text(sk_bone_xtext,sk_bone_ytext+10,sk_bone[SK_BONE.badApplied]);
}
if(argument6&sk_debug_boneVectors){
	var unit = max(sk_bone[SK_BONE.length]*0.5,1);
	V_COLOUR = $0000ff;
	draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
	draw_vertex_colour(sk_bone_xworld+sk_bone_w00*unit,sk_bone_yworld+sk_bone_w01*unit,V_COLOUR,V_ALPHA);
	V_COLOUR = $ff0000;
	draw_vertex_colour(sk_bone_xworld,sk_bone_yworld,V_COLOUR,V_ALPHA);
	draw_vertex_colour(sk_bone_xworld+sk_bone_w10*unit,sk_bone_yworld+sk_bone_w11*unit,V_COLOUR,V_ALPHA);
}
draw_primitive_end();

#define sk_bone_get_length
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.length];

#define sk_bone_get_parent
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.parent];

#define sk_bone_get_rotation
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.rotation];

#define sk_bone_get_rotation_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.rotationApplied];

#define sk_bone_get_rotation_world
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return -darctan2(argument0[SK_BONE.m01],argument0[SK_BONE.m00]);

#define sk_bone_get_transformMode
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.transformMode];

#define sk_bone_get_world_matrix
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return [
	argument0[SK_BONE.m00],argument0[SK_BONE.m01],0,0,
	argument0[SK_BONE.m10],argument0[SK_BONE.m11],0,0,
	0,0,1,0,
	0,0,0,1
];

#define sk_bone_get_x
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.X];

#define sk_bone_get_xscale
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XScale];

#define sk_bone_get_xscale_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XScaleApplied];

#define sk_bone_get_xscale_world
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return point_distance(0,0,argument0[SK_BONE.m00],argument0[SK_BONE.m01]);

#define sk_bone_get_xshear
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XShear];

#define sk_bone_get_xshear_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XShearApplied];

#define sk_bone_get_x_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XApplied];

#define sk_bone_get_x_world
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XWorld];

#define sk_bone_get_y
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.Y];

#define sk_bone_get_yscale
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.YScale];

#define sk_bone_get_yscale_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.YScaleApplied];

#define sk_bone_get_yscale_world
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return point_distance(0,0,argument0[SK_BONE.m10],argument0[SK_BONE.m11]);

#define sk_bone_get_yshear
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.YShear];

#define sk_bone_get_yshear_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.YShearApplied];

#define sk_bone_get_y_applied
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.YApplied];

#define sk_bone_get_y_world
gml_pragma("forceinline");
/// @desc gets a property
/// @param bone
return argument0[SK_BONE.XWorld];

#define sk_bone_setToSetupPose
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied bone
/// @param bone
argument0[@ SK_BONE.XApplied] = argument0[SK_BONE.X];
argument0[@ SK_BONE.YApplied] = argument0[SK_BONE.Y];
argument0[@ SK_BONE.XScaleApplied] = argument0[SK_BONE.XScale];
argument0[@ SK_BONE.YScaleApplied] = argument0[SK_BONE.YScale];
argument0[@ SK_BONE.XShearApplied] = argument0[SK_BONE.XShear];
argument0[@ SK_BONE.YShearApplied] = argument0[SK_BONE.YShear];
argument0[@ SK_BONE.rotationApplied] = argument0[SK_BONE.rotation];
argument0[@ SK_BONE.badApplied] = false;
argument0[@ SK_BONE.transformModeCorrected] = argument0[SK_BONE.transformMode];

#define sk_bone_set_length
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param length
argument0[@ SK_BONE.length] = max(real(argument1),1);

#define sk_bone_set_parent
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param length
argument0[@ SK_BONE.parent] = argument1;

#define sk_bone_set_position
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param x
/// @param y
argument0[@ SK_BONE.X] = real(argument1);
argument0[@ SK_BONE.Y] = real(argument2);

#define sk_bone_set_position_applied
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param x
/// @param y
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.XApplied] = real(argument1);
argument0[@ SK_BONE.YApplied] = real(argument2);

#define sk_bone_set_position_world
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param x
/// @param y
argument0[@ SK_BONE.XWorld] = real(argument1);
argument0[@ SK_BONE.YWorld] = real(argument2);

#define sk_bone_set_rotation
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param angle
argument0[@ SK_BONE.rotation] = -angle_difference(0,real(argument1));

#define sk_bone_set_rotation_applied
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param angle
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.rotationApplied] = -angle_difference(0,real(argument1));

#define sk_bone_set_scale
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xscale
/// @param yscale
argument0[@ SK_BONE.XScale] = is_real(argument1) ? argument1 : 1;
argument0[@ SK_BONE.YScale] = is_real(argument2) ? argument2 : 1;

#define sk_bone_set_scale_applied
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xscale
/// @param yscale
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.XScaleApplied] = is_real(argument1) ? argument1 : 1;
argument0[@ SK_BONE.YScaleApplied] = is_real(argument2) ? argument2 : 1;

#define sk_bone_set_shear
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xshear
/// @param yshear
argument0[@ SK_BONE.XShear] = -angle_difference(0,real(argument1));
argument0[@ SK_BONE.YShear] = -angle_difference(0,real(argument2));

#define sk_bone_set_shear_applied
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param xshear
/// @param yshear
argument0[@ SK_BONE.badApplied] = true; // update applied flag
argument0[@ SK_BONE.XShearApplied] = -angle_difference(0,real(argument1));
argument0[@ SK_BONE.YShearApplied] = -angle_difference(0,real(argument2));

#define sk_bone_set_transformMode
gml_pragma("forceinline");
/// @desc sets a property
/// @param bone
/// @param transformMode
argument0[@ SK_BONE.transformMode] = argument1;

#define sk_bone_transform_position_x
/// @desc takes a 2d vector and transforms it
/// @param bone
/// @param x
/// @param y
var sk_dx = argument1;
var sk_dy = argument2;
var sk_pa = argument0[SK_BONE.m00];
var sk_pc = argument0[SK_BONE.m10];
return argument1[SK_BONE.XWorld]+sk_pa*sk_dx+sk_pc*sk_dy;

#define sk_bone_transform_position_y
/// @desc takes a 2d vector and transforms it
/// @param bone
/// @param x
/// @param y
var sk_dx = argument1;
var sk_dy = argument2;
var sk_pb = argument0[SK_BONE.m01];
var sk_pd = argument0[SK_BONE.m11];
return argument0[SK_BONE.YWorld]+sk_pb*sk_dx+sk_pd*sk_dy;

#define sk_bone_transform_rotation
/// @desc converts direction into a vector and transforms it
/// @param bone
/// @param angle
var sk_dr = argument1;
var sk_pa = argument0[SK_BONE.m00];
var sk_pb = argument0[SK_BONE.m01];
var sk_pc = argument0[SK_BONE.m10];
var sk_pd = argument0[SK_BONE.m11];
var sk_a = dcos(sk_dr);
var sk_b = -dsin(sk_dr);
return -darctan2((sk_pb*sk_a)+(sk_pd*sk_b),(sk_pa*sk_a)+(sk_pc*sk_b));

#define sk_bone_updateAppliedTransform
/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
var sk_mx = argument0[SK_BONE.XWorld];
var sk_my = argument0[SK_BONE.YWorld];
var sk_m00 = argument0[SK_BONE.m00];
var sk_m01 = argument0[SK_BONE.m01];
var sk_m10 = argument0[SK_BONE.m10];
var sk_m11 = argument0[SK_BONE.m11];
var sk_parent = argument0[SK_BONE.parent];
if(sk_struct_isof(sk_parent,sk_type_bone)){
	// calculate the parent's inverse rotation matrix
	var sk_parent_m00 = sk_parent[SK_BONE.m00];
	var sk_parent_m01 = sk_parent[SK_BONE.m01];
	var sk_parent_m10 = sk_parent[SK_BONE.m10];
	var sk_parent_m11 = sk_parent[SK_BONE.m11];
	var sk_determinant = sk_parent_m00*sk_parent_m11 - sk_parent_m01*sk_parent_m10;
	if(abs(sk_determinant)<0.001){
		// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
		return;
	}
	sk_determinant = 1/sk_determinant;
	var sk_im00 = sk_parent_m11*sk_determinant;
	var sk_im01 = -sk_parent_m01*sk_determinant;
	var sk_im10 = -sk_parent_m10*sk_determinant;
	var sk_im11 = sk_parent_m00*sk_determinant;
	// multiply inverse matrix by child matrix to get local transformation matrix
	var sk_xx = sk_mx - sk_parent[SK_BONE.XWorld];
	var sk_yy = sk_my - sk_parent[SK_BONE.YWorld];
	var sk_a = sk_m00;	var sk_b = sk_m01;
	var sk_c = sk_m10;	var sk_d = sk_m11;
	sk_mx = sk_im00*sk_xx+sk_im10*sk_yy;
	sk_my = sk_im01*sk_xx+sk_im11*sk_yy;
	sk_m00 = sk_im00*sk_a+sk_im10*sk_b;
	sk_m01 = sk_im01*sk_a+sk_im11*sk_b;
	sk_m10 = sk_im00*sk_c+sk_im10*sk_d;
	sk_m11 = sk_im01*sk_c+sk_im11*sk_d;
}
argument0[@ SK_BONE.XApplied] = sk_mx;
argument0[@ SK_BONE.YApplied] = sk_my;
argument0[@ SK_BONE.XScaleApplied] = point_distance(0,0,sk_m00,sk_m01);
argument0[@ SK_BONE.YScaleApplied] = point_distance(0,0,sk_m10,sk_m11);
var sk_rotation = -darctan2(sk_m01,sk_m00);
argument0[@ SK_BONE.XShearApplied] = 0;
argument0[@ SK_BONE.YShearApplied] = angle_difference(-darctan2(sk_m11,sk_m10),sk_rotation-90);
argument0[@ SK_BONE.rotationApplied] = sk_rotation;
// bad applied transform has been corrected
argument0[@ SK_BONE.badApplied] = false;
// set the corrected transformMode to "normal"
argument0[@ SK_BONE.transformModeCorrected] = sk_transformMode_normal;

#define sk_bone_updateAppliedTransform_other
gml_pragma("forceinline");
/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[SK_BONE.parent];
// set temporary parent
argument0[@ SK_BONE.parent] = argument1;
// get applied transform relative to new bone
sk_bone_updateAppliedTransform(argument0);
// revert parent
argument0[@ SK_BONE.parent] = sk_parent;
// set to bad applied since the parent changed
argument0[@ SK_BONE.badApplied] = true;

#define sk_bone_updateWorldTransform
gml_pragma("global",@'
	global.sk_globalVar_skeletonFlag_flipX = false;
	global.sk_globalVar_skeletonFlag_flipY = false;
');
#macro sk_global_flipX global.sk_globalVar_skeletonFlag_flipX
#macro sk_global_flipY global.sk_globalVar_skeletonFlag_flipY
/// @desc update world transform of supplied bone
/// @param bone
var sk_bone = argument0;
var sk_x = sk_bone[SK_BONE.XApplied];
var sk_y = sk_bone[SK_BONE.YApplied];
var sk_xscale = sk_bone[SK_BONE.XScaleApplied];
var sk_yscale = sk_bone[SK_BONE.YScaleApplied];
var sk_xshear = sk_bone[SK_BONE.XShearApplied];
var sk_yshear = sk_bone[SK_BONE.YShearApplied];
var sk_rotation = sk_bone[SK_BONE.rotationApplied];
var sk_transform = sk_bone[SK_BONE.transformModeCorrected];
// get parent data
var sk_parent = sk_bone[SK_BONE.parent];
if(!sk_struct_isof(sk_parent,sk_type_bone)){
	// parent does not exist
	var sk_rotationX = sk_rotation+sk_xshear;
	var sk_rotationY = sk_rotation+sk_yshear+90;
	// set world matrix
	var sk_a = dcos(sk_rotationX)*sk_xscale;
	var sk_b = -dsin(sk_rotationX)*sk_xscale;
	var sk_c = dcos(sk_rotationY)*-sk_yscale;
	var sk_d = -dsin(sk_rotationY)*-sk_yscale;
	// set global flip
	if(sk_global_flipX){
		sk_x = -sk_x;
		sk_a = -sk_a;
		sk_c = -sk_c;
	}
	if(sk_global_flipY){
		sk_y = -sk_y;
		sk_b = -sk_b;
		sk_d = -sk_d;
	}
	// set transforms
	sk_bone[@ SK_BONE.m00] = sk_a;
	sk_bone[@ SK_BONE.m01] = sk_b;
	sk_bone[@ SK_BONE.m10] = sk_c;
	sk_bone[@ SK_BONE.m11] = sk_d;
	sk_bone[@ SK_BONE.XWorld] = sk_x;
	sk_bone[@ SK_BONE.YWorld] = sk_y;
	sk_bone[@ SK_BONE.badApplied] = false;
	return;
}
// get parent matrix
var sk_pa = sk_parent[SK_BONE.m00];
var sk_pb = sk_parent[SK_BONE.m01];
var sk_pc = sk_parent[SK_BONE.m10];
var sk_pd = sk_parent[SK_BONE.m11];
// calculate translation transforms
if(sk_transform&sk_transformMode_translate){
	// inherit translation
	sk_bone[@ SK_BONE.XWorld] = sk_parent[SK_BONE.XWorld] + sk_pa*sk_x+sk_pc*sk_y;
	sk_bone[@ SK_BONE.YWorld] = sk_parent[SK_BONE.YWorld] + sk_pb*sk_x+sk_pd*sk_y;
} else {
	// don't inherit translation
	if(sk_global_flipX){	sk_x = -sk_x;	}
	if(sk_global_flipY){	sk_y = -sk_y;	}
	sk_bone[@ SK_BONE.XWorld] = sk_x;
	sk_bone[@ SK_BONE.YWorld] = sk_y;
}
sk_transform &= ~sk_transformMode_translate; // disable translation in transform mode
// correct skew transforms
var sk_skew = sk_transform&sk_transformMode_skew;
if(!sk_skew){
	if(sk_transform&sk_transformMode_scale){ // non skewing transforms (scales are multiplied)
		// multiply current applied scale by parent scale
		sk_transform &= ~sk_transformMode_scale;
		sk_xscale *= point_distance(0,0,sk_pa,sk_pb);
		sk_yscale *= point_distance(0,0,sk_pc,sk_pd);
		if(sk_pa*sk_pd-sk_pb*sk_pc < 0){
			// (?)spriter compatibility(?)
			sk_yscale = -sk_yscale;
			sk_rotation = -sk_rotation;
		}
	}
}
sk_transform &= ~sk_transformMode_skew; // disable skewing in transform mode
// calculate matrix transforms
switch(sk_transform){
	case sk_transformMode_scale|sk_transformMode_rotate:
		var sk_rotationX = sk_rotation+sk_xshear;
		var sk_rotationY = sk_rotation+sk_yshear+90;
		var sk_a = dcos(sk_rotationX)*sk_xscale;
		var sk_b = -dsin(sk_rotationX)*sk_xscale;
		var sk_c = dcos(sk_rotationY)*-sk_yscale;
		var sk_d = -dsin(sk_rotationY)*-sk_yscale;
		sk_bone[@ SK_BONE.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
		sk_bone[@ SK_BONE.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
		sk_bone[@ SK_BONE.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
		sk_bone[@ SK_BONE.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
	break;
	case sk_transformMode_rotate:
		// same as normal, but cancel out scale
		var sk_rotation_final;
		if(sk_skew){
			var sk_cosine = dcos(sk_rotation);
			var sk_sine = -dsin(sk_rotation);
			sk_rotation_final = -darctan2( (sk_pb*sk_cosine)+(sk_pd*sk_sine), (sk_pa*sk_cosine)+(sk_pc*sk_sine) );
		} else {
			sk_rotation_final = sk_rotation-darctan2(sk_pb,sk_pa);
		}
		var sk_rotationX = sk_rotation_final+sk_xshear;
		var sk_rotationY = sk_rotation_final+sk_yshear+90;
		var sk_a = dcos(sk_rotationX)*sk_xscale;
		var sk_b = -dsin(sk_rotationX)*sk_xscale;
		var sk_c = dcos(sk_rotationY)*-sk_yscale;
		var sk_d = -dsin(sk_rotationY)*-sk_yscale;
		sk_bone[@ SK_BONE.m00] = sk_a;
		sk_bone[@ SK_BONE.m01] = sk_b;
		sk_bone[@ SK_BONE.m10] = sk_c;
		sk_bone[@ SK_BONE.m11] = sk_d;
	break;
	case sk_transformMode_scale:
		// same as normal, but cancel out rotation
		var sk_parent_determinant = sk_pa*sk_pd - sk_pb*sk_pc;
		var sk_parent_rotation = -darctan2(sk_pb,sk_pa);
		var sk_rotationX = sk_rotation+sk_xshear-sk_parent_rotation;
		var sk_rotationY = sk_rotation+sk_yshear+90-sk_parent_rotation;
		if(sk_parent_determinant<0){
			sk_rotationX = -sk_rotationX;
			sk_rotationY = -sk_rotationY;
		}
		var sk_a = dcos(sk_rotationX)*sk_xscale;
		var sk_b = -dsin(sk_rotationX)*sk_xscale;
		var sk_c = dcos(sk_rotationY)*-sk_yscale;
		var sk_d = -dsin(sk_rotationY)*-sk_yscale;
		sk_bone[@ SK_BONE.m00] = (sk_pa*sk_a)+(sk_pc*sk_b);
		sk_bone[@ SK_BONE.m01] = (sk_pb*sk_a)+(sk_pd*sk_b);
		sk_bone[@ SK_BONE.m10] = (sk_pa*sk_c)+(sk_pc*sk_d);
		sk_bone[@ SK_BONE.m11] = (sk_pb*sk_c)+(sk_pd*sk_d);
	break;
	case sk_transformMode_none:
		// don't inherit anything; use applied transform
		var sk_rotationX = sk_rotation+sk_xshear;
		var sk_rotationY = sk_rotation+sk_yshear+90;
		var sk_a = dcos(sk_rotationX)*sk_xscale;
		var sk_b = -dsin(sk_rotationX)*sk_xscale;
		var sk_c = dcos(sk_rotationY)*-sk_yscale;
		var sk_d = -dsin(sk_rotationY)*-sk_yscale;
		// set global flip
		if(sk_global_flipX){	sk_a = -sk_a; sk_c = -sk_c;		}
		if(sk_global_flipY){	sk_b = -sk_b; sk_d = -sk_d;		}
		sk_bone[@ SK_BONE.m00] = sk_a;
		sk_bone[@ SK_BONE.m01] = sk_b;
		sk_bone[@ SK_BONE.m10] = sk_c;
		sk_bone[@ SK_BONE.m11] = sk_d;
	break;
}
sk_bone[@ SK_BONE.badApplied] = false;

#define sk_bone_updateWorldTransform_ext
gml_pragma("forceinline");
/// @desc update world transform of supplied bone
/// @param bone
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param transformMode
var sk_previous_transformMode = argument0[SK_BONE.transformMode];
// set new applied data
argument0[@ SK_BONE.XApplied] = argument1;
argument0[@ SK_BONE.YApplied] = argument2;
argument0[@ SK_BONE.XScaleApplied] = argument3;
argument0[@ SK_BONE.YScaleApplied] = argument4;
argument0[@ SK_BONE.XShearApplied] = argument5;
argument0[@ SK_BONE.YShearApplied] = argument6;
argument0[@ SK_BONE.rotationApplied] = argument7;
argument0[@ SK_BONE.transformModeCorrected] = argument8;
// update bone with new transforms
sk_bone_updateWorldTransform(argument0);

#define sk_bone_updateWorldTransform_other
gml_pragma("forceinline");
/// @desc update world transform of supplied bone relative to a supplied parent
/// @param bone
/// @param parent
var sk_parent = argument0[SK_BONE.parent];
// set temporary parent
argument0[@ SK_BONE.parent] = argument1;
// update bone with new parent
sk_bone_updateWorldTransform(argument0);
// revert parent
argument0[@ SK_BONE.parent] = sk_parent;
// set to bad applied since the parent changed
argument0[@ SK_BONE.badApplied] = true;

#define sk_constraint_create_hierarchy
#macro sk_type_constraint_hierarchy sk_constraint_create_hierarchy /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_HIERARCHY{
	boneParentTuples, /* a list of 2 record tuple consisting of a bone and the id of its parent */
	displayKey,
	displayKeyFinal,
	sizeof
}
#macro sk_tuple_boneParent_bone 0
#macro sk_tuple_boneParent_parent 1
#macro sk_tuple_boneParent_ENTRIES 2
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_CONSTRAINT_HIERARCHY.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_hierarchy,argument0,
	"sk_constraint_hierarchy_setToSetupMix", // setup script
	"sk_constraint_hierarchy_apply", // apply script
	"sk_constraint_destroy_hierarchy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_CONSTRAINT_HIERARCHY.boneParentTuples] = ds_map_create(); // create a map for storing hierarchy states
// set default property values
sk_constraint_hierarchy_set_displayKey(sk_struct,undefined);
// apply transforms
sk_constraint_hierarchy_setToSetupMix(sk_struct);
// return to caller
return sk_struct;

#define sk_constraint_create_ik
#macro sk_type_constraint_ik sk_constraint_create_ik /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_IK{
	chain,boneJoint,boneEffector,
	bendDir,weight,
	bendDirFinal,weightFinal,
	sizeof
}
#macro sk_bendDir_positive 1
#macro sk_bendDir_negative -1
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
/// @param effector
var sk_struct = array_create(SK_CONSTRAINT_IK.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_ik,argument0,
	"sk_constraint_ik_setToSetupMix", // setup script
	"sk_constraint_ik_apply", // apply script
	"sk_constraint_destroy_ik" // destruction script
);
// set default property values
sk_constraint_ik_set_mix(sk_struct,sk_bendDir_negative,1);
sk_constraint_ik_set_chain(sk_struct,false);
sk_constraint_ik_set_bone_joint(sk_struct,argument1);
sk_constraint_ik_set_bone_effector(sk_struct,argument2);
// apply transforms
sk_constraint_ik_setToSetupMix(sk_struct);
// return to caller
return sk_struct;

#define sk_constraint_create_physics
#macro sk_type_constraint_physics sk_constraint_create_physics /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_PHYSICS{
	rigid, // if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob
	boneSystem,boneAnchor,boneEffector, // anchor is the bone the system will be attached to, the effector is where the bones will try to reach to
	XGrav,YGrav,drive,
	XGravFinal,YGravFinal,driveFinal,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param anchor
var sk_struct = array_create(SK_CONSTRAINT_PHYSICS.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_physics,argument0,
	"sk_constraint_physics_setToSetupMix", // setup script
	"sk_constraint_physics_apply", // apply script
	"sk_constraint_destroy_physics" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_CONSTRAINT_PHYSICS.boneSystem] = ds_list_create();
// set default property values
sk_constraint_physics_set_rigid(sk_struct,false);
sk_constraint_physics_set_bone_anchor(sk_struct,argument1);
sk_constraint_physics_set_bone_effector(sk_struct,noone);
sk_constraint_physics_set_gravity(sk_struct,0,0);
sk_constraint_physics_set_drive(sk_struct,1);
// apply transforms
sk_constraint_physics_setToSetupMix(sk_struct);
// return to caller
return sk_struct;

#define sk_constraint_create_transform
#macro sk_type_constraint_transform sk_constraint_create_transform /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_TRANSFORM{
	local,relative,boneChildren,boneTarget,
	X,Y,XScale,YScale,YShear,rotation,
	translateMix,scaleMix,shearMix,rotateMix,
	translateMixFinal,scaleMixFinal,shearMixFinal,rotateMixFinal,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param targetBone
var sk_struct = array_create(SK_CONSTRAINT_TRANSFORM.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_transform,argument0,
	"sk_constraint_transform_setToSetupMix", // setup script
	"sk_constraint_transform_apply", // apply script
	"sk_constraint_destroy_transform" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_CONSTRAINT_TRANSFORM.boneChildren] = ds_list_create(); // create list for storing children
// set default property values
sk_constraint_transform_set_local(sk_struct,false);
sk_constraint_transform_set_relative(sk_struct,false);
sk_constraint_transform_set_bone_target(sk_struct,argument1);
sk_constraint_transform_set_offset(sk_struct,0,0,0,0,0,0);
sk_constraint_transform_set_mix(sk_struct,1,1,1,1);
// apply transforms
sk_constraint_transform_setToSetupMix(sk_struct);
// return to caller
return sk_struct;

#define sk_constraint_destroy_hierarchy
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_map_destroy(argument0[SK_CONSTRAINT_HIERARCHY.boneParentTuples]);
}

#define sk_constraint_destroy_ik
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// nothin'
}

#define sk_constraint_destroy_physics
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_list_destroy(argument0[SK_CONSTRAINT_PHYSICS.boneSystem]);
}

#define sk_constraint_destroy_transform
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_list_destroy(argument0[SK_CONSTRAINT_TRANSFORM.boneChildren]);
}

#define sk_constraint_hierarchy_apply
/// @desc applys the constraint
/// @param constraint
var sk_tuple = ds_map_find_value(argument0[SK_CONSTRAINT_HIERARCHY.boneParentTuples],argument0[SK_CONSTRAINT_HIERARCHY.displayKeyFinal]);
if(is_real(sk_tuple)&&ds_exists(sk_tuple,ds_type_list)){
	var sk_tuple_last = ds_list_size(sk_tuple);
	var sk_tuple_id;
	for(sk_tuple_id = 0; sk_tuple_id < sk_tuple_last; sk_tuple_id+=sk_tuple_boneParent_ENTRIES){
		var sk_tuple_bone = sk_tuple[| sk_tuple_id+sk_tuple_boneParent_bone];
		var sk_tuple_parent_id = sk_tuple[| sk_tuple_id+sk_tuple_boneParent_parent];
		if(sk_tuple_parent_id < sk_tuple_id){
			// valid parent
			var sk_tuple_parent = sk_tuple[| sk_tuple_parent_id+sk_tuple_boneParent_bone];
			// update child world transform
			if(sk_tuple_bone[SK_BONE.badApplied]){
				sk_bone_updateAppliedTransform(sk_tuple_bone);
			}	sk_bone_updateWorldTransform_other(sk_tuple_bone,sk_tuple_parent);
		}
	}
}

#define sk_constraint_hierarchy_find_tuple
/// @desc adds a tupple to the list of available tuples and returns its index
/// @param constraint
/// @param key
var sk_availableTuples = argument0[SK_CONSTRAINT_HIERARCHY.boneParentTuples];
var sk_tuple = sk_availableTuples[? argument1];
if(!(is_real(sk_tuple)&&ds_exists(sk_tuple,ds_type_list))){
	sk_tuple = ds_list_create();
	ds_map_add_list(sk_availableTuples,argument1,sk_tuple);
}	return sk_tuple;

#define sk_constraint_hierarchy_get_displayKey
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_HIERARCHY.displayKey];

#define sk_constraint_hierarchy_get_displayKey_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_HIERARCHY.displayKeyFinal];

#define sk_constraint_hierarchy_setToSetupMix
gml_pragma("forceinline");
/// @desc sets the default transforms of the supplied constraint
/// @param constraint
argument0[@ SK_CONSTRAINT_HIERARCHY.displayKeyFinal] = argument0[SK_CONSTRAINT_HIERARCHY.displayKey];

#define sk_constraint_hierarchy_set_displayKey
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
/// @param key
argument0[@ SK_CONSTRAINT_HIERARCHY.displayKey] = argument1;

#define sk_constraint_hierarchy_set_displayKey_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
/// @param key
argument0[@ SK_CONSTRAINT_HIERARCHY.displayKeyFinal] = argument1;

#define sk_constraint_ik_apply
/// @desc applys IK between a bone and an end effector
/// @param constraint
var sk_alpha = argument0[SK_CONSTRAINT_IK.weightFinal];
if(sk_alpha<0.01){
	// negligable
	return;
}
var sk_bone_effector = argument0[SK_CONSTRAINT_IK.boneEffector];
var sk_bone_joint = argument0[SK_CONSTRAINT_IK.boneJoint];
var sk_targetX = sk_bone_effector[SK_BONE.XWorld];
var sk_targetY = sk_bone_effector[SK_BONE.YWorld];
if(argument0[SK_CONSTRAINT_IK.chain]){
	sk_ik_apply_chain(sk_bone_joint,sk_targetX,sk_targetY,argument0[SK_CONSTRAINT_IK.bendDirFinal],sk_alpha);
} else {
	sk_ik_apply(sk_bone_joint,sk_targetX,sk_targetY,sk_alpha);
}

#define sk_constraint_ik_get_bendDir
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.bendDir];

#define sk_constraint_ik_get_bendDir_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.bendDirFinal];

#define sk_constraint_ik_get_bone_effector
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.boneEffector];

#define sk_constraint_ik_get_bone_joint
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.boneJoint];

#define sk_constraint_ik_get_chain
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.chain];

#define sk_constraint_ik_get_weight
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.weight];

#define sk_constraint_ik_get_weight_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_IK.weightFinal];

#define sk_constraint_ik_setToSetupMix
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied IKConstraint
/// @param constraint
argument0[@ SK_CONSTRAINT_IK.bendDirFinal] = argument0[SK_CONSTRAINT_IK.bendDir];
argument0[@ SK_CONSTRAINT_IK.weightFinal] = argument0[SK_CONSTRAINT_IK.weight];

#define sk_constraint_ik_set_bone_effector
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ SK_CONSTRAINT_IK.boneEffector] = argument1;

#define sk_constraint_ik_set_bone_joint
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ SK_CONSTRAINT_IK.boneJoint] = argument1;

#define sk_constraint_ik_set_chain
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param enabled
argument0[@ SK_CONSTRAINT_IK.chain] = argument1;

#define sk_constraint_ik_set_mix
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ SK_CONSTRAINT_IK.bendDir] = (argument1==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
argument0[@ SK_CONSTRAINT_IK.weight] = real(argument2);

#define sk_constraint_ik_set_mix_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bendDir
/// @param weight
argument0[@ SK_CONSTRAINT_IK.bendDirFinal] = (argument1==sk_bendDir_positive) ? sk_bendDir_positive : sk_bendDir_negative;
argument0[@ SK_CONSTRAINT_IK.weightFinal] = real(argument2);

#define sk_constraint_physics_apply
#macro sk_physics_boneState global.sk_globalVar_physicsConstraint_physicsState
#macro sk_physics_external_xDisplacement global.sk_globalVar_physicsConstraint_xDisplacement
#macro sk_physics_external_yDisplacement global.sk_globalVar_physicsConstraint_yDisplacement
#macro sk_physics_global_xGravity global.sk_globalVar_physicsConstraint_xGrav
#macro sk_physics_global_yGravity global.sk_globalVar_physicsConstraint_yGrav
#macro sk_physics_global_drivingRatio global.sk_globalVar_physicsConstraint_drive
gml_pragma("global",@'
	sk_physics_boneState = noone;
	sk_physics_external_xDisplacement = 0; // adding the displacement to the world coordinate can simulate external movement
	sk_physics_external_yDisplacement = 0;
	sk_physics_global_xGravity = 0;
	sk_physics_global_yGravity = 0.2;
	sk_physics_global_drivingRatio = 0.85;
');
/// @desc applys the constraint
/// @param constraint
var sk_phys_boneState = sk_physics_boneState;
if(ds_exists(sk_phys_boneState,ds_type_map)){
	// get effectors
	var sk_phys_bone_anchor = argument0[SK_CONSTRAINT_PHYSICS.boneAnchor];
	var sk_phys_bone_effector = argument0[SK_CONSTRAINT_PHYSICS.boneEffector];
	// use the current physics state to update the bones
	var sk_phys_rigidBody = argument0[SK_CONSTRAINT_PHYSICS.rigid];
	var sk_phys_xdisplacement = sk_physics_external_xDisplacement;
	var sk_phys_ydisplacement = sk_physics_external_yDisplacement;
	var sk_phys_xgrav = argument0[SK_CONSTRAINT_PHYSICS.XGravFinal]+sk_physics_global_xGravity;
	var sk_phys_ygrav = argument0[SK_CONSTRAINT_PHYSICS.YGravFinal]+sk_physics_global_yGravity;
	var sk_phys_damping = clamp(argument0[SK_CONSTRAINT_PHYSICS.driveFinal]*sk_physics_global_drivingRatio,0,1);
	// get bone system
	var sk_phys_bones = argument0[SK_CONSTRAINT_PHYSICS.boneSystem];
	var sk_phys_bone_count = ds_list_size(sk_phys_bones);
	// iterate through the system to constrain the system to the effector
	if(sk_struct_isof(sk_phys_bone_effector,sk_type_bone)){
		var sk_phys_target_x = sk_phys_bone_effector[SK_BONE.XWorld];
		var sk_phys_target_y = sk_phys_bone_effector[SK_BONE.YWorld];
		var sk_phys_target_length = 0;
		for(var sk_phys_bone_id = sk_phys_bone_count-1; sk_phys_bone_id >= 0; sk_phys_bone_id--){
			var sk_bone = sk_phys_bones[| sk_phys_bone_id];
			// get current bone's physics state
			var sk_bone_state = sk_phys_boneState[? sk_bone];
			if(!is_array(sk_bone_state)){
				// create new physics state record for this bone
				sk_bone_state = [0,0,0,0]; // x,y,xprevious,yprevious
				sk_phys_boneState[? sk_bone] = sk_bone_state;
			}
			// apply FABRIK to the physics state
			var sk_phys_dx = sk_bone_state[0]-sk_phys_target_x;
			var sk_phys_dy = sk_bone_state[1]-sk_phys_target_y;
			var sk_phys_du = max(point_distance(0,0,sk_phys_dx,sk_phys_dy),0.01);
			if(sk_phys_rigidBody||(sk_phys_du>sk_phys_target_length)){
				// constrain length
				sk_phys_du = sk_phys_target_length/sk_phys_du;
				sk_phys_dx *= sk_phys_du;
				sk_phys_dy *= sk_phys_du;
				sk_phys_du = sk_phys_target_length;
			}
			var sk_phys_px = sk_phys_target_x+sk_phys_dx; // set current position
			var sk_phys_py = sk_phys_target_y+sk_phys_dy;
			sk_bone_state[@ 0] = sk_phys_px;
			sk_bone_state[@ 1] = sk_phys_py;
			// update new pivot
			sk_phys_target_x = sk_phys_px;
			sk_phys_target_y = sk_phys_py;
			// update joint length for next bone
			sk_phys_target_length = sk_bone[SK_BONE.length]*abs(point_distance(0,0,sk_bone[SK_BONE.m00],sk_bone[SK_BONE.m01]));
		}
	}
	// iterate through the system to constrain the system to the anchor, apply physics, and update bone transforms
	var sk_phys_pivot_x = sk_phys_bone_anchor[SK_BONE.XWorld];
	var sk_phys_pivot_y = sk_phys_bone_anchor[SK_BONE.YWorld];
	for(var sk_phys_bone_id = 0; sk_phys_bone_id < sk_phys_bone_count; sk_phys_bone_id++){
		var sk_bone = sk_phys_bones[| sk_phys_bone_id];
		// get current bone's physics state
		var sk_bone_state = sk_phys_boneState[? sk_bone];
		if(!is_array(sk_bone_state)){
			// create new physics state record for this bone
			sk_bone_state = [0,0,0,0]; // x,y,xprevious,yprevious
			sk_phys_boneState[? sk_bone] = sk_bone_state;
		}
		// get the current bones joint length
		var sk_bone_m00 = sk_bone[SK_BONE.m00];
		var sk_bone_m01 = sk_bone[SK_BONE.m01];
		var sk_bone_m10 = sk_bone[SK_BONE.m10];
		var sk_bone_m11 = sk_bone[SK_BONE.m11];
		var sk_bone_determinant = (sk_bone_m00*sk_bone_m11)-(sk_bone_m01*sk_bone_m10);
		var sk_bone_xsc = abs(point_distance(0,0,sk_bone_m00,sk_bone_m01));
		var sk_bone_ysc = abs(point_distance(0,0,sk_bone_m10,sk_bone_m11));
		var sk_bone_ysh = -angle_difference(-darctan2(sk_bone_m11,sk_bone_m10),-darctan2(sk_bone_m01,sk_bone_m00));
		if(sk_bone_determinant<0){
			// determinant is negative
			sk_bone_ysc = -sk_bone_ysc;
		}
		var sk_phys_joint_length = sk_bone[SK_BONE.length]*sk_bone_xsc;
		// apply VERLET to the physics state
		var sk_phys_px = sk_bone_state[0];
		var sk_phys_py = sk_bone_state[1];
		var sk_phys_vx = (sk_phys_px-sk_phys_xdisplacement-sk_bone_state[2])*sk_phys_damping;
		var sk_phys_vy = (sk_phys_py-sk_phys_ydisplacement-sk_bone_state[3])*sk_phys_damping;
		sk_bone_state[@ 2] = sk_phys_px; // set previous position
		sk_bone_state[@ 3] = sk_phys_py;
		sk_phys_px += sk_phys_vx+sk_phys_xgrav;
		sk_phys_py += sk_phys_vy+sk_phys_ygrav;
		var sk_phys_dx = sk_phys_px-sk_phys_pivot_x;
		var sk_phys_dy = sk_phys_py-sk_phys_pivot_y;
		var sk_phys_du = max(point_distance(0,0,sk_phys_dx,sk_phys_dy),0.01);
		if(sk_phys_rigidBody||(sk_phys_du>sk_phys_joint_length)){
			// constrain length
			sk_phys_du = sk_phys_joint_length/sk_phys_du;
			sk_phys_dx *= sk_phys_du;
			sk_phys_dy *= sk_phys_du;
			sk_phys_du = sk_phys_joint_length;
		}
		sk_phys_px = sk_phys_pivot_x+sk_phys_dx; // set current position
		sk_phys_py = sk_phys_pivot_y+sk_phys_dy;
		sk_bone_state[@ 0] = sk_phys_px;
		sk_bone_state[@ 1] = sk_phys_py;
		// update bone transformation
		sk_bone_xsc *= sk_phys_du/sk_phys_joint_length;
		var sk_bone_rot = -darctan2(sk_phys_dy,sk_phys_dx);
		var sk_bone_rot_y = sk_bone_rot+90;
		sk_bone[@ SK_BONE.XWorld] = sk_phys_pivot_x;
		sk_bone[@ SK_BONE.YWorld] = sk_phys_pivot_y;
		sk_bone[@ SK_BONE.m00] = dcos(sk_bone_rot)*sk_bone_xsc;
		sk_bone[@ SK_BONE.m01] = -dsin(sk_bone_rot)*sk_bone_xsc;
		sk_bone[@ SK_BONE.m10] = dcos(sk_bone_rot_y)*sk_bone_ysc;
		sk_bone[@ SK_BONE.m11] = -dsin(sk_bone_rot_y)*sk_bone_ysc;
		// make applied transform invalid
		sk_bone[@ SK_BONE.badApplied] = true;
		// update new pivot
		sk_phys_pivot_x = sk_phys_px;
		sk_phys_pivot_y = sk_phys_py;
	}
}

#define sk_constraint_physics_get_bone_anchor
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.boneAnchor];

#define sk_constraint_physics_get_bone_effector
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.boneEffector];

#define sk_constraint_physics_get_drive
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.drive];

#define sk_constraint_physics_get_drive_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.driveFinal];

#define sk_constraint_physics_get_hgravity
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.XGrav];

#define sk_constraint_physics_get_hgravity_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.XGravFinal];

#define sk_constraint_physics_get_rigid
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.rigid];

#define sk_constraint_physics_get_vgravity
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.YGrav];

#define sk_constraint_physics_get_vgravity_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_PHYSICS.YGravFinal];

#define sk_constraint_physics_setToSetupMix
gml_pragma("forceinline");
/// @desc sets the default transforms of the supplied constraint
/// @param constraint
argument0[@ SK_CONSTRAINT_PHYSICS.XGravFinal] = argument0[SK_CONSTRAINT_PHYSICS.XGrav];
argument0[@ SK_CONSTRAINT_PHYSICS.YGravFinal] = argument0[SK_CONSTRAINT_PHYSICS.YGrav];
argument0[@ SK_CONSTRAINT_PHYSICS.driveFinal] = argument0[SK_CONSTRAINT_PHYSICS.drive];

#define sk_constraint_physics_set_bone_anchor
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ SK_CONSTRAINT_PHYSICS.boneAnchor] = argument1;

#define sk_constraint_physics_set_bone_effector
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ SK_CONSTRAINT_PHYSICS.boneEffector] = argument1;

#define sk_constraint_physics_set_drive
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param amount
argument0[@ SK_CONSTRAINT_PHYSICS.drive] = clamp(real(argument1),0,1);

#define sk_constraint_physics_set_drive_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param amount
argument0[@ SK_CONSTRAINT_PHYSICS.driveFinal] = clamp(real(argument1),0,1);

#define sk_constraint_physics_set_gravity
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param direction
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ SK_CONSTRAINT_PHYSICS.XGrav] = sk_magnitude*dcos(sk_direction);
argument0[@ SK_CONSTRAINT_PHYSICS.YGrav] = -sk_magnitude*dsin(sk_direction);

#define sk_constraint_physics_set_gravity_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param direction
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ SK_CONSTRAINT_PHYSICS.XGravFinal] = sk_magnitude*dcos(sk_direction);
argument0[@ SK_CONSTRAINT_PHYSICS.YGravFinal] = -sk_magnitude*dsin(sk_direction);

#define sk_constraint_physics_set_rigid
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param enabled
argument0[@ SK_CONSTRAINT_PHYSICS.rigid] = argument1;

#define sk_constraint_physics_system_add
/// @desc adds a bone to the physics system
/// @param constraint
/// @param bone
ds_list_add(argument0[SK_CONSTRAINT_PHYSICS.boneSystem],argument1);

#define sk_constraint_physics_system_clear
/// @desc clears the bone physics system
/// @param constraint
ds_list_clear(argument0[SK_CONSTRAINT_PHYSICS.boneSystem]);

#define sk_constraint_transform_apply
/// @desc applys transformations between a set of bones and a universal parent bone
/// @param constraint
var sk_boneTarget = argument0[SK_CONSTRAINT_TRANSFORM.boneTarget];
var sk_bones = argument0[SK_CONSTRAINT_TRANSFORM.boneChildren];
var sk_boneCount = ds_list_size(sk_bones);
var sk_xoffset = argument0[SK_CONSTRAINT_TRANSFORM.X];
var sk_yoffset = argument0[SK_CONSTRAINT_TRANSFORM.Y];
var sk_xscaleoffset = argument0[SK_CONSTRAINT_TRANSFORM.XScale];
var sk_yscaleoffset = argument0[SK_CONSTRAINT_TRANSFORM.YScale];
var sk_yshearoffset = argument0[SK_CONSTRAINT_TRANSFORM.YShear];
var sk_rotationoffset = argument0[SK_CONSTRAINT_TRANSFORM.rotation];
var sk_translateMix = argument0[SK_CONSTRAINT_TRANSFORM.translateMixFinal];
var sk_scaleMix = argument0[SK_CONSTRAINT_TRANSFORM.scaleMixFinal];
var sk_shearMix = argument0[SK_CONSTRAINT_TRANSFORM.shearMixFinal];
var sk_rotateMix = argument0[SK_CONSTRAINT_TRANSFORM.rotateMixFinal];
switch(((argument0[SK_CONSTRAINT_TRANSFORM.local]||false)<<0)|((argument0[SK_CONSTRAINT_TRANSFORM.relative]||false)<<1)){
	case 0: // not local; not relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			sk_transformation_apply_absoluteWorld(
				sk_bone,sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case 1: // local; not relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			sk_transformation_apply_absoluteLocal(
				sk_bone,sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case 2: // not local; relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			sk_transformation_apply_relativeWorld(
				sk_bone,sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case 3: // local; relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			sk_transformation_apply_relativeLocal(
				sk_bone,sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
}

#define sk_constraint_transform_bone_children_add
/// @desc appends a bone to the transformation constraint list
/// @param constraint
/// @param bone
ds_list_add(argument0[SK_CONSTRAINT_TRANSFORM.boneChildren],argument1);

#define sk_constraint_transform_bone_children_clear
/// @desc clears the list containing child bone data
/// @param constraint
ds_list_clear(argument0[SK_CONSTRAINT_TRANSFORM.boneChildren]);

#define sk_constraint_transform_get_bone_target
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.boneTarget];

#define sk_constraint_transform_get_local
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.local];

#define sk_constraint_transform_get_mix_rotate
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.rotateMix];

#define sk_constraint_transform_get_mix_rotate_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.rotateMixFinal];

#define sk_constraint_transform_get_mix_scale
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.scaleMix];

#define sk_constraint_transform_get_mix_scale_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.scaleMixFinal];

#define sk_constraint_transform_get_mix_shear
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.shearMix];

#define sk_constraint_transform_get_mix_shear_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.shearMixFinal];

#define sk_constraint_transform_get_mix_translate
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.translateMix];

#define sk_constraint_transform_get_mix_translate_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.translateMixFinal];

#define sk_constraint_transform_get_offset_rotation
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.rotation];

#define sk_constraint_transform_get_offset_x
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.X];

#define sk_constraint_transform_get_offset_xscale
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.XScale];

#define sk_constraint_transform_get_offset_y
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.Y];

#define sk_constraint_transform_get_offset_yscale
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.YScale];

#define sk_constraint_transform_get_offset_yshear
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.YShear];

#define sk_constraint_transform_get_relative
gml_pragma("forceinline");
/// @desc gets a property
/// @param constraint
return argument0[SK_CONSTRAINT_TRANSFORM.relative];

#define sk_constraint_transform_setToSetupMix
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied TransformationConstraint
/// @param constraint
argument0[@ SK_CONSTRAINT_TRANSFORM.translateMixFinal] = argument0[SK_CONSTRAINT_TRANSFORM.translateMix];
argument0[@ SK_CONSTRAINT_TRANSFORM.scaleMixFinal] = argument0[SK_CONSTRAINT_TRANSFORM.scaleMix];
argument0[@ SK_CONSTRAINT_TRANSFORM.shearMixFinal] = argument0[SK_CONSTRAINT_TRANSFORM.shearMix];
argument0[@ SK_CONSTRAINT_TRANSFORM.rotateMixFinal] = argument0[SK_CONSTRAINT_TRANSFORM.rotateMix];

#define sk_constraint_transform_set_bone_target
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param bone
argument0[@ SK_CONSTRAINT_TRANSFORM.boneTarget] = argument1;

#define sk_constraint_transform_set_local
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param enabled
argument0[@ SK_CONSTRAINT_TRANSFORM.local] = argument1;

#define sk_constraint_transform_set_mix
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
argument0[@ SK_CONSTRAINT_TRANSFORM.translateMix] = real(argument1);
argument0[@ SK_CONSTRAINT_TRANSFORM.scaleMix] = real(argument2);
argument0[@ SK_CONSTRAINT_TRANSFORM.shearMix] = real(argument3);
argument0[@ SK_CONSTRAINT_TRANSFORM.rotateMix] = real(argument4);

#define sk_constraint_transform_set_mix_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotateMix
argument0[@ SK_CONSTRAINT_TRANSFORM.translateMixFinal] = real(argument1);
argument0[@ SK_CONSTRAINT_TRANSFORM.scaleMixFinal] = real(argument2);
argument0[@ SK_CONSTRAINT_TRANSFORM.shearMixFinal] = real(argument3);
argument0[@ SK_CONSTRAINT_TRANSFORM.rotateMixFinal] = real(argument4);

#define sk_constraint_transform_set_offset
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param yshear
/// @param rotation
argument0[@ SK_CONSTRAINT_TRANSFORM.X] = real(argument1);
argument0[@ SK_CONSTRAINT_TRANSFORM.Y] = real(argument2);
argument0[@ SK_CONSTRAINT_TRANSFORM.XScale] = is_real(argument3) ? argument3 : 1;
argument0[@ SK_CONSTRAINT_TRANSFORM.YScale] = is_real(argument4) ? argument4 : 1;
argument0[@ SK_CONSTRAINT_TRANSFORM.YShear] = -angle_difference(0,real(argument5));
argument0[@ SK_CONSTRAINT_TRANSFORM.rotation] = -angle_difference(0,real(argument6));

#define sk_constraint_transform_set_relative
gml_pragma("forceinline");
/// @desc sets a property
/// @param constraint
/// @param enabled
argument0[@ SK_CONSTRAINT_TRANSFORM.relative] = argument1;

#define sk_createCompoundKey
/// @desc combines two values into a compound string
/// @param a
/// @param b
return "<"+string(argument0)+","+string(argument1)+">";

#define sk_erp
/// @desc interpolates between two times
/// @param timeLast
/// @param timeNext
/// @param timeTarget
/// @param tweenEasing
var sk_linearInterpolation = 0;
if(argument0!=argument1){
	sk_linearInterpolation = clamp((argument2-argument0)/(argument1-argument0),0,1);
}	// 0 means previous frame, 1 means next frame
switch(argument3){
	case sk_tweenEasing_none:			return 0; break;
	case sk_tweenEasing_linear:			return sk_linearInterpolation; break;
	case sk_tweenEasing_easeIn:			return(sk_linearInterpolation*sk_linearInterpolation*(3-sk_linearInterpolation)*0.5);break;
	case sk_tweenEasing_easeOut:		var r = clamp(sk_linearInterpolation+1,1,2); return (r*r*(3-r)*0.5 -1); break;
	case sk_tweenEasing_smoothstep:		return(sk_linearInterpolation*sk_linearInterpolation*(3-2*sk_linearInterpolation)); break; // smooth step
	case sk_tweenEasing_smoothstepI:	return(2*sk_linearInterpolation-(sk_linearInterpolation*sk_linearInterpolation*(3-2*sk_linearInterpolation))); break; // inverse smooth step
}
return sk_linearInterpolation;

#define sk_event_call
/// @desc calls the event script
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
var sk_scr = argument0[SK_EVENT.callingScript];
if(script_exists(sk_scr)){
	script_execute(
		sk_scr,
		is_real(argument1) ? argument1 : argument0[SK_EVENT.dBone],
		is_string(argument2) ? argument2 : argument0[SK_EVENT.dString],
		is_real(argument3) ? argument3 : argument0[SK_EVENT.dReal],
		(is_real(argument4)||is_int64(argument4)) ? int64(argument4) : argument0[SK_EVENT.dInt],
		is_real(argument5) ? argument5 : argument0[SK_EVENT.dSound]
	);
} else {
	// post default event
	show_debug_message("Sk: ["+string(current_time)+"] - Event Called: "+string(sk_struct_get_name(argument0)));
}

#define sk_event_create
#macro sk_type_event sk_event_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_EVENT{
	callingScript,
	dBone,dString,dReal,dInt,dSound,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_EVENT.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_event,argument0,
	-1, // setup script
	"sk_event_call", // apply script
	"sk_event_destroy" // destruction script
);
// set default property values
sk_event_set_script(sk_struct,-1);
sk_event_data_set(sk_struct,noone,"",0,0,-1);
// return to caller
return sk_struct;

#define sk_event_data_get_bone
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param event
return argument0[SK_EVENT.dBone];

#define sk_event_data_get_int
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param event
return argument0[SK_EVENT.dInt];

#define sk_event_data_get_real
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param event
return argument0[SK_EVENT.dReal];

#define sk_event_data_get_sound
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param event
return argument0[SK_EVENT.dSound];

#define sk_event_data_get_string
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param event
return argument0[SK_EVENT.dString];

#define sk_event_data_set
gml_pragma("forceinline");
/// @desc sets a property
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
argument0[@ SK_EVENT.dBone] = argument1;
argument0[@ SK_EVENT.dString] = string(argument2);
argument0[@ SK_EVENT.dReal] = real(argument3);
argument0[@ SK_EVENT.dInt] = int64(argument4);
argument0[@ SK_EVENT.dSound] = is_real(argument5) ? argument5 : -1;

#define sk_event_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param event
if(array_unhook_sk_structure(argument0)){
	// nothin'
}

#define sk_event_get_script
gml_pragma("forceinline");
/// @desc gets or sets a property
/// @param event
return argument0[SK_EVENT.callingScript];

#define sk_event_set_script
gml_pragma("forceinline");
/// @desc sets a property
/// @param event
/// @param script
argument0[@ SK_EVENT.callingScript] = argument1;

#define sk_frames_apply_colour
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_COLOUR.tweenEasing]);
var sk_colour_rgb = merge_colour(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_COLOUR.colour],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_COLOUR.colour],sk_interpolation);
var sk_colour_a = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_COLOUR.alpha],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_COLOUR.alpha],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix: case sk_mixPose_add: 
		sk_target[@ SK_SLOT.colourFinal] = merge_colour(sk_target[SK_SLOT.colourFinal],sk_colour_rgb,sk_alpha);
		sk_target[@ SK_SLOT.alphaFinal] = lerp(sk_target[SK_SLOT.alphaFinal],sk_colour_a,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_SLOT.colour] = merge_colour(sk_target[SK_SLOT.colour],sk_colour_rgb,sk_alpha);
		sk_target[@ SK_SLOT.alpha] = lerp(sk_target[SK_SLOT.alpha],sk_colour_a,sk_alpha);
	break;
}

#define sk_frames_apply_display
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	// check whether the keyframe has been reached
	if(sk_time<sk_keyframe_prev_time){ return; }
	// get display index
	var sk_display = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_DISPLAY.attachmentKey];
	// apply
	var sk_attachments = sk_target[SK_SLOT.availableAttachments];
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_target[@ SK_SLOT.attachmentFinal] = sk_attachments[? sk_display];
		break;
		case sk_mixPose_overwrite:
			sk_target[@ SK_SLOT.defaultAttachmentKey] = sk_display;
			sk_target[@ SK_SLOT.attachment] = sk_attachments[? sk_display];
		break;
	}
}

#define sk_frames_apply_draworder
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	// check whether the keyframe has been reached
	if(sk_time<sk_keyframe_prev_time){ return; }
	// get offset tuple
	var sk_itemOffset = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_DRAWORDER.itemOffsetTuple];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_list_shift_list(sk_target[SK_ARMATURE.drawOrderFinal],sk_itemOffset);
		break;
		case sk_mixPose_overwrite:
			sk_list_shift_list(sk_target[SK_ARMATURE.drawOrder],sk_itemOffset);
		break;
	}
}

#define sk_frames_apply_event
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	if(sk_timeLast<sk_time){
		// throw the current event frame
		if((sk_timeLast<=sk_keyframe_prev_time)&&(sk_time>sk_keyframe_prev_time)){
			sk_event_call(
				sk_target,
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.bone],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.str],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.float],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.int],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.sound]
			);
		}
	} else if(sk_timeLast>sk_time){
		// throw edge events
		var sk_keyframe_last = ds_list_size(sk_keyframes)-1;
		var sk_keyframe_first = 0;
		if(sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.time]>sk_timeLast){
			sk_event_call(
				sk_target,
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.bone],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.str],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.float],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.int],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.sound]
			);
		}
		if(sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.time]<sk_time){
			sk_event_call(
				sk_target,
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.bone],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.str],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.float],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.int],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.sound]
			);
		}
	}
}

#define sk_frames_apply_hierarchy
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	// check whether the keyframe has been reached
	if(sk_time<sk_keyframe_prev_time){ return; }
	// get tuple index
	var sk_tupleId = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_HIERARCHY.tupleKey];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_target[@ SK_CONSTRAINT_HIERARCHY.displayKeyFinal] = sk_tupleId;
		break;
		case sk_mixPose_overwrite:
			sk_target[@ SK_CONSTRAINT_HIERARCHY.displayKey] = sk_tupleId;
		break;
	}
}

#define sk_frames_apply_ik
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_IK.tweenEasing]);
var sk_bendDir = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_IK.bendDir];
var sk_weight = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_IK.weight],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_IK.weight],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix: case sk_mixPose_add:
		sk_target[@ SK_CONSTRAINT_IK.bendDirFinal] = sk_bendDir;
		sk_target[@ SK_CONSTRAINT_IK.weightFinal] = lerp(sk_target[SK_CONSTRAINT_IK.weightFinal],sk_weight,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_CONSTRAINT_IK.bendDir] = sk_bendDir;
		sk_target[@ SK_CONSTRAINT_IK.weight] = lerp(sk_target[SK_CONSTRAINT_IK.weight],sk_weight,sk_alpha);
	break;
}

#define sk_frames_apply_parent
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	// check whether the keyframe has been reached
	if(sk_time<sk_keyframe_prev_time){ return; }
	// get bone parent
	var sk_bone = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_PARENT.bone];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_target[@ SK_SLOT.boneFinal] = sk_bone;
		break;
		case sk_mixPose_overwrite:
			sk_target[@ SK_SLOT.bone] = sk_bone;
		break;
	}
}

#define sk_frames_apply_rotate
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_ROTATE.tweenEasing]);
var sk_r = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_ROTATE.rotation];
sk_r += sk_interpolation*(
	-angle_difference(sk_r,sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_ROTATE.rotation])
	+360*sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_ROTATE.cycles]
);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		var sk_rotation = sk_target[SK_BONE.rotationApplied];
		sk_target[@ SK_BONE.rotationApplied] = sk_rotation-angle_difference(sk_rotation,sk_target[SK_BONE.rotation]+sk_r)*sk_alpha;
	break;
	case sk_mixPose_add: 
		sk_target[@ SK_BONE.rotationApplied] = sk_target[SK_BONE.rotationApplied]+sk_r*sk_alpha;
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_BONE.rotation] = sk_target[SK_BONE.rotation]+sk_r*sk_alpha;
	break;
}

#define sk_frames_apply_scale
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SCALE.tweenEasing]);
var sk_x = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SCALE.dx],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_SCALE.dx],sk_interpolation);
var sk_y = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SCALE.dy],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_SCALE.dy],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		sk_target[@ SK_BONE.XScaleApplied] = lerp(sk_target[SK_BONE.XScaleApplied],sk_target[SK_BONE.XScale]*sk_x,sk_alpha);
		sk_target[@ SK_BONE.YScaleApplied] = lerp(sk_target[SK_BONE.YScaleApplied],sk_target[SK_BONE.YScale]*sk_y,sk_alpha);
	break;
	case sk_mixPose_add: 
		sk_target[@ SK_BONE.XScaleApplied] = sk_target[SK_BONE.XScaleApplied]*lerp(1,sk_x,sk_alpha);
		sk_target[@ SK_BONE.YScaleApplied] = sk_target[SK_BONE.YScaleApplied]*lerp(1,sk_y,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_BONE.XScale] = sk_target[SK_BONE.XScale]*lerp(1,sk_x,sk_alpha);
		sk_target[@ SK_BONE.YScale] = sk_target[SK_BONE.YScale]*lerp(1,sk_y,sk_alpha);
	break;
}

#define sk_frames_apply_shear
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SHEAR.tweenEasing]);
var sk_x = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SHEAR.dx],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_SHEAR.dx],sk_interpolation);
var sk_y = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SHEAR.dy],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_SHEAR.dy],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		var sk_xshear = sk_target[SK_BONE.XShearApplied];
		var sk_yshear = sk_target[SK_BONE.YShearApplied];
		sk_target[@ SK_BONE.XShearApplied] = sk_xshear-angle_difference(sk_xshear,sk_target[SK_BONE.XShear]+sk_x)*sk_alpha;
		sk_target[@ SK_BONE.YShearApplied] = sk_yshear-angle_difference(sk_yshear,sk_target[SK_BONE.YShear]+sk_y)*sk_alpha;
	break;
	case sk_mixPose_add: 
		sk_target[@ SK_BONE.XShearApplied] = sk_target[SK_BONE.XShearApplied]+sk_x*sk_alpha;
		sk_target[@ SK_BONE.YShearApplied] = sk_target[SK_BONE.YShearApplied]+sk_y*sk_alpha;
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_BONE.XShear] = sk_target[SK_BONE.XShear]+sk_x*sk_alpha;
		sk_target[@ SK_BONE.YShear] = sk_target[SK_BONE.YShear]+sk_y*sk_alpha;
	break;
}

#define sk_frames_apply_transform
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSFORM.tweenEasing]);
var sk_translate = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSFORM.translateMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_TRANSFORM.translateMix],sk_interpolation);
var sk_scale = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSFORM.scaleMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_TRANSFORM.scaleMix],sk_interpolation);
var sk_shear = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSFORM.shearMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_TRANSFORM.shearMix],sk_interpolation);
var sk_rotate = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSFORM.rotateMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_TRANSFORM.rotateMix],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix: case sk_mixPose_add:
		sk_target[@ SK_CONSTRAINT_TRANSFORM.translateMixFinal] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.translateMixFinal],sk_translate,sk_alpha);
		sk_target[@ SK_CONSTRAINT_TRANSFORM.scaleMixFinal] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.scaleMixFinal],sk_scale,sk_alpha);
		sk_target[@ SK_CONSTRAINT_TRANSFORM.shearMixFinal] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.shearMixFinal],sk_shear,sk_alpha);
		sk_target[@ SK_CONSTRAINT_TRANSFORM.rotateMixFinal] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.rotateMixFinal],sk_rotate,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_CONSTRAINT_TRANSFORM.translateMix] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.translateMix],sk_translate,sk_alpha);
		sk_target[@ SK_CONSTRAINT_TRANSFORM.scaleMix] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.scaleMix],sk_scale,sk_alpha);
		sk_target[@ SK_CONSTRAINT_TRANSFORM.shearMix] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.shearMix],sk_shear,sk_alpha);
		sk_target[@ SK_CONSTRAINT_TRANSFORM.rotateMix] = lerp(sk_target[SK_CONSTRAINT_TRANSFORM.rotateMix],sk_rotate,sk_alpha);
	break;
}

#define sk_frames_apply_translate
/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSLATE.tweenEasing]);
var sk_x = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSLATE.dx],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_TRANSLATE.dx],sk_interpolation);
var sk_y = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_TRANSLATE.dy],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_TRANSLATE.dy],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		sk_target[@ SK_BONE.XApplied] = lerp(sk_target[SK_BONE.XApplied],sk_target[SK_BONE.X]+sk_x,sk_alpha);
		sk_target[@ SK_BONE.YApplied] = lerp(sk_target[SK_BONE.YApplied],sk_target[SK_BONE.Y]+sk_y,sk_alpha);
	break;
	case sk_mixPose_add:
		sk_target[@ SK_BONE.XApplied] = sk_target[SK_BONE.XApplied]+sk_x*sk_alpha;
		sk_target[@ SK_BONE.YApplied] = sk_target[SK_BONE.YApplied]+sk_y*sk_alpha;
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_BONE.X] = sk_target[SK_BONE.X]+sk_x*sk_alpha;
		sk_target[@ SK_BONE.Y] = sk_target[SK_BONE.Y]+sk_y*sk_alpha;
	break;
}

#define sk_hex_get_alpha
/// @desc Returns the colour corresponding to the hex string
/// @param hex
/// @param inverse
var sk_slot_rgba = string_copy(argument0,0,8);
while(string_length(sk_slot_rgba)<8){ // fill empty data
	sk_slot_rgba += "F";
}
return clamp(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 1 : 7,2))/255,0,1);

#define sk_hex_get_colour
/// @desc Returns the colour corresponding to the hex string
/// @param hex
/// @param inverse
var sk_slot_rgba = string_copy(argument0,0,8);
while(string_length(sk_slot_rgba)<8){ // fill empty data
	sk_slot_rgba += "F";
}
return(
	(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 7 : 1,2))<<0)+ // red
	(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 5 : 3,2))<<8)+ // green
	(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 3 : 5,2))<<16) // blue
);

#define sk_hex_get_real
/// @desc Returns a decimal integer (real) representing the given hexadeciaml string.
/// @param hex
/// GMLscripts.com/license
var hex = string_upper(argument0);
var dec = 0;
var digit_count = string_length(hex); 
var digit;
for(digit = 1; digit <= digit_count; digit++){
	var pos = string_pos(string_char_at(hex,digit),"0123456789ABCDEF");
	if(pos){
		dec = (dec<<4)|(pos-1);
	}
}
return dec;

#define sk_ik_apply
/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param alpha
var sk_bone = argument0;
var sk_parent = sk_bone[SK_BONE.parent];
// confirm applied state
if(sk_bone[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_bone);
}
// get bone data
var sk_bone_ax = sk_bone[SK_BONE.XApplied];
var sk_bone_ay = sk_bone[SK_BONE.YApplied];
var sk_bone_axscale = sk_bone[SK_BONE.XScaleApplied];
var sk_bone_ayscale = sk_bone[SK_BONE.YScaleApplied];
var sk_bone_axshear = sk_bone[SK_BONE.XShearApplied];
var sk_bone_ayshear = sk_bone[SK_BONE.YShearApplied];
var sk_bone_arotation = sk_bone[SK_BONE.rotationApplied];
// calculate the parent's inverse rotation matrix
var sk_parent_m00 = sk_parent[SK_BONE.m00];
var sk_parent_m01 = sk_parent[SK_BONE.m01];
var sk_parent_m10 = sk_parent[SK_BONE.m10];
var sk_parent_m11 = sk_parent[SK_BONE.m11];
var sk_determinant = sk_parent_m00*sk_parent_m11 - sk_parent_m01*sk_parent_m10;
if(abs(sk_determinant)<0.001){
	// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
	return;
}
sk_determinant = 1/sk_determinant;
var sk_im00 = sk_parent_m11*sk_determinant;
var sk_im01 = -sk_parent_m01*sk_determinant;
var sk_im10 = -sk_parent_m10*sk_determinant;
var sk_im11 = sk_parent_m00*sk_determinant;
var sk_xx = argument1 - sk_parent[SK_BONE.XWorld];
var sk_yy = argument2 - sk_parent[SK_BONE.YWorld];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_bone_ax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_bone_ay;
// use local position to set new rotation
var sk_rotationIK = -darctan2(sk_ty,sk_tx)-sk_bone_arotation-sk_bone_axshear;
if(sk_bone_axscale<0){ // make sure whatever the scale the bone points towards the effector
	sk_rotationIK += 180;
}
// apply
sk_bone_updateWorldTransform_ext(
	sk_bone,
	sk_bone_ax,
	sk_bone_ay,
	sk_bone_axscale,
	sk_bone_ayscale,
	sk_bone_axshear,
	sk_bone_ayshear,
	sk_bone_arotation+sk_rotationIK*argument3,
	sk_transformMode_normal
);

#define sk_ik_apply_chain
/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param bendDir
/// @param alpha
var sk_child = argument0;
var sk_targetX = argument1;
var sk_targetY = argument2;
var sk_bendDir = argument3;
var sk_alpha = argument4;
var sk_parent = sk_child[SK_BONE.parent];
// confirm applied state
if(sk_parent[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_parent);
}
if(sk_child[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_child);
}
// child local transforms
var sk_cax = sk_child[SK_BONE.XApplied];
var sk_cay = sk_child[SK_BONE.YApplied];
var sk_caxscale = sk_child[SK_BONE.XScaleApplied];
var sk_cayscale = sk_child[SK_BONE.YScaleApplied];
var sk_caxshear = sk_child[SK_BONE.XShearApplied];
var sk_cayshear = sk_child[SK_BONE.YShearApplied];
var sk_carotation = sk_child[SK_BONE.rotationApplied];
// parent local transforms
var sk_pax = sk_parent[SK_BONE.XApplied];
var sk_pay = sk_parent[SK_BONE.YApplied];
var sk_paxscale = sk_parent[SK_BONE.XScaleApplied];
var sk_payscale = sk_parent[SK_BONE.YScaleApplied];
var sk_parotation = sk_parent[SK_BONE.rotationApplied]+sk_parent[SK_BONE.XShearApplied];
// get parent bone's parent bone's inverse matrix
var sk_parentparent = sk_parent[SK_BONE.parent];
var sk_pp_m00 = sk_parentparent[SK_BONE.m00];
var sk_pp_m01 = sk_parentparent[SK_BONE.m01];
var sk_pp_m10 = sk_parentparent[SK_BONE.m10];
var sk_pp_m11 = sk_parentparent[SK_BONE.m11];
var sk_determinant = sk_pp_m00*sk_pp_m11 - sk_pp_m01*sk_pp_m10;
if(abs(sk_determinant)<0.001){
	// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
	return;
}
sk_determinant = 1/sk_determinant;
var sk_im00 = sk_pp_m11*sk_determinant;
var sk_im01 = -sk_pp_m01*sk_determinant;
var sk_im10 = -sk_pp_m10*sk_determinant;
var sk_im11 = sk_pp_m00*sk_determinant;
var sk_xx = sk_targetX - sk_parentparent[SK_BONE.XWorld];
var sk_yy = sk_targetY - sk_parentparent[SK_BONE.YWorld];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_pax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_pay;
// determine whether the parent bone is of uniform scale
var sk_uniform = abs(sk_paxscale-sk_payscale) <= 0.01;
if(true){
	sk_payscale = sk_paxscale;
	// calculate bone lengths
	var sk_lena = abs(point_distance(0,0,sk_cax,sk_cay)*sk_paxscale);
	var sk_lenb = abs(sk_child[SK_BONE.length]*sk_caxscale*sk_paxscale);
	// set rotations
	var sk_rotb = sk_ik_calculate_b(sk_tx,sk_ty,sk_lena,sk_lenb,sk_bendDir);
	var sk_rota = sk_ik_calculate_a(sk_tx,sk_ty,sk_lena,sk_lenb,sk_rotb);
	// apply
	var sk_offsetShear = -darctan2(sk_cay,sk_cax);
	var sk_rotationIK = angle_difference(sk_rota-sk_offsetShear,sk_parotation);
	if(sk_paxscale<0){
		sk_rotationIK += 180;
	}
	sk_bone_updateWorldTransform_ext(sk_parent,sk_pax,sk_pay,sk_paxscale,sk_payscale,0,0,sk_parotation+sk_rotationIK*sk_alpha,sk_transformMode_normal);
	sk_rotationIK = sk_rotb+sk_offsetShear-sk_carotation-sk_caxshear;
	if(sk_caxscale<0){
		sk_rotationIK += 180;
	}
	sk_bone_updateWorldTransform_ext(sk_child,sk_cax,sk_cay,sk_caxscale,sk_cayscale,sk_caxshear,sk_cayshear,sk_carotation+sk_rotationIK*sk_alpha,sk_transformMode_normal);
}

#define sk_ik_apply_chain_other
/// @desc allows for IK to performed between two bones which don't share a parent-child relationship
/// @param bone
/// @param targetx
/// @param targety
/// @param bendDir
/// @param alpha
/// @param parent
var sk_parent = argument0[SK_BONE.parent];
// set temporary parent
argument0[@ SK_BONE.parent] = argument5;
argument0[@ SK_BONE.badApplied] = true; // this induces a change in the child's applied transform relative to the new parent
// update bone with new transforms
sk_ik_apply_chain(argument0,argument1,argument2,argument3,argument4);
// revert parent
argument0[@ SK_BONE.parent] = sk_parent;
// set to bad applied since the parent changed
argument0[@ SK_BONE.badApplied] = true;

#define sk_ik_calculate_a
gml_pragma("forceinline");
/// @desc returns parent ik angle
/// @param x
/// @param y
/// @param l1
/// @param l2
/// @param b
return(-darctan2(argument1,argument0) - darctan2(argument3*dsin(argument4),argument2+argument3*dcos(argument4)));

#define sk_ik_calculate_b
gml_pragma("forceinline");
/// @desc returns child ik angle
/// @param x
/// @param y
/// @param l1
/// @param l2
/// @param bendDir
return(darccos(clamp( (argument0*argument0 + argument1*argument1 - argument2*argument2 - argument3*argument3)/max(2*argument2*argument3,0.01) ,-1,1))*-argument4);

#define sk_list_search_binary
/// @desc search for an index
/// @param id
/// @param value
/// @param step
/// @param min
/// @param max
var MIN = argument3 div argument2;
var MAX = argument4 div argument2;
var low = MIN;
var high = MAX;
if(high<1){ return low; }
while(low<=high){
	var mid = (low+high)>>1; // find average
	//show_message(string(high)+" "+string(low)+" "+string(mid));
	var val = argument0[| mid*argument2];
	if(val>argument1){
		high = mid-1;
	} else if(val<argument1){
		low = mid+1;
	} else {
		return mid*argument2;
	}
}
return max(low*argument2 - argument2,0);

#define sk_list_search_linear
/// @desc search for an index
/// @param id
/// @param value
/// @param step
/// @param min
/// @param max
var frame_id = argument3;
for(; frame_id < argument4; frame_id+=argument2){
	if(argument0[| frame_id] > argument1){
		return max(frame_id-argument2,0);
	}
}
return max(frame_id-argument2,0);

#define sk_list_shift
#macro sk_shift_back -9223372036854775808 /* signed 64 bit integer limit (min) */
#macro sk_shift_front 9223372036854775807 /* signed 64 bit integer limit (max) */
/// @desc shifts a value within a ds_list by x units (this doesn't retain nested list data)
/// @param id
/// @param pos
/// @param x
var pos = argument1;
var pos_min = 0;
var pos_max = ds_list_size(argument0)-1;
if((pos<pos_min)||(pos>pos_max)){
	return;
}
var item = argument0[| pos];
ds_list_delete(argument0,pos);
if(argument2==undefined){ return; }
var pos_new = clamp(pos+argument2,pos_min,pos_max);
if(pos_new==pos_max){
	ds_list_add(argument0,item);
} else {
	ds_list_insert(argument0,pos_new,item);
}

#define sk_list_shift_list
#macro sk_tuple_itemOffset_item 0
#macro sk_tuple_itemOffset_offset 1
#macro sk_tuple_itemOffset_ENTRIES 2
/// @desc shifts data in an update cache using the supplied tuple
/// @param id
/// @param itemOffsetTuple
var sk_tuple = argument1;
var sk_tuple_last = ds_list_size(sk_tuple);
var sk_tuple_id;
for(sk_tuple_id = 0; sk_tuple_id < sk_tuple_last; sk_tuple_id+=sk_tuple_itemOffset_ENTRIES){
	var sk_tuple_value = sk_tuple[| sk_tuple_id+sk_tuple_itemOffset_item];
	var sk_tuple_shift = sk_tuple[| sk_tuple_id+sk_tuple_itemOffset_offset];
	var sk_tuple_value_index = ds_list_find_index(argument0,sk_tuple_value);
	if(sk_tuple_value_index!=-1){
		// shift value
		sk_list_shift(argument0,sk_tuple_value_index,sk_tuple_shift);
	}
}

#define sk_list_sort_bone
/// @desc sort bones in hierarchy
/// @param id
/// @param bone
if(sk_struct_isof(argument1,sk_type_bone)){
	var sk_bone_id = ds_list_find_index(argument0,argument1);
	if(sk_bone_id==-1){
		// not sorted
		var sk_boneParent = argument1[SK_BONE.parent];
		// sort parent
		sk_list_sort_bone(argument0,sk_boneParent);
		// add current bone to cache
		ds_list_add(argument0,argument1);
	} // else bone is already sorted
}

#define sk_list_sort_constraint_hierarchy
/// @desc sorts the parent bones in the map before the child so their transforms are ready to be inherited on demand
/// @param updateOrder
/// @param constraint
if(sk_struct_isof(argument1,sk_type_constraint_hierarchy)){
	var sk_availableTuples = argument1[SK_CONSTRAINT_HIERARCHY.boneParentTuples];
	var sk_count = ds_map_size(sk_availableTuples);
	var sk_key = ds_map_find_first(sk_availableTuples);
	repeat(sk_count){
		var sk_tuple = sk_availableTuples[? sk_key];
		if(is_real(sk_tuple)&&ds_exists(sk_tuple,ds_type_list)){
			var sk_tuple_last = ds_list_size(sk_tuple);
			var sk_tuple_id;
			for(sk_tuple_id = 0; sk_tuple_id < sk_tuple_last; sk_tuple_id+=sk_tuple_boneParent_ENTRIES){
				// sort all the bones in the current tuple
				sk_list_sort_bone(argument0,sk_tuple[| sk_tuple_id+sk_tuple_boneParent_bone]);
			}
		}
		// goto next tuple
		sk_key = ds_map_find_next(sk_availableTuples,sk_key);
	}
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}

#define sk_list_sort_constraint_ik
/// @desc sort end effector, so that its world transform is calculated before the joint (forward kinematics)
/// @param id
/// @param constraint
if(sk_struct_isof(argument1,sk_type_constraint_ik)){
	var sk_bone_effector = argument1[SK_CONSTRAINT_IK.boneEffector];
	var sk_bone_joint = argument1[SK_CONSTRAINT_IK.boneJoint];
	sk_list_sort_bone(argument0,sk_bone_effector);
	sk_list_sort_bone(argument0,sk_bone_joint);
	// add final IK constraint to cache
	ds_list_add(argument0,argument1);
}

#define sk_list_sort_constraint_physics
/// @desc sorts the parent bones in the map before the child so their transforms are ready to be inherited on demand
/// @param updateOrder
/// @param constraint
if(sk_struct_isof(argument1,sk_type_constraint_physics)){
	var sk_boneSystem = argument1[SK_CONSTRAINT_PHYSICS.boneSystem];
	var sk_bone_count = ds_list_size(sk_boneSystem);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		sk_list_sort_bone(argument0,sk_boneSystem[| sk_bone_id]);
	}
	// sort effectors
	sk_list_sort_bone(argument0,argument1[SK_CONSTRAINT_PHYSICS.boneAnchor]);
	sk_list_sort_bone(argument0,argument1[SK_CONSTRAINT_PHYSICS.boneEffector]);
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}

#define sk_list_sort_constraint_transform
/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param id
/// @param constraint
if(sk_struct_isof(argument1,sk_type_constraint_transform)){
	var sk_bone_target = argument1[SK_CONSTRAINT_TRANSFORM.boneTarget];
	var sk_bones = argument1[SK_CONSTRAINT_TRANSFORM.boneChildren];
	sk_list_sort_bone(argument0,sk_bone_target);
	// sort child bones
	var sk_bone_count = ds_list_size(sk_bones);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		var sk_bone_child = sk_bones[| sk_bone_id];
		sk_list_sort_bone(argument0,sk_bone_child);
	}
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}

#define sk_region_create
#macro sk_type_region sk_region_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_REGION{
	uv_ULX,uv_ULY,
	uv_URX,uv_URY,
	uv_BLX,uv_BLY,
	uv_BRX,uv_BRY,
	ox,oy,width,height,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_REGION.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_region,argument0,
	-1, // setup script
	-1, // apply script
	"sk_region_destroy" // destruction script
);
// set default property values
sk_region_set_uvs(sk_struct,0,0,1,1,0,0,1,1,0);
// return to caller
return sk_struct;

#define sk_region_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
if(array_unhook_sk_structure(argument0)){
	// nothin'
}

#define sk_region_get_uvs
/// @desc gets the UV data for the region
/// @param region
return [
	argument0[SK_REGION.uv_ULX],argument0[SK_REGION.uv_ULY],
	argument0[SK_REGION.uv_URX],argument0[SK_REGION.uv_URY],
	argument0[SK_REGION.uv_BLX],argument0[SK_REGION.uv_BLY],
	argument0[SK_REGION.uv_BRX],argument0[SK_REGION.uv_BRY],
	argument0[SK_REGION.ox],argument0[SK_REGION.oy],
	argument0[SK_REGION.width],argument0[SK_REGION.height]
];

#define sk_region_set_uvs
/// @desc sets the UV data for the region
/// @param region
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param ox
/// @param oy
/// @param w
/// @param h
/// @param rotation
var uv_left = clamp(argument1,0,1);
var uv_top = clamp(argument2,0,1);
var uv_right = clamp(argument3,0,1);
var uv_bottom = clamp(argument4,0,1);
var uv_ox = argument5;
var uv_oy = argument6;
var uv_width = argument7;
var uv_height = argument8;
switch(floor((angle_difference(argument9+45,0))/90)){
	case -2:
		// rotate 180 degrees
		argument0[@ SK_REGION.uv_ULX] = uv_right;
		argument0[@ SK_REGION.uv_ULY] = uv_bottom;
		argument0[@ SK_REGION.uv_URX] = uv_left;
		argument0[@ SK_REGION.uv_URY] = uv_bottom;
		argument0[@ SK_REGION.uv_BLX] = uv_right;
		argument0[@ SK_REGION.uv_BLY] = uv_top;
		argument0[@ SK_REGION.uv_BRX] = uv_left;
		argument0[@ SK_REGION.uv_BRY] = uv_top;
	break;
	case -1:
		// rotate 90 degrees clockwise
		argument0[@ SK_REGION.uv_ULX] = uv_right;
		argument0[@ SK_REGION.uv_ULY] = uv_top;
		argument0[@ SK_REGION.uv_URX] = uv_right;
		argument0[@ SK_REGION.uv_URY] = uv_bottom;
		argument0[@ SK_REGION.uv_BLX] = uv_left;
		argument0[@ SK_REGION.uv_BLY] = uv_top;
		argument0[@ SK_REGION.uv_BRX] = uv_left;
		argument0[@ SK_REGION.uv_BRY] = uv_bottom;
	break;
	case 0:
		// no rotation
		argument0[@ SK_REGION.uv_ULX] = uv_left;
		argument0[@ SK_REGION.uv_ULY] = uv_top;
		argument0[@ SK_REGION.uv_URX] = uv_right;
		argument0[@ SK_REGION.uv_URY] = uv_top;
		argument0[@ SK_REGION.uv_BLX] = uv_left;
		argument0[@ SK_REGION.uv_BLY] = uv_bottom;
		argument0[@ SK_REGION.uv_BRX] = uv_right;
		argument0[@ SK_REGION.uv_BRY] = uv_bottom;
	break;
	case 1:
		// rotate 90 degrees counter clockwise
		argument0[@ SK_REGION.uv_ULX] = uv_left;
		argument0[@ SK_REGION.uv_ULY] = uv_bottom;
		argument0[@ SK_REGION.uv_URX] = uv_left;
		argument0[@ SK_REGION.uv_URY] = uv_top;
		argument0[@ SK_REGION.uv_BLX] = uv_right;
		argument0[@ SK_REGION.uv_BLY] = uv_bottom;
		argument0[@ SK_REGION.uv_BRX] = uv_right;
		argument0[@ SK_REGION.uv_BRY] = uv_top;
	break;
}
argument0[@ SK_REGION.ox] = uv_ox;
argument0[@ SK_REGION.oy] = uv_oy;
argument0[@ SK_REGION.width] = uv_width;
argument0[@ SK_REGION.height] = uv_height;

#define sk_region_set_uvs_direct
/// @desc sets the UV data for the region (this may result is affine distortion if opposite edges are not parallel)
/// @param region
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param u3
/// @param v3
/// @param u4
/// @param v4
/// @param ox
/// @param oy
/// @param w
/// @param h
argument0[@ SK_REGION.uv_ULX] = clamp(argument1,0,1); // defined in a clockwise motion
argument0[@ SK_REGION.uv_ULY] = clamp(argument2,0,1);
argument0[@ SK_REGION.uv_URX] = clamp(argument3,0,1);
argument0[@ SK_REGION.uv_URY] = clamp(argument4,0,1);
argument0[@ SK_REGION.uv_BRX] = clamp(argument5,0,1);
argument0[@ SK_REGION.uv_BRY] = clamp(argument6,0,1);
argument0[@ SK_REGION.uv_BLX] = clamp(argument7,0,1);
argument0[@ SK_REGION.uv_BLY] = clamp(argument8,0,1);
argument0[@ SK_REGION.ox] = argument9; // this is relative to the top left of the region in world coordinates
argument0[@ SK_REGION.oy] = argument10;
argument0[@ SK_REGION.width] = argument11;
argument0[@ SK_REGION.height] = argument12;

#define sk_skin_apply
/// @desc Attachments from the new skin are attached to the corresponding slots in the form of a list known as the "displayData"
/// @param skin
/// @param clear
var sk_displays = argument0[SK_SKIN.displays];
var sk_remaps = argument0[SK_SKIN.remaps];
var sk_remapStack = argument0[SK_SKIN.remapStack];
var sk_display_last = ds_list_size(sk_displays);
var sk_display_id;
if(argument1){
	// clear previous slot attachments
	for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_tuple_skinRecord_ENTRIES){
		var sk_slot = sk_displays[| sk_display_id+sk_tuple_skinRecord_slot];
		sk_slot_clear_attachments(sk_slot);
	}
}
// add new attachments
for(sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_tuple_skinRecord_ENTRIES){
	var sk_slot = sk_displays[| sk_display_id+sk_tuple_skinRecord_slot];
	var sk_attachment = sk_displays[| sk_display_id+sk_tuple_skinRecord_attachment];
	var sk_attachmentKey = sk_displays[| sk_display_id+sk_tuple_skinRecord_attachmentKey];
	// remap attachment
	var sk_remap_count = ds_list_size(sk_remapStack);
	var sk_attachment_input = sk_attachment;
	for(var sk_remap_id = 0; sk_remap_id < sk_remap_count; sk_remap_id++){
		var sk_remap = sk_remaps[? sk_remapStack[| sk_remap_id]];
		if(is_real(sk_remap)&&ds_exists(sk_remap,ds_type_map)){
			if(ds_map_exists(sk_remap,sk_attachment_input)){
				// update attachment
				sk_attachment = sk_remap[? sk_attachment_input];
			}	// otherwise ignore remap
		}
	}
	// add final attachment to slot
	sk_slot_add_attachment(sk_slot,sk_attachmentKey,sk_attachment);
}

#define sk_skin_create
#macro sk_type_skin sk_skin_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_SKIN{
	displays,
	remaps,remapStack,
	sizeof
}
#macro sk_tuple_skinRecord_slot 0 /* this could be a slot, but it could also be a symbol */
#macro sk_tuple_skinRecord_attachment 1
#macro sk_tuple_skinRecord_attachmentKey 2
#macro sk_tuple_skinRecord_ENTRIES 3
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_SKIN.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_skin,argument0,
	-1, // setup script
	"sk_skin_apply", // apply script
	"sk_skin_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_SKIN.displays] = ds_list_create();
sk_struct[@ SK_SKIN.remaps] = ds_map_create();
sk_struct[@ SK_SKIN.remapStack] = ds_list_create();
// return to caller
return sk_struct;

#define sk_skin_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param skin
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_list_destroy(argument0[SK_SKIN.displays]);
	ds_map_destroy(argument0[SK_SKIN.remaps]);
	ds_list_destroy(argument0[SK_SKIN.remapStack]);
}

#define sk_skin_record_add
/// @desc append display data to the skin
/// @param skin
/// @param slotOrSymbol
/// @param attachment
/// @param key
var sk_slot;
if(sk_struct_exists(argument1)){
	switch(sk_struct_get_type(argument1)){
		case sk_type_slot: sk_slot = argument1; break;
		case sk_type_symbol: sk_slot = sk_symbol_get_nested_slot(argument1); break;
		default: return; break;
	}
	var sk_displays = argument0[SK_SKIN.displays];
	var sk_id = max(ds_list_size(sk_displays) div sk_tuple_skinRecord_ENTRIES,0)*sk_tuple_skinRecord_ENTRIES; // make sure it is a multiple of the record length
	sk_displays[| sk_id+sk_tuple_skinRecord_slot] = sk_slot;
	sk_displays[| sk_id+sk_tuple_skinRecord_attachment] = argument2;
	sk_displays[| sk_id+sk_tuple_skinRecord_attachmentKey] = argument3;
}

#define sk_skin_record_exists
/// @desc determines whether the record exists
/// @param skin
/// @param slotOrSymbol
/// @param key
var sk_slot = noone;
switch(sk_struct_get_type(argument1)){
	case sk_type_slot: sk_slot = argument1; break;
	case sk_type_symbol: sk_slot = sk_symbol_get_nested_slot(argument1); break;
}
var sk_displays = argument0[SK_SKIN.displays];
var sk_display_last = ds_list_size(sk_displays);
for(var sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_tuple_skinRecord_ENTRIES){
	if(
		(sk_displays[| sk_display_id+sk_tuple_skinRecord_slot]==sk_slot)&&
		(sk_displays[| sk_display_id+sk_tuple_skinRecord_attachmentKey]==argument2)
	){	// record exists
		return true;
	}
}
return false;

#define sk_skin_remaps_add
/// @desc adds a map to the available remaps
/// @param skin
/// @param ds_map
/// @param key
ds_map_add_map(argument0[SK_SKIN.remaps],argument2,argument1);

#define sk_skin_remaps_clear
/// @desc clears the remap stack
/// @param skin
ds_list_clear(argument0[SK_SKIN.remapStack]);

#define sk_skin_remaps_push
/// @desc pushes the remap to the skins stack
/// @param skin
/// @param key
var sk_skin_remapStack = argument0[SK_SKIN.remapStack];
var sk_remap_id = ds_list_find_index(sk_skin_remapStack,argument1);
if(sk_remap_id!=-1){
	// item already exists, remove it so it can be added to the top
	ds_list_delete(sk_skin_remapStack,sk_remap_id);
}
// add item to top of stack
ds_list_add(sk_skin_remapStack,argument1);

#define sk_slot_add_attachment
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
/// @param key
/// @param attachment
return ds_map_set(argument0[SK_SLOT.availableAttachments],argument1,argument2);

#define sk_slot_clear_attachments
/// @desc purges the slot display data
/// @param slot
ds_map_clear(argument0[SK_SLOT.availableAttachments]);

#define sk_slot_create
#macro sk_type_slot sk_slot_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_SLOT{
	availableAttachments,defaultAttachmentKey,
	colour,alpha,bone,attachment,
	colourFinal,alphaFinal,boneFinal,attachmentFinal,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = array_create(SK_SLOT.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_slot,argument0,
	"sk_slot_setToSetupPose", // setup script
	-1, // apply script
	"sk_slot_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_SLOT.availableAttachments] = ds_map_create(); // create a map for storing attachment data
// set default property values
sk_slot_set_defaultDisplay(sk_struct,undefined);
sk_slot_set_colour(sk_struct,$ffffff,1);
sk_slot_set_bone(sk_struct,argument1);
sk_slot_set_attachment(sk_struct,noone);
// apply transforms
sk_slot_setToDefaultDisplay(sk_struct);
sk_slot_setToSetupPose(sk_struct);
// return to caller
return sk_struct;

#define sk_slot_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param slot
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_map_destroy(argument0[SK_SLOT.availableAttachments]); // dispose of attachment map
}

#define sk_slot_find_attachment
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
/// @param key
return ds_map_find_value(argument0[SK_SLOT.availableAttachments],argument1);

#define sk_slot_get_alpha
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.alpha];

#define sk_slot_get_alpha_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.alphaFinal];

#define sk_slot_get_attachment
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.attachment];

#define sk_slot_get_attachment_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.attachmentFinal];

#define sk_slot_get_bone
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.bone];

#define sk_slot_get_bone_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.boneFinal];

#define sk_slot_get_colour
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.colour];

#define sk_slot_get_colour_final
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.colourFinal];

#define sk_slot_get_defaultDisplay
gml_pragma("forceinline");
/// @desc gets a property
/// @param slot
return argument0[SK_SLOT.defaultAttachmentKey];

#define sk_slot_setToDefaultDisplay
/// @desc sets the default attachment display
/// @param slot
argument0[@ SK_SLOT.attachment] = ds_map_find_value(argument0[SK_SLOT.availableAttachments],argument0[SK_SLOT.defaultAttachmentKey]);

#define sk_slot_setToSetupPose
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied slot
/// @param slot
argument0[@ SK_SLOT.colourFinal] = argument0[SK_SLOT.colour];
argument0[@ SK_SLOT.alphaFinal] = argument0[SK_SLOT.alpha];
argument0[@ SK_SLOT.attachmentFinal] = argument0[SK_SLOT.attachment];
argument0[@ SK_SLOT.boneFinal] = argument0[SK_SLOT.bone];

#define sk_slot_set_attachment
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param attachment
argument0[@ SK_SLOT.attachment] = argument1;

#define sk_slot_set_attachment_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param attachment
argument0[@ SK_SLOT.attachmentFinal] = argument1;

#define sk_slot_set_bone
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param bone
argument0[@ SK_SLOT.bone] = argument1;

#define sk_slot_set_bone_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param bone
argument0[@ SK_SLOT.boneFinal] = argument1;

#define sk_slot_set_colour
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param colour
/// @param alpha
argument0[@ SK_SLOT.colour] = real(argument1);
argument0[@ SK_SLOT.alpha] = real(argument2);

#define sk_slot_set_colour_final
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param colour
/// @param alpha
argument0[@ SK_SLOT.colourFinal] = real(argument1);
argument0[@ SK_SLOT.alphaFinal] = real(argument1);

#define sk_slot_set_defaultDisplay
gml_pragma("forceinline");
/// @desc sets a property
/// @param slot
/// @param key
argument0[@ SK_SLOT.defaultAttachmentKey] = argument1;

#define sk_struct_destroy
/// @desc calls the destructor script on a supplied structure
/// @param struct
var sk_scr_id = sk_struct_get_destroy_script(argument0);
if(sk_scr_id!=-1){ // the function will always return -1 if the script doesnt exist
	// call script with structure as an argument
	script_execute(sk_scr_id,argument0);
} else {
	// if the structure wasn't destroyed (the script doesn't exist) unhook the struct manually
	array_unhook_sk_structure(argument0);
}

#define sk_struct_exists
gml_pragma("forceinline");
/// @desc returns whether the struct exists
/// @param struct
return is_array(argument0)&&(array_height_2d(argument0)!=1)&&argument0[1,SK_STRUCT_H.parity];

#define sk_struct_get_apply_script
gml_pragma("forceinline");
/// @desc returns a script id
/// @param struct
return argument0[1,SK_STRUCT_H.scr_apply];

#define sk_struct_get_destroy_script
gml_pragma("forceinline");
/// @desc returns a script id
/// @param struct
return argument0[1,SK_STRUCT_H.scr_destroy];

#define sk_struct_get_name
gml_pragma("forceinline");
/// @desc returns the name of the structure
/// @param struct
return argument0[1,SK_STRUCT_H.name];

#define sk_struct_get_setup_script
gml_pragma("forceinline");
/// @desc returns a script id
/// @param struct
return argument0[1,SK_STRUCT_H.scr_setup];

#define sk_struct_get_type
gml_pragma("forceinline");
/// @desc returns the type of skeleton data if it exists
/// @param struct
return argument0[1,SK_STRUCT_H.type];

#define sk_struct_isof
/// @desc returns whether the structure exists and is of a supplied type
/// @param struct
/// @param sk_type
return sk_struct_exists(argument0)&&(sk_struct_get_type(argument0)==argument1);

#define sk_struct_protect
/// @desc protects a structure from being deleted
/// @param struct
/// @param guardian
if(!sk_struct_protected(argument0)){
	argument0[1,SK_STRUCT_H.protector] = argument1;
}

#define sk_struct_protected
/// @desc returns whether a structure is protected
/// @param struct
return sk_struct_exists(argument0[1,SK_STRUCT_H.protector]);

#define sk_struct_set_apply_script
gml_pragma("forceinline");
/// @desc sets a structure script
/// @param struct
/// @param script_id_or_name
var sk_scr_id = is_real(argument1) ? argument1 : asset_get_index(string(argument1));
argument0[@ 1,SK_STRUCT_H.scr_apply] = script_exists(sk_scr_id) ? sk_scr_id : -1;

#define sk_struct_set_destroy_script
gml_pragma("forceinline");
/// @desc sets a structure script
/// @param struct
/// @param script_id_or_name
var sk_scr_id = is_real(argument1) ? argument1 : asset_get_index(string(argument1));
argument0[@ 1,SK_STRUCT_H.scr_destroy] = script_exists(sk_scr_id) ? sk_scr_id : -1;

#define sk_struct_set_name
gml_pragma("forceinline");
/// @desc returns the name of the structure
/// @param struct
/// @param name
argument0[@ 1,SK_STRUCT_H.name] = string(argument1);

#define sk_struct_set_setup_script
gml_pragma("forceinline");
/// @desc sets a structure script
/// @param struct
/// @param script_id_or_name
var sk_scr_id = is_real(argument1) ? argument1 : asset_get_index(string(argument1));
argument0[@ 1,SK_STRUCT_H.scr_setup] = script_exists(sk_scr_id) ? sk_scr_id : -1;

#define sk_symbol_create
#macro sk_type_symbol sk_symbol_create
enum SK_SYMBOL{
	NESTED_BONE,NESTED_SLOT,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = array_create(SK_SYMBOL.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_symbol,argument0,
	"sk_symbol_setToSetupPose", // setup script
	"sk_symbol_updateWorldTransform", // apply script
	"sk_symbol_destroy" // destruction script
);
// create dynamic data structures
var sk_bone = sk_bone_create("%B",argument1); sk_struct_protect(sk_bone,sk_struct); sk_struct[@ SK_SYMBOL.NESTED_BONE] = sk_bone;
var sk_slot = sk_slot_create("%S",noone); sk_struct_protect(sk_slot,sk_struct); sk_struct[@ SK_SYMBOL.NESTED_SLOT] = sk_slot;
// return to caller
return sk_struct;

#define sk_symbol_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param symbol
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	sk_bone_destroy(argument0[SK_SYMBOL.NESTED_BONE]);
	sk_slot_destroy(argument0[SK_SYMBOL.NESTED_SLOT]);
}

#define sk_symbol_get_nested_bone
gml_pragma("forceinline");
/// @desc returns the nested bone data type (DO NOT DELETE THIS)
/// @param symbol
return argument0[SK_SYMBOL.NESTED_BONE];

#define sk_symbol_get_nested_slot
gml_pragma("forceinline");
/// @desc returns the nested slot data type (DO NOT DELETE THIS)
/// @param symbol
return argument0[SK_SYMBOL.NESTED_SLOT];

#define sk_symbol_setToDefaultDisplay
/// @desc sets the default attachment display
/// @param symbol
sk_slot_setToDefaultDisplay(argument0[SK_SYMBOL.NESTED_SLOT]);

#define sk_symbol_setToSetupPose
gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied symbol
/// @param symbol
sk_bone_setToSetupPose(argument0[SK_SYMBOL.NESTED_BONE]);
sk_slot_setToSetupPose(argument0[SK_SYMBOL.NESTED_SLOT]);

#define sk_symbol_updateWorldTransform
gml_pragma("forceinline");
/// @desc update world transform of supplied symbol
/// @param symbol
sk_bone_updateWorldTransform_other(
	argument0[SK_SYMBOL.NESTED_BONE],
	array_get(argument0[SK_SYMBOL.NESTED_SLOT],SK_SLOT.boneFinal)
);

#define sk_timeline_apply
/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param mixPose
/// @param alpha
/// @param loopTime (the duration of the timeline to loop)
var sk_target = argument0[SK_TIMELINE.target];
var sk_keyframes = argument0[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = argument0[SK_TIMELINE.keyframe_ENTRIES];
var sk_script_apply = argument0[SK_TIMELINE.keyframe_applyScript];
if(sk_script_apply!=-1){
	// compile frames
	var sk_time = argument1;
	var sk_timeLast = argument2;
	var sk_mixPose = argument3;
	var sk_alpha = argument4;
	var sk_loopTime = argument5;
	// get current and future frame ids
	var sk_keyframe_first = 0;
	var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES;
	var sk_keyframe = sk_list_search_binary(sk_keyframes,sk_time,sk_keyframe_ENTRIES,sk_keyframe_first,sk_keyframe_last);
	var sk_keyframe_next = min(sk_keyframe+sk_keyframe_ENTRIES,sk_keyframe_last);
	// get times
	var sk_keyframe_time = sk_keyframes[| sk_keyframe+sk_timeline_keyframe_time];
	var sk_keyframe_time_next = sk_keyframes[| sk_keyframe_next+sk_timeline_keyframe_time];
	var sk_keyframe_time_first = sk_keyframes[| sk_keyframe_first+sk_timeline_keyframe_time];
	var sk_keyframe_time_last = sk_keyframes[| sk_keyframe_last+sk_timeline_keyframe_time];
	// control looping state
	if(sk_loopTime>sk_keyframe_time_last){
		// loop back to the first keyframe
		if(sk_time>sk_keyframe_time_last){
			sk_keyframe_next = sk_keyframe_first;
			sk_keyframe_time_next = sk_loopTime+sk_keyframe_time_first;
		} else if(sk_time<sk_keyframe_time_first){
			sk_keyframe_next = sk_keyframe_first;
			sk_keyframe_time_next = sk_keyframe_time_first;
			sk_keyframe = sk_keyframe_last;
			sk_keyframe_time = -sk_loopTime+sk_keyframe_time_last;
		}
	}
	// submit
	script_execute(
		sk_script_apply,
		sk_keyframes, // keyframes
		sk_target, // target structure
		sk_time, // time
		sk_timeLast, // timeLast
		sk_keyframe, // frameA
		sk_keyframe_next, // frameB
		sk_keyframe_time, // frameA_time
		sk_keyframe_time_next, // frameB_time
		sk_mixPose, // mixPose
		sk_alpha // alpha
	);
}

#define sk_timeline_create
#macro sk_type_timeline sk_timeline_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_TIMELINE{
	target,keyframes,keyframe_ENTRIES,keyframe_applyScript,
	sizeof
}
#macro sk_timeline_keyframe_time 0
#macro sk_timeline_keyframe_body 1
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_TIMELINE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_timeline,argument0,
	-1, // setup script
	"sk_timeline_apply", // apply script
	"sk_timeline_destroy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_TIMELINE.keyframes] = ds_list_create(); // create a list for storing timeline data
// set default property values
sk_timeline_set_target(sk_struct,noone);
sk_timeline_set_alignment(sk_struct,sk_timeline_keyframe_body);
sk_timeline_set_apply_script(sk_struct,-1);
// return to caller
return sk_struct;

#define sk_timeline_create_colour
enum SK_TIMELINE_FRAMES_COLOUR{
	time = sk_timeline_keyframe_time,
	colour = sk_timeline_keyframe_body,
	alpha,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param slot
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_COLOUR.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_colour");
// return to caller
return sk_struct;

#define sk_timeline_create_display
enum SK_TIMELINE_FRAMES_DISPLAY{
	time = sk_timeline_keyframe_time,
	attachmentKey = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param slot
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_DISPLAY.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_display");
// return to caller
return sk_struct;

#define sk_timeline_create_draworder
enum SK_TIMELINE_FRAMES_DRAWORDER{
	time = sk_timeline_keyframe_time,
	itemOffsetTuple = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param armature
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_DRAWORDER.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_draworder");
// return to caller
return sk_struct;

#define sk_timeline_create_event
enum SK_TIMELINE_FRAMES_EVENT{
	time = sk_timeline_keyframe_time,
	bone = sk_timeline_keyframe_body,
	str,
	float,
	int,
	sound,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param event
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_EVENT.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_event");
// return to caller
return sk_struct;

#define sk_timeline_create_hierarchy
enum SK_TIMELINE_FRAMES_HIERARCHY{
	time = sk_timeline_keyframe_time,
	tupleKey = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param constraint
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_HIERARCHY.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_hierarchy");
// return to caller
return sk_struct;

#define sk_timeline_create_ik
enum SK_TIMELINE_FRAMES_IK{
	time = sk_timeline_keyframe_time,
	bendDir = sk_timeline_keyframe_body,
	weight,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param constraint
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_IK.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_ik");
// return to caller
return sk_struct;

#define sk_timeline_create_parent
enum SK_TIMELINE_FRAMES_PARENT{
	time = sk_timeline_keyframe_time,
	bone = sk_timeline_keyframe_body,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param slot
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_PARENT.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_parent");
// return to caller
return sk_struct;

#define sk_timeline_create_rotate
enum SK_TIMELINE_FRAMES_ROTATE{
	time = sk_timeline_keyframe_time,
	rotation = sk_timeline_keyframe_body,
	cycles,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_ROTATE.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_rotate");
// return to caller
return sk_struct;

#define sk_timeline_create_scale
enum SK_TIMELINE_FRAMES_SCALE{
	time = sk_timeline_keyframe_time,
	dx = sk_timeline_keyframe_body,
	dy,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_SCALE.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_scale");
// return to caller
return sk_struct;

#define sk_timeline_create_shear
enum SK_TIMELINE_FRAMES_SHEAR{
	time = sk_timeline_keyframe_time,
	dx = sk_timeline_keyframe_body,
	dy,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_SHEAR.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_shear");
// return to caller
return sk_struct;

#define sk_timeline_create_transform
enum SK_TIMELINE_FRAMES_TRANSFORM{
	time = sk_timeline_keyframe_time,
	translateMix = sk_timeline_keyframe_body,
	scaleMix,
	shearMix,
	rotateMix,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param constraint
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_TRANSFORM.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_transform");
// return to caller
return sk_struct;

#define sk_timeline_create_translate
enum SK_TIMELINE_FRAMES_TRANSLATE{
	time = sk_timeline_keyframe_time,
	dx = sk_timeline_keyframe_body,
	dy,
	tweenEasing,
	ENTRIES
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
var sk_struct = sk_timeline_create(argument0);
// set default property values
sk_timeline_set_target(sk_struct,argument1);
sk_timeline_set_alignment(sk_struct,SK_TIMELINE_FRAMES_TRANSLATE.ENTRIES);
sk_timeline_set_apply_script(sk_struct,"sk_frames_apply_translate");
// return to caller
return sk_struct;

#define sk_timeline_destroy
/// @desc deletes the supplied structure and unhooks its array
/// @param slot
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_list_destroy(argument0[SK_TIMELINE.keyframes]);
}

#define sk_timeline_destroy_colour
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_display
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_draworder
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_event
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_hierarchy
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_ik
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_parent
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_rotate
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_scale
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_shear
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_transform
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_destroy_translate
/// @desc a wrapper for sk_timeline_destroy
/// @param timeline
sk_timeline_destroy(argument0);

#define sk_timeline_frame_add
/// @desc adds a frame to a given timeline
/// @param timeline
/// @param time
/// @param [frameData
/// @param ...]
if(argument_count<2){
	// needs more attributes
	return;
}
var sk_timeline = argument[0];
var sk_time = argument[1];
var sk_keyframes = sk_timeline[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = sk_timeline[SK_TIMELINE.keyframe_ENTRIES];
if((argument_count-1)!=sk_keyframe_ENTRIES){
	// invalid frame data
	return;
}
var sk_keyframe_last = ds_list_size(sk_keyframes);
for(var sk_keyframe_id = 0; sk_keyframe_id < sk_keyframe_last; sk_keyframe_id+=sk_keyframe_ENTRIES){
	var sk_keyframe_time = sk_keyframes[| sk_keyframe_id+sk_timeline_keyframe_time];
	if(sk_keyframe_time==sk_time){
		// update current record
		for(var sk_entry = 1; sk_entry < sk_keyframe_ENTRIES; sk_entry++){
			sk_keyframes[| sk_keyframe_id+sk_timeline_keyframe_body+sk_entry-1] = argument[1+sk_entry];
		}
	} else if(sk_keyframe_time>sk_time){
		// insert new record
		for(var sk_entry = sk_keyframe_ENTRIES-1; sk_entry >= 1; sk_entry--){
			ds_list_insert(sk_keyframes,sk_keyframe_id,argument[1+sk_entry]);
		}	ds_list_insert(sk_keyframes,sk_keyframe_id,sk_time);
	} else {
		continue;
	}	return;
}
// append new record
ds_list_add(sk_keyframes,sk_time);
for(var sk_entry = 1; sk_entry < sk_keyframe_ENTRIES; sk_entry++){
	ds_list_add(sk_keyframes,argument[1+sk_entry]);
}

#define sk_timeline_frame_add_colour
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param colour
/// @param alpha
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4);

#define sk_timeline_frame_add_display
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param attachmentKey
sk_timeline_frame_add(argument0,argument1,argument2);

#define sk_timeline_frame_add_draworder
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param list
sk_timeline_frame_add(argument0,argument1,argument2);
sk_timeline_frame_mark_as(argument0,argument1,ds_type_list);

#define sk_timeline_frame_add_event
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define sk_timeline_frame_add_hierarchy
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param tupleKey
sk_timeline_frame_add(argument0,argument1,argument2);

#define sk_timeline_frame_add_ik
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param bendDir
/// @param weight
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4);

#define sk_timeline_frame_add_parent
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param bone
sk_timeline_frame_add(argument0,argument1,argument2);

#define sk_timeline_frame_add_rotate
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param rotation
/// @param cycles
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4);

#define sk_timeline_frame_add_scale
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param dx
/// @param dy
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4);

#define sk_timeline_frame_add_shear
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param dx
/// @param dy
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4);

#define sk_timeline_frame_add_transform
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param translateMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define sk_timeline_frame_add_translate
/// @desc a wrapper for sk_timeline_frame_add
/// @param timeline
/// @param time
/// @param dx
/// @param dy
/// @param tweenEasing
sk_timeline_frame_add(argument0,argument1,argument2,argument3,argument4);

#define sk_timeline_frame_mark_as
/// @desc marks a frame for a given timeline
/// @param timeline
/// @param time
/// @param [ds_type
/// @param ...]
if(argument_count<2){
	// needs more attributes
	return;
}
var sk_timeline = argument[0];
var sk_time = argument[1];
var sk_keyframes = sk_timeline[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = sk_timeline[SK_TIMELINE.keyframe_ENTRIES];
if((argument_count-1)!=sk_keyframe_ENTRIES){
	// invalid frame data
	return;
}
var sk_keyframe_last = ds_list_size(sk_keyframes);
for(var sk_keyframe_id = 0; sk_keyframe_id < sk_keyframe_last; sk_keyframe_id+=sk_keyframe_ENTRIES){
	var sk_keyframe_time = sk_keyframes[| sk_keyframe_id+sk_timeline_keyframe_time];
	if(sk_keyframe_time==sk_time){
		// update current record
		for(var sk_entry = 1; sk_entry < sk_keyframe_ENTRIES; sk_entry++){
			var sk_entry_pos = sk_keyframe_id+sk_timeline_keyframe_body+sk_entry-1;
			switch(argument[1+sk_entry]){
				case ds_type_list: ds_list_mark_as_list(sk_keyframes,sk_entry_pos); break;
				case ds_type_map: ds_list_mark_as_map(sk_keyframes,sk_entry_pos); break;
			}
		}
		return;
	}
}

#define sk_timeline_get_alignment
gml_pragma("forceinline");
/// @desc gets a property
/// @param timeline
return argument0[SK_TIMELINE.keyframe_ENTRIES];

#define sk_timeline_get_apply_script
gml_pragma("forceinline");
/// @desc gets a property
/// @param timeline
return argument0[SK_TIMELINE.keyframe_applyScript];

#define sk_timeline_get_target
gml_pragma("forceinline");
/// @desc gets a property
/// @param timeline
return argument0[SK_TIMELINE.target];

#define sk_timeline_set_alignment
gml_pragma("forceinline");
/// @desc sets a property
/// @param timeline
/// @param value
argument0[@ SK_TIMELINE.keyframe_ENTRIES] = max(real(argument1),sk_timeline_keyframe_body);

#define sk_timeline_set_apply_script
gml_pragma("forceinline");
/// @desc sets a property
/// @param timeline
/// @param value
var sk_scr_id = is_real(argument1) ? argument1 : asset_get_index(string(argument1));
argument0[@ SK_TIMELINE.keyframe_applyScript] = script_exists(sk_scr_id) ? sk_scr_id : -1;

#define sk_timeline_set_target
gml_pragma("forceinline");
/// @desc sets a property
/// @param timeline
/// @param value
argument0[@ SK_TIMELINE.target] = argument1;

#define sk_transformation_apply_absoluteLocal
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param boneParent
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
if(sk_bone[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_bone);
}
var sk_bone_ax = sk_bone[SK_BONE.XApplied];
var sk_bone_ay = sk_bone[SK_BONE.YApplied];
var sk_bone_axscale = sk_bone[SK_BONE.XScaleApplied];
var sk_bone_ayscale = sk_bone[SK_BONE.YScaleApplied];
var sk_bone_ayshear = sk_bone[SK_BONE.YShearApplied];
var sk_bone_arotation = sk_bone[SK_BONE.rotationApplied];
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone_ax = lerp(sk_bone_ax,sk_target[SK_BONE.XApplied]+argument2,sk_translateMix);
	sk_bone_ay = lerp(sk_bone_ay,sk_target[SK_BONE.YApplied]+argument3,sk_translateMix);
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone_axscale = lerp(sk_bone_axscale,sk_target[SK_BONE.XScaleApplied]+argument4,sk_scaleMix);
	sk_bone_ayscale = lerp(sk_bone_ayscale,sk_target[SK_BONE.YScaleApplied]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone_ayshear += -angle_difference(sk_bone_ayshear,sk_target[SK_BONE.YShearApplied]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone_arotation += -angle_difference(sk_bone_arotation,sk_target[SK_BONE.rotationApplied]+argument7)*sk_rotationMix;
}
// apply
sk_bone_updateWorldTransform_ext(
	sk_bone,
	sk_bone_ax,sk_bone_ay,
	sk_bone_axscale,sk_bone_ayscale,
	sk_bone[SK_BONE.XShearApplied],sk_bone_ayshear,
	sk_bone_arotation,
	sk_bone[SK_BONE.transformMode]
);

#define sk_transformation_apply_absoluteWorld
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param boneParent
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
var sk_updated = false;
// determine whether the target bone has a negative scale
var sk_target_m00 = sk_target[SK_BONE.m00];
var sk_target_m01 = sk_target[SK_BONE.m01];
var sk_target_m10 = sk_target[SK_BONE.m10];
var sk_target_m11 = sk_target[SK_BONE.m11];
var sk_target_reflect = ((sk_target_m00*sk_target_m11 - sk_target_m01*sk_target_m10)<=0) ? 1 : -1;
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	var sk_targetX = sk_target[SK_BONE.XWorld]+sk_target_m00*argument2+sk_target_m10*argument3;
	var sk_targetY = sk_target[SK_BONE.YWorld]+sk_target_m01*argument2+sk_target_m11*argument3;
	sk_bone[@ SK_BONE.XWorld] = lerp(sk_bone[SK_BONE.XWorld],sk_targetX,sk_translateMix);
	sk_bone[@ SK_BONE.YWorld] = lerp(sk_bone[SK_BONE.YWorld],sk_targetY,sk_translateMix);
	sk_updated = true;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	var sk_a = sk_bone[SK_BONE.m00];
	var sk_b = sk_bone[SK_BONE.m01];
	var sk_c = sk_bone[SK_BONE.m10];
	var sk_d = sk_bone[SK_BONE.m11];
	var sk_xscale = point_distance(0,0,sk_a,sk_b);
	var sk_yscale = point_distance(0,0,sk_c,sk_d);
	if(sk_xscale>0.001){ sk_xscale = lerp(1,(point_distance(0,0,sk_target_m00,sk_target_m01)+argument4)/sk_xscale,sk_scaleMix); }
	if(sk_yscale>0.001){ sk_yscale = lerp(1,(point_distance(0,0,sk_target_m10,sk_target_m11)+argument5)/sk_yscale,sk_scaleMix); }	
	sk_bone[@ SK_BONE.m00] = sk_a*sk_xscale;
	sk_bone[@ SK_BONE.m01] = sk_b*sk_xscale;
	sk_bone[@ SK_BONE.m10] = sk_c*sk_yscale;
	sk_bone[@ SK_BONE.m11] = sk_d*sk_yscale;
	sk_updated = true;
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	var sk_a = sk_bone[SK_BONE.m00];
	var sk_b = sk_bone[SK_BONE.m01];
	var sk_c = sk_bone[SK_BONE.m10];
	var sk_d = sk_bone[SK_BONE.m11];
	var sk_ashear = -angle_difference(-darctan2(sk_target_m11,sk_target_m10),-darctan2(sk_target_m01,sk_target_m00));
	var sk_bshear = -angle_difference(-darctan2(sk_d,sk_c),-darctan2(sk_b,sk_a));
	var sk_deltaShear = (-angle_difference(sk_ashear,sk_bshear)+argument6*sk_target_reflect)*sk_shearMix;
	var sk_cosine = dcos(sk_deltaShear);
	var sk_sine = -dsin(sk_deltaShear);
	sk_bone[@ SK_BONE.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ SK_BONE.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	var sk_a = sk_bone[SK_BONE.m00];
	var sk_b = sk_bone[SK_BONE.m01];
	var sk_c = sk_bone[SK_BONE.m10];
	var sk_d = sk_bone[SK_BONE.m11];
	var sk_deltaRotation = (-angle_difference(-darctan2(sk_target_m01,sk_target_m00),-darctan2(sk_b,sk_a))+argument7*sk_target_reflect)*sk_rotationMix;
	var sk_cosine = dcos(sk_deltaRotation);
	var sk_sine = -dsin(sk_deltaRotation);
	sk_bone[@ SK_BONE.m00] = sk_cosine*sk_a + sk_sine*sk_b;
	sk_bone[@ SK_BONE.m01] = -sk_sine*sk_a + sk_cosine*sk_b;
	sk_bone[@ SK_BONE.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ SK_BONE.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set flag
if(sk_updated){
	sk_bone[@ SK_BONE.badApplied] = true;
}

#define sk_transformation_apply_relativeLocal
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param boneParent
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
if(sk_bone[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_bone);
}
var sk_bone_ax = sk_bone[SK_BONE.XApplied];
var sk_bone_ay = sk_bone[SK_BONE.YApplied];
var sk_bone_axscale = sk_bone[SK_BONE.XScaleApplied];
var sk_bone_ayscale = sk_bone[SK_BONE.YScaleApplied];
var sk_bone_ayshear = sk_bone[SK_BONE.YShearApplied];
var sk_bone_arotation = sk_bone[SK_BONE.rotationApplied];
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone_ax += (sk_target[SK_BONE.XApplied]+argument2)*sk_translateMix;
	sk_bone_ay += (sk_target[SK_BONE.YApplied]+argument3)*sk_translateMix;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone_axscale *= lerp(1,sk_target[SK_BONE.XScaleApplied]+argument4,sk_scaleMix);
	sk_bone_ayscale *= lerp(1,sk_target[SK_BONE.YScaleApplied]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone_ayshear += (sk_target[SK_BONE.YShearApplied]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone_arotation += (sk_target[SK_BONE.rotationApplied]+argument7)*sk_rotationMix;
}
// apply
sk_bone_updateWorldTransform_ext(
	sk_bone,
	sk_bone_ax,sk_bone_ay,
	sk_bone_axscale,sk_bone_ayscale,
	sk_bone[SK_BONE.XShearApplied],sk_bone_ayshear,
	sk_bone_arotation,
	sk_bone[SK_BONE.transformMode]
);

#define sk_transformation_apply_relativeWorld
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param boneParent
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
var sk_updated = false;
// determine whether the target bone has a negative scale
var sk_target_m00 = sk_target[SK_BONE.m00];
var sk_target_m01 = sk_target[SK_BONE.m01];
var sk_target_m10 = sk_target[SK_BONE.m10];
var sk_target_m11 = sk_target[SK_BONE.m11];
var sk_target_reflect = ((sk_target_m00*sk_target_m11 - sk_target_m01*sk_target_m10)<=0) ? 1 : -1;
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	var sk_targetX = sk_target[SK_BONE.XWorld]+sk_target_m00*argument2+sk_target_m10*argument3;
	var sk_targetY = sk_target[SK_BONE.YWorld]+sk_target_m01*argument2+sk_target_m11*argument3;
	sk_bone[@ SK_BONE.XWorld] = sk_bone[SK_BONE.XWorld]+sk_targetX*sk_translateMix;
	sk_bone[@ SK_BONE.YWorld] = sk_bone[SK_BONE.YWorld]+sk_targetY*sk_translateMix;
	sk_updated = true;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	var sk_xscale = lerp(1,point_distance(0,0,sk_target_m00,sk_target_m01)+argument4,sk_scaleMix);
	var sk_yscale = lerp(1,point_distance(0,0,sk_target_m10,sk_target_m11)+argument5,sk_scaleMix);
	sk_bone[@ SK_BONE.m00] = sk_bone[SK_BONE.m00]*sk_xscale;
	sk_bone[@ SK_BONE.m01] = sk_bone[SK_BONE.m01]*sk_xscale;
	sk_bone[@ SK_BONE.m10] = sk_bone[SK_BONE.m10]*sk_yscale;
	sk_bone[@ SK_BONE.m11] = sk_bone[SK_BONE.m11]*sk_yscale;
	sk_updated = true;
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	var sk_deltaShear = (-angle_difference(-darctan2(sk_target_m11,sk_target_m10),-darctan2(sk_target_m01,sk_target_m00))-90+argument6*sk_target_reflect)*sk_shearMix;
	var sk_cosine = dcos(sk_deltaShear);
	var sk_sine = -dsin(sk_deltaShear);
	var sk_dx = sk_bone[SK_BONE.m10];
	var sk_dy = sk_bone[SK_BONE.m11];
	sk_bone[@ SK_BONE.m10] = sk_cosine*sk_dx + sk_sine*sk_dy;
	sk_bone[@ SK_BONE.m11] = -sk_sine*sk_dx + sk_cosine*sk_dy;
	sk_updated = true;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	var sk_deltaRotation = (-angle_difference(-darctan2(sk_target_m01,sk_target_m00),0)+argument7*sk_target_reflect)*sk_rotationMix;
	var sk_cosine = dcos(sk_deltaRotation);
	var sk_sine = -dsin(sk_deltaRotation);
	var sk_a = sk_bone[SK_BONE.m00];
	var sk_b = sk_bone[SK_BONE.m01];
	var sk_c = sk_bone[SK_BONE.m10];
	var sk_d = sk_bone[SK_BONE.m11];
	sk_bone[@ SK_BONE.m00] = sk_cosine*sk_a + sk_sine*sk_b;
	sk_bone[@ SK_BONE.m01] = -sk_sine*sk_a + sk_cosine*sk_b;
	sk_bone[@ SK_BONE.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ SK_BONE.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set flag
if(sk_updated){
	sk_bone[@ SK_BONE.badApplied] = true;
}

#define vertex_bake_armature
gml_pragma("global",@"
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_normal();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	global.sk_vformat_fullfat = vertex_format_end();
");
#macro sk_vertex_format global.sk_vformat_fullfat
/// @desc uses the supplied armature and atlas to build the supplied vertex buffer, then returns the ID of the texture page
/// @param armature
/// @param atlas
/// @param vbuff
var sk_armature_drawOrder = argument0[SK_ARMATURE.drawOrderFinal];
var sk_atlas_subtextures = argument1[SK_ATLAS.subTextureMap];
var sk_texture_UVLeft = argument1[SK_ATLAS.UV_left];
var sk_texture_UVTop = argument1[SK_ATLAS.UV_top];
var sk_texture_UVRight = argument1[SK_ATLAS.UV_right];
var sk_texture_UVBottom = argument1[SK_ATLAS.UV_bottom];
// build buffer
vertex_begin(argument2,sk_vertex_format);
#region // create vertices
var sk_slot_count = ds_list_size(sk_armature_drawOrder); var sk_slot_id, sk_slot;
for(sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
	sk_slot = sk_armature_drawOrder[| sk_slot_id];
	var sk_attachment = noone;
	var sk_bone = noone;
	var sk_colour = $ffffff;
	var sk_alpha = 1;
	switch(sk_struct_get_type(sk_slot)){
		case sk_type_slot:
			// obtain attachment and bone from slot
			sk_attachment = sk_slot[SK_SLOT.attachmentFinal];
			sk_bone = sk_slot[SK_SLOT.boneFinal];
			sk_colour = sk_slot[SK_SLOT.colourFinal];
			sk_alpha = sk_slot[SK_SLOT.alphaFinal];
		break;
		case sk_type_symbol:
			// obtain attachment and bone from symbol
			sk_symbol_updateWorldTransform(sk_slot);
			var sk_nestedSlot = sk_slot[SK_SYMBOL.NESTED_SLOT];
			sk_attachment = sk_nestedSlot[SK_SLOT.attachmentFinal];
			sk_bone = sk_slot[SK_SYMBOL.NESTED_BONE];
			sk_colour = sk_nestedSlot[SK_SLOT.colourFinal];
			sk_alpha = sk_nestedSlot[SK_SLOT.alphaFinal];
		break;
	}
	if(sk_struct_exists(sk_attachment)){
		switch(sk_struct_get_type(sk_attachment)){
			case sk_type_attachment_plane:
				// render region attachment
				var sk_attachment_subtexture = sk_atlas_subtextures[? sk_attachment[SK_ATTACHMENT_PLANE.regionName]];
				if(sk_struct_isof(sk_attachment_subtexture,sk_type_region)){
					// get bone world transform
					var sk_bone_xpos = 0;
					var sk_bone_ypos = 0;
					var sk_bone_m00 = 1;
					var sk_bone_m01 = 0;
					var sk_bone_m10 = 0;
					var sk_bone_m11 = -1;
					if(sk_struct_isof(sk_bone,sk_type_bone)){
						sk_bone_xpos = sk_bone[SK_BONE.XWorld];
						sk_bone_ypos = sk_bone[SK_BONE.YWorld];
						sk_bone_m00 = sk_bone[SK_BONE.m00]; // x component of x
						sk_bone_m01 = sk_bone[SK_BONE.m01]; // y component of x
						sk_bone_m10 = sk_bone[SK_BONE.m10]; // x component of y
						sk_bone_m11 = sk_bone[SK_BONE.m11]; // y component of y
					}
					// get attachment transform
					var sk_att_dx = sk_attachment[SK_ATTACHMENT_PLANE.X];
					var sk_att_dy = sk_attachment[SK_ATTACHMENT_PLANE.Y];
					var sk_att_m00 = sk_attachment[SK_ATTACHMENT_PLANE.m00]; // x component of x
					var sk_att_m01 = sk_attachment[SK_ATTACHMENT_PLANE.m01]; // y component of x
					var sk_att_m10 = sk_attachment[SK_ATTACHMENT_PLANE.m10]; // x component of y
					var sk_att_m11 = sk_attachment[SK_ATTACHMENT_PLANE.m11]; // y component of y
					// multiply bone and attachment matrices
					var sk_region_xpos = sk_bone_xpos+sk_att_dx*sk_bone_m00+sk_att_dy*sk_bone_m10;
					var sk_region_ypos = sk_bone_ypos+sk_att_dx*sk_bone_m01+sk_att_dy*sk_bone_m11;
					var sk_region_m00 = (sk_att_m00*sk_bone_m00)+(sk_att_m01*sk_bone_m10);
					var sk_region_m01 = (sk_att_m00*sk_bone_m01)+(sk_att_m01*sk_bone_m11);
					var sk_region_m10 = (sk_att_m10*sk_bone_m00)+(sk_att_m11*sk_bone_m10);
					var sk_region_m11 = (sk_att_m10*sk_bone_m01)+(sk_att_m11*sk_bone_m11);
					// get normalised UVs
					var uv_ULX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_ULX]);
					var uv_ULY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_ULY]);
					var uv_URX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_URX]);
					var uv_URY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_URY]);
					var uv_BLX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_BLX]);
					var uv_BLY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_BLY]);
					var uv_BRX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_BRX]);
					var uv_BRY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_BRY]);
					// get region boundaries
					var sk_region_w = sk_attachment_subtexture[SK_REGION.width];
					var sk_region_h = sk_attachment_subtexture[SK_REGION.height];
					var sk_region_left = -sk_attachment_subtexture[SK_REGION.ox];
					var sk_region_top = -sk_attachment_subtexture[SK_REGION.oy];
					var sk_region_right = sk_region_left+sk_region_w;
					var sk_region_bottom = sk_region_top+sk_region_h;
					// get verts
					var v_x1 = sk_region_xpos+sk_region_m00*sk_region_left+sk_region_m10*sk_region_bottom; // bottom left
					var v_y1 = sk_region_ypos+sk_region_m01*sk_region_left+sk_region_m11*sk_region_bottom;
					var v_x2 = sk_region_xpos+sk_region_m00*sk_region_right+sk_region_m10*sk_region_bottom; // bottom right
					var v_y2 = sk_region_ypos+sk_region_m01*sk_region_right+sk_region_m11*sk_region_bottom;
					var v_x3 = sk_region_xpos+sk_region_m00*sk_region_left+sk_region_m10*sk_region_top; // top left
					var v_y3 = sk_region_ypos+sk_region_m01*sk_region_left+sk_region_m11*sk_region_top;
					var v_x4 = sk_region_xpos+sk_region_m00*sk_region_right+sk_region_m10*sk_region_top; // top right
					var v_y4 = sk_region_ypos+sk_region_m01*sk_region_right+sk_region_m11*sk_region_top;
					// add verticies to buffer
					#region // triad #1
					// bottom left
					vertex_position(argument2,v_x1,v_y1);
					vertex_normal(argument2,0,0,-1);
					vertex_colour(argument2,sk_colour,sk_alpha);
					vertex_texcoord(argument2,uv_BLX,uv_BLY);
					// bottom right
					vertex_position(argument2,v_x2,v_y2);
					vertex_normal(argument2,0,0,-1);
					vertex_colour(argument2,sk_colour,sk_alpha);
					vertex_texcoord(argument2,uv_BRX,uv_BRY);
					// top left
					vertex_position(argument2,v_x3,v_y3);
					vertex_normal(argument2,0,0,-1);
					vertex_colour(argument2,sk_colour,sk_alpha);
					vertex_texcoord(argument2,uv_ULX,uv_ULY);
					#endregion
					#region // triad #2
					// bottom right
					vertex_position(argument2,v_x2,v_y2);
					vertex_normal(argument2,0,0,-1);
					vertex_colour(argument2,sk_colour,sk_alpha);
					vertex_texcoord(argument2,uv_BRX,uv_BRY);
					// top right
					vertex_position(argument2,v_x4,v_y4);
					vertex_normal(argument2,0,0,-1);
					vertex_colour(argument2,sk_colour,sk_alpha);
					vertex_texcoord(argument2,uv_URX,uv_URY);
					// top left
					vertex_position(argument2,v_x3,v_y3);
					vertex_normal(argument2,0,0,-1);
					vertex_colour(argument2,sk_colour,sk_alpha);
					vertex_texcoord(argument2,uv_ULX,uv_ULY);
					#endregion
				}
			break;
		}
	}
}
#endregion
vertex_end(argument2);
// return the texture page
return argument1[SK_ATLAS.texturePage];
