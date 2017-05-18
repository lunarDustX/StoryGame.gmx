///scr_hunter_check
with (obj_house) {
    if (hunter_in_bed) {
        exit;
    }
}

with (obj_hunter) {
    //if (stable) {
        inst = noone;
        if (pre_dir == LEFT) {
            inst = instance_place(x-30,y,obj_all);
        }
    
        if (pre_dir == RIGHT) {
            inst = instance_place(x+30,y,obj_all);
        }
    
        if (pre_dir == UP) {
            inst = instance_place(x,y-30,obj_all);
        }
    
        if (pre_dir == DOWN) {
            var inst = instance_place(x,y+30,obj_all);
        }
        
        with (inst) {
            if (name == "wolf") {
                number_of_characters--;
                scr_text("The wolf is killed.");
                instance_destroy();
            }
            
            if (name == "grandma") {
                if (wolf_in_bed) {
                    wolf_in_bed = false;
                    scr_character_die(obj_wolf);
                    if (!red_alive) {
                        scr_text("Hunter saves Red and Grandma, happy ending.#GAME OVER.");
                    } else {
                        scr_text("Hunter kills Wolf, but it's too late. Grandma can't come back.");
                        hunter_in_bed = true; // wait
                        with (obj_hunter) {
                            x = gx;
                            y = gy;
                        }
                    }
                } else {
                    if (red_alive && grandma_alive) {
                        scr_text("Hunter visits Grandma.");
                    } else {
                    
                    }   
                }
            }
        }
}
