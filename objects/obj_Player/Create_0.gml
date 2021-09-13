username_ = "no_username"
ID = -1;

//Test change

//Putting the player on the grid

x_grid = floor(x / grid_size);
y_grid = floor(y / grid_size);

x = x_grid * grid_size;
y = y_grid * grid_size;

//Mvt variables

walking_spd = 2;
runing_spd	= 4;
spd			= walking_spd;

move_x	= 0;
move_y	= 0;
dir		= 0; //0:down, 1:left, 2:right, 3:up
state	= 0;

//Network var

can_send_data = false;
is_player_client = false;

//Next move to perform

next_x_grid = x_grid;
next_y_grid = y_grid;

next_move_x = 0;
next_move_y = 0;


next_state = state;
next_dir = dir;

freeze_mvt = false;

mvt_map_queue = ds_queue_create();

//Draw variables

sprite = "boy";

sprite_walk		= spr_boy_walk;
sprite_run		= spr_boy_run;

x_offset	= 0;
y_offset	= 16;

x_frame		= 0;


