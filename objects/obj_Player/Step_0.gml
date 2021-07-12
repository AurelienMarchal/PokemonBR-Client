if(freeze_mvt)	{exit;}

//if on grid change state
if((x % grid_size) == 0 && (y % grid_size) == 0){
	
	x_grid = x div grid_size;
	y_grid = y div grid_size;
	
	if(!is_player_client){
	
		if (!ds_queue_empty(mvt_map_queue)){

			var next_mvt_map = ds_queue_dequeue(mvt_map_queue);

			//write_log("Player", json_encode(next_mvt_map));
			next_x_grid = ds_map_find_value(next_mvt_map, "x_grid");
			next_y_grid = ds_map_find_value(next_mvt_map, "y_grid");
			dir = ds_map_find_value(next_mvt_map, "dir");
			state = ds_map_find_value(next_mvt_map, "state");
		
	
			if((next_x_grid != x_grid and next_y_grid != y_grid) or (abs(next_x_grid - x_grid) > 1) or (abs(next_y_grid - y_grid) > 1)){
				write_log("Player", "Invalid movement");
				x = next_x_grid * grid_size;
				y = next_y_grid * grid_size;
				x_grid = x div grid_size;
				y_grid = y div grid_size;
				next_x_grid = x_grid;
				next_y_grid = y_grid;
			}
		
			ds_map_destroy(next_mvt_map);
		}
	
		move_x = sign(next_x_grid - x_grid);
		move_y = sign(next_y_grid - y_grid);
	}
	
	else{
		can_send_data = (state != next_state or dir != next_dir or next_move_x != 0 or next_move_y != 0);
		state = next_state;
		dir = next_dir;
		move_x = next_move_x;
		move_y = next_move_y;
	}

		
	//AlTER SPEED

	if(state == 1)			{spd = runing_spd;}
	else					{spd = walking_spd;}

}
		
//Collision handling

var inst_collision = instance_place(x + move_x * spd, y + move_y * spd, obj_Collision);

if(inst_collision != noone){
	if(inst_collision != self){
		if(abs(move_x) > 0 ){
			repeat(spd){
				if(place_meeting(x + sign(move_x), y, obj_Collision)){break;}
				x+= sign(move_x);
			}
		}
	
		if(abs(move_y) > 0){
			repeat(spd){
				if(place_meeting(x, y + sign(move_y), obj_Collision)){break;}
				y+= sign(move_x);
			}
		}
		move_x = 0;
		move_y = 0;
		
		can_send_data = false;
	}
}

if(can_send_data and is_player_client){
	next_x_grid = x_grid + move_x;
	next_y_grid = y_grid + move_y;
}

//Change sprite
//Temporary
switch(sprite){
	case "boy":		sprite_walk = spr_boy_walk;
					sprite_run = spr_boy_run;
					break;
				
	case "girl":	sprite_walk = spr_girl_walk;
					sprite_run = spr_girl_run;
					break;
					
	default:		sprite_walk = spr_boy_walk;
					sprite_run = spr_boy_run;
					break;
}
	



//APPLY MOVEMENT

x += move_x * spd;
y += move_y * spd;
	


