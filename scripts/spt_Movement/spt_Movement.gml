function spt_Movement(name, data) {

	write_log("Mouvement", json_encode(data));
	
	if(!ds_map_exists(data, "id")){
		write_log("Movement ERROR", "No id in data " + json_encode(data));
		exit;
	}
	
	if(!(ds_map_exists(data, "x_grid") and ds_map_exists(data, "y_grid") and ds_map_exists(data, "dir") and ds_map_exists(data, "state"))){
		write_log("Movement ERROR", "Key missing in data" + json_encode(data));
	}
	
	var ID = ds_map_find_value(data, "id");
	var found = false;
	if(ID == iden){
	//If found itself
		found = true;
	}
	
	var data_copy = ds_map_create();
	ds_map_copy(data_copy, data)
	
	
	for (var i = 0; i < instance_number(obj_Player); ++i;){
			var player = instance_find(obj_Player, i);
			if(!player.is_player_client){
				if(player.ID == ID){
					ds_queue_enqueue(player.mvt_map_queue, data_copy);
				}
			}
	}
	
	if(!found){
		write_log("Movement ERROR", "Player with id " + string(ID) + " not found");
	}
}
