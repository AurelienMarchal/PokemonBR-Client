/// @description Insérez la description ici
if(work_offline){exit;}

//Connecting to the server

server_addr = "178.79.143.52";
server_port = 5000;

network_init();
network_server(server_addr, server_port);
//network_emit("connect", 

//Biding channels with scripts

network_listen("movement", spt_Movement);
network_listen("message", spt_Message);
network_listen("room_data", spt_Room_data);
network_listen("remove_player", spt_Remove_player);
network_listen("player_data", spt_Player_data);
network_listen("connect", spt_Connect);