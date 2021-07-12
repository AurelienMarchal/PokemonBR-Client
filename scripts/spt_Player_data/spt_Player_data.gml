function spt_Player_data(name, data) {
	
	
	write_log("Player Data", json_encode(data));
	
	if(!ds_map_exists(data, "id")){
		write_log("Player Data ERROR", "No id in data " + json_encode(data));
		exit;
	}
	
	var ID = ds_map_find_value(data, "id");
	var found = false;
	if(ID == iden){
	//If found itself
		found = true;
	}
	
	
	for (var i = 0; i < instance_number(obj_Player); ++i;){
			var player = instance_find(obj_Player, i);
			if(!player.is_player_client){
				if(player.ID == ID){
					// Set the data to the player found
					if(ds_map_exists(data, "username")){
						player.username = ds_map_find_value(data, "username");
					}
					
					if(ds_map_exists(data, "x_grid")){
						// Maybe empty mvt queue
						player.x_grid = ds_map_find_value(data, "x_grid");
					}
					
					if(ds_map_exists(data, "y_grid")){
						// Maybe empty mvt queue
						player.y_grid = ds_map_find_value(data, "y_grid");
					}
					
					if(ds_map_exists(data, "dir")){
						// Maybe empty mvt queue
						player.dir = ds_map_find_value(data, "dir");
					}
					
					if(ds_map_exists(data, "state")){
						// Maybe empty mvt queue
						player.state = ds_map_find_value(data, "state");
					}
					
					if(ds_map_exists(data, "sprite")){
						player.sprite = ds_map_find_value(data, "sprite");
					}
					
					
					found = true;
				}
				
			}
	}
	
	//If player not found, create it and set the data recieved
	
	if(!found){
		write_log("Player Data", "Player with id " + string(ID) + " not found, trying to create it");
		
		if(ds_map_exists(data, "x_grid") and ds_map_exists(data, "y_grid")){
		
			var new_player = instance_create_layer(ds_map_find_value(data, "x_grid") * grid_size, ds_map_find_value(data, "y_grid") * grid_size, "Caracters", obj_Player);
			new_player.ID = ID;
			if(ds_map_exists(data, "username")){
				player.username = ds_map_find_value(data, "username");
			}
			if(ds_map_exists(data, "dir")){
				new_player.dir = ds_map_find_value(data, "dir");
			}		
			if(ds_map_exists(data, "state")){
				// Maybe empty mvt queue
				new_player.state = ds_map_find_value(data, "state");
			}		
			if(ds_map_exists(data, "sprite")){
				new_player.sprite = ds_map_find_value(data, "sprite");
			}
		}
		
		else{
			write_log("Player Data ERROR", "ID not found and insufficient data to create player " + json_encode(data));
		}	
	}
	
	ds_map_destroy(data);

}
