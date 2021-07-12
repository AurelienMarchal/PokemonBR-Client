if(play_animation){
	image_speed = animation_spd;
	play_animation = false;
	animation_over = false;
}


if(image_index >= image_number - 1){
	animation_over = true;
	image_speed = 0;
}