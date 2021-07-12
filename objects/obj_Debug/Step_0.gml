//Toggle debug mode

if(keyboard_check_pressed(ord("O")))	{debug = !debug;}

//Restart Game

if(keyboard_check_pressed(ord("R")))	{game_restart();}

//End Game

if(keyboard_check_pressed(vk_escape))	{game_end();}
