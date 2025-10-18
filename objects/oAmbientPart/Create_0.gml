
partEmitter = part_emitter_create(global.partSystem);
partType = part_type_create();

part_emitter_region(global.partSystem,partEmitter,0,2000,0,2000,ps_shape_rectangle,ps_distr_linear);
part_emitter_stream(global.partSystem,partEmitter,partType,4);

part_type_alpha3(partType,0,1,0);
part_type_color3(partType,c_white,c_green,c_lime);
part_type_life(partType,game_get_speed(gamespeed_fps) * 2,game_get_speed(gamespeed_fps) * 2.5);
part_type_scale(partType,1,1);
part_type_gravity(partType,0.005,0);


