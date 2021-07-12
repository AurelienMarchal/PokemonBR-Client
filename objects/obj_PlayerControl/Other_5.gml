//Emit Enter room
if(!work_offline){
	var data_map = ds_map_create();
	ds_map_add(data_map, "id", iden);
	ds_map_add(data_map, "room", room_get_name(room));
	network_emit("leave_room", json_encode(data_map));
	ds_map_destroy(data_map);
}
