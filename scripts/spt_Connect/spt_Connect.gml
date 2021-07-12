function spt_Connect(name, data){
	
	if(!ds_map_exists(data, "id")){
		write_log("Connect ERROR", "No id in data " + json_encode(data));
		exit;
	}
	
	
	iden = ds_map_find_value(data, "id");
	
	write_log("Connect", "Id given : " + string(iden));
	
	// Temporary
	with(obj_PlayerControl){
		room_goto(spawn_room);
		in_game = true;
	}
}
