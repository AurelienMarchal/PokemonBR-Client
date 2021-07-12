if(!in_game)	{exit;}

with(player_client){
	other.x_grid = x_grid;
	other.y_grid = y_grid;
	other.x = x;
	other.y = y;
	next_move_x = 0;
	next_move_y = 0;
}

//Populating input map

ds_map_set(input_map, "left", keyboard_check(input_key_left));
ds_map_set(input_map, "right", keyboard_check(input_key_right));
ds_map_set(input_map, "up", keyboard_check(input_key_up));
ds_map_set(input_map, "down", keyboard_check(input_key_down));
ds_map_set(input_map, "run", keyboard_check(input_key_run));
	
//set state

//Change mvt
var input_x = 0; var input_y = 0;
input_x = ds_map_find_value(input_map, "right") - ds_map_find_value(input_map, "left");

	
if(input_x == 0)	{input_y = ds_map_find_value(input_map, "down") - ds_map_find_value(input_map, "up");}


if((x % grid_size) == 0 && (y % grid_size) == 0){

	move_x = 0;
	move_y = 0;
	
	
	if(input_x == 0 && input_y == 0){
		frame_waited = 0;
	}
	else{
		frame_waited ++;
		frame_waited = min(frame_waited, frame_delay)
	}
	
	if(frame_waited == frame_delay){
		move_x = input_x;
		move_y = input_y;
	}
	
	//Set dir
	if(input_x > 0) {dir = 2;}
	if(input_x < 0) {dir = 1;}
	if(input_y > 0) {dir = 0;}
	if(input_y < 0) {dir = 3;}
	
	
	if(ds_map_find_value(input_map, "run"))	{state = 1;}
	else									{state = 0;}
	
	
	with(player_client){
		next_move_x = other.move_x;
		next_move_y = other.move_y;
		next_state = other.state;
		next_dir = other.dir;
	}

}

if(player_client.can_send_data){
	var next_mvt_map = ds_map_create();
	ds_map_add(next_mvt_map, "id", iden);
	ds_map_add(next_mvt_map, "x_grid", player_client.next_x_grid);
	ds_map_add(next_mvt_map, "y_grid", player_client.next_y_grid);
	ds_map_add(next_mvt_map, "dir", dir);
	ds_map_add(next_mvt_map, "state", state);
	
	if(!work_offline){
		network_emit("movement", json_encode(next_mvt_map));
		ds_map_destroy(next_mvt_map);
		
	}
	else{
		for (var i = 0; i < instance_number(obj_Player); ++i;){
			var player = instance_find(obj_Player, i);
			if(!player.is_player_client){
				ds_queue_enqueue(player.mvt_map_queue, next_mvt_map);
			}
		}
	}
	//write_log("PlayerControl", json_encode(next_mvt_map));
	
	
	player_client.can_send_data = false;
}



//Wild pokemon apparition

/*
var inst_spawning_zone	= instance_place(x,y,obj_SpawningZone);


if(inst_spawning_zone != noone && !in_battle){
	in_battle = true;
	var inst_battle = instance_create_layer(0,0,"Instances",obj_Battle);
}
*/

//Transition

var inst_transi	= instance_place(x , y, obj_RoomTransition);

if(inst_transi != noone){
	//show_debug_message("Change room");
	spawn_x_grid	= inst_transi.target_x_grid;
	spawn_y_grid	= inst_transi.target_y_grid;
	spawn_room		= inst_transi.target_room;
	spawn_dir		= inst_transi.target_dir;
	
	show_debug_message(inst_transi.door_animation);
	
	if(inst_transi.door_animation != noone){
		inst_transi.door_animation.play_animation = true;
		player_client.freeze_mvt = true;
	}
	
	else{
		room_goto(spawn_room);
	}
	
	if(inst_transi.door_animation != noone and inst_transi.door_animation.animation_over){
		player_client.freeze_mvt = false;
		room_goto(spawn_room);
	}
}




//show_debug_message(string(x_grid) + ", " + string(y_grid) + ", " + string(spd));