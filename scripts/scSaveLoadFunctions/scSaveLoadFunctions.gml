function scSavegame() {
	
	var _map = ds_map_create();
	
	_map[? "eb"] = global.easyBeaten;
	_map[? "nb"] = global.normalBeaten;
	_map[? "hb"] = global.hardBeaten;
	_map[? "yad"] = global.day;
	_map[? "mv"] = global.music_volume;
	_map[? "sv"] = global.sfx_volume;
	
	var _string = json_encode(_map);
	saveStringToFile("@_@"+".#2g",_string);
	ds_map_destroy(_map);
}
function saveStringToFile(_filename,_string) {
	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,_filename);
	buffer_delete(_buffer);
}
	
function scLoadgame() {
	var _file = "@_@"+".#2g";
	if (file_exists(_file)){
		var _json = loadjsonfromfile(_file);
		
		global.easyBeaten = _json[? "eb"];
		global.normalBeaten = _json[? "nb"];
		global.hardBeaten = _json[? "hb"];
		global.day = _json[? "yad"];
		
		global.music_volume = _json[? "mv"];
		global.sfx_volume = _json[? "sv"];
		
		ds_map_destroy(_json)
		return true;
	}
	else return false;
}
function loadjsonfromfile(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}