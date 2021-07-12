function spt_Room_data(name, data) {
	
	write_log("Room Data", json_encode(data));
	ds_map_destroy(data);

}
