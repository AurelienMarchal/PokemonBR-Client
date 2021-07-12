var anim_lenght = 4;
var frame_lenght = 48;
var frame_width = 32;
var anim_speed = 4;

if (move_x == 0 && move_y == 0)	{x_frame = 0;}



//INCREMENTE FRAME FOR ANIMATION
if (x_frame + anim_speed/60< anim_lenght -1 and !freeze_mvt)	{x_frame += anim_speed/60;}
else											{x_frame = 1; }

//DRAW
if(state == 1 && abs(move_x) + abs(move_y) != 0){
	draw_sprite_part(sprite_run,0,floor(x_frame)*frame_width,dir*frame_lenght,frame_width,frame_lenght,x-x_offset,y-y_offset);
}

else{
	draw_sprite_part(sprite_walk,0,floor(x_frame)*frame_width,dir*frame_lenght,frame_width,frame_lenght,x-x_offset,y-y_offset);
}


if(!debug){exit;}

var clr = c_green;

draw_set_alpha(0.5);
draw_rectangle_color(next_x_grid * grid_size, next_y_grid * grid_size, (next_x_grid + 1) * grid_size, (next_y_grid + 1) * grid_size, clr, clr, clr, clr, false);
draw_rectangle_color(x_grid * grid_size, y_grid * grid_size, (x_grid + 1) * grid_size, (y_grid + 1) * grid_size, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, false);
draw_set_alpha(1.0);