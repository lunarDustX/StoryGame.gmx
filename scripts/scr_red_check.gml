///scr_wolf_kill
with (obj_red) {
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
        
        // visit grandma
        with (inst) {
            if (name == "grandma") {
                if (wolf_can_visit) {
                    scr_text("Red gives Grandma a cake and Grandma is happy.", 0.5);
                    wolf_can_visit = false;
                } else {
                    scr_text("Go home quickly,says Grandma.", 0.5)
                }
            }
            
            if (name == "home") {
                if (instance_exists(obj_house)) {
                    with (obj_house) {
                        if (wolf_can_visit) {
                            scr_text("Don't walk on the small road.", 0.5);
                        } else {
                            scr_text("Good Girl, dinner is ready.", 0.5);
                            with (obj_red) {
                                instance_destroy();
                            }
                        }
                    }
                } else { // Grandma is dead
                    scr_text("Come here, baby.", 0.5);
                    // can't control the red charater
                    with (obj_red) {
                        instance_destroy();
                        number_of_characters--;
                    }   
                }
            }
            
            if (name == "flower") {
                scr_text("red picks up the flower", 0.5);
                instance_destroy();
            }
        }
}
