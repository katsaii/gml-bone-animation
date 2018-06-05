/// @desc draw UI
var i = 15;
draw_text(10,20*i,"Click to add a new armature"); i++;
draw_text(10,20*i,"Hold ctrl to reposition the origin"); i++;
draw_text(10,20*i,"Use the arrow keys to resize the armature"); i++;
draw_text(10,20*i,"Count: "+string(instance_number(obj_armature)+1)); i++;
