

if(!ds_queue_empty(msg_queue)){
	new_msg = ds_queue_dequeue(msg_queue);
	show_debug_message(new_msg);
	timer = 320;
}

if (timer > 0){
	draw_set_alpha(alpha);
	draw_rectangle_color(x_pos, y_pos, x_pos+width, y_pos+size, c_gray, c_gray, c_gray, c_gray, false);
	draw_text(x_pos, y_pos, new_msg);
	draw_set_alpha(1);
	timer -= 1;
}