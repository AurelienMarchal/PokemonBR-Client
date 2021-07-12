/// @function           function write_log(channel_name, msg);
/// @param {string}     channel_name  The networking channel that is logging the message
/// @param {string}     msg  The message to log
/// @description        Write the message to the log file with the rigth format

function write_log(channel_name, msg){
	
	var log_msg;
	
	log_msg = string(current_hour) + ":" + string(current_minute) + ":" + string(current_second);
		
	repeat(10 - string_length(log_msg))	{log_msg += " ";}
			
	log_msg += string(current_time);
		
	repeat(20 - string_length(log_msg))	{log_msg += " ";}
	
	log_msg += channel_name + ":" + msg;
	
	if(log){
		with(obj_Debug){
		
			file_text_write_string(log_file, log_msg)
			file_text_writeln(log_file);
	
		}
	}
	else{
		show_debug_message(log_msg);
	}
	
}