globalvar debug;
globalvar work_offline;
globalvar log;
//Show or not debug tools
debug = true; // Test Change
work_offline = true;
log = false

//Log

if(log){

	var log_file_path = "./log_" + string(current_day);
	log_file_path += "_" + string(current_month);
	log_file_path += "_" + string(current_year);
	log_file_path += "_" + string(current_hour);
	log_file_path += "_" + string(current_minute);
	log_file_path += ".txt";

	log_file = file_text_open_write(log_file_path);
}
//Change the seed
randomize();

