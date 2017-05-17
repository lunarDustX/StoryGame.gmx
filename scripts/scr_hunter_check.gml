///scr_wolf_kill
with (obj_hunter) {
    //if (stable) {
        inst = noone;
        if (moving_dir == LEFT) {
            inst = instance_place(x-30,y,obj_all);
        }
    
        if (moving_dir == RIGHT) {
            inst = instance_place(x+30,y,obj_all);
        }
    
        if (moving_dir == UP) {
            inst = instance_place(x,y-30,obj_all);
        }
    
        if (moving_dir == DOWN) {
            var inst = instance_place(x,y+30,obj_all);
        }
        
        // kill the wolf
        with (inst) {
            if (name == "wolf") {
                number_of_characters--;
                scr_text("The wolf is killed.", 0.5);
                instance_destroy();
            }
            
            if (name == "grandma") {
                if (instance_exists(obj_red)) {
                    scr_text("hunter visits grandma.", 0.5);
                } else {
                    scr_text("hunter tells grandma the death of red.", 0.5);
                }
            }
        }
}
