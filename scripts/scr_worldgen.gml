///scr_worldgen
// set the size of forest
globalvar border_left, border_right, border_top, border_bottom, tile_size, row, col;
tile_size = 64;
col = 7;
row = 4;
border_left = 64;
border_right = border_left + col*tile_size;
border_top = 64;
border_bottom = border_top + row*tile_size;
