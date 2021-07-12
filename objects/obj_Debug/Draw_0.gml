
if(!debug)	{exit;}

//Draw collision box
with(obj_Collision){
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true);
}

//Draw collision box
with(obj_Player){
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,true);
}





