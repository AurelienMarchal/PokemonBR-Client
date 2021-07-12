globalvar grid_size;
grid_size = 32;
globalvar iden;
iden = 0;
globalvar username;
username = "GMS2-P1";

//Starting game

spawn_x_grid = 14;
spawn_y_grid = 22;
spawn_room = room_Overworld;
spawn_dir = 0;

//Defining input keys

input_key_down	= vk_down;
input_key_left	= vk_left;
input_key_up	= vk_up;
input_key_right = vk_right;
input_key_run	= vk_space;

input_map = ds_map_create();

ds_map_add(input_map, "left", 0);
ds_map_add(input_map, "right", 0);
ds_map_add(input_map, "up", 0);
ds_map_add(input_map, "down", 0);
ds_map_add(input_map, "run", 0);


frame_delay = 10;
frame_waited = 0;

//Placing on the grid

x_grid = 14
y_grid = 22

x = x_grid * grid_size;
y = y_grid * grid_size;


//Mvt variables

state	= 0;
dir		= 0; //0:down, 1:left, 2:right, 3:up
move_x = 0;
move_y = 0;
state = 0;
sprite = "girl";

//Keeping track of all the players in the current room
player_client = noone;

//Battle variables

in_battle = false;


in_game = false;


if(work_offline){
	if(room == room_Loading){
		room_goto_next();
	}
}
