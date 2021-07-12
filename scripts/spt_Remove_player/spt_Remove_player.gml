function spt_Remove_player(name, data) {
	
	
	write_log("Remove Player", json_encode(data));
	
	if(!ds_map_exists(data, "id")){
		write_log("Remove Player ERROR", "No id in data " + json_encode(data));
		exit;
	}
	
	var ID = ds_map_find_value(data, "id");
	var found = false;
	if(ID == iden){
	//If found itself
		found = true;
	}
	else{
	//Else look for the player with the id and destroy its instance
		for (var i = 0; i < instance_number(obj_Player); ++i;){
			var player = instance_find(obj_Player, i);
			if(!player.is_player_client){
				if(player.ID == ID){
					
					instance_destroy(player);
					found = true;
				}
				
			}
		}
	}
	ds_map_destroy(data);
	
	if(!found){
		write_log("Remove Player ERROR", "Player with id " + string(ID) + " not found");
	}

}
