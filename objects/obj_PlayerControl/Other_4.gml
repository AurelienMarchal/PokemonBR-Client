if(room == room_Loading)	{in_game = false; exit;}

frame_waited = 0;

//Creating a new player for the client

player_client = instance_create_layer(spawn_x_grid * grid_size, spawn_y_grid * grid_size, "Caracters", obj_Player);
player_client.dir = spawn_dir;
player_client.username_ = username;
player_client.state = state;
player_client.ID = iden;
player_client.sprite = sprite;
player_client.is_player_client = true;


x = player_client.x
y = player_client.y

//Emit Enter room
if(!work_offline){
	var data_map = ds_map_create();
	ds_map_add(data_map, "id", iden);
	ds_map_add(data_map, "room", room_get_name(room));
	ds_map_add(data_map, "x_grid", player_client.next_x_grid);
	ds_map_add(data_map, "y_grid", player_client.next_y_grid);
	ds_map_add(data_map, "dir", dir);
	ds_map_add(data_map, "state", state);
	network_emit("enter_room", json_encode(data_map));
	ds_map_destroy(data_map);
}



with(obj_Camera){
	player_to_follow = other.player_client;
}


in_game = true;