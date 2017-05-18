///scr_red_check
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
                if (wolf_in_bed) { // wolf eats red
                    red_alive = false;
                    scr_character_die(obj_red);
                    scr_text("Red is killed, Wolf sleeps.", 0.5);
                    exit;    
                }
    
                if (wolf_can_visit) {
                    /*
                    with (obj_red) { 
                        x = gx;
                        y = gy;
                    }
                    */
                    scr_text("Red gives Grandma a cake and Grandma is happy.", 0.5);
                    wolf_can_visit = false;
                } else {
                    scr_text("Go back home quickly, says Grandma.", 0.5)
                }
            }
            
            if (name == "home") {
                //if (instance_exists(obj_house)) {
                if (grandma_alive) {
                    with (obj_house) {
                        if (wolf_can_visit) {
                            scr_text("Don't walk on the small road.", 0.5);
                        } else {
                            scr_character_die(obj_red);
                            scr_text("Good Girl, dinner is ready.", 0.5);
                        }
                    }
                } else { // Grandma is dead
                    if (red_knows) {
                        scr_text("Come here, baby.", 0.5);
                        scr_character_die(obj_red);
                    } else {
                        scr_text("Go to Grandma's House.", 0.5);
                    }  
                }
            }
            
            if (name == "flower") {
                scr_text("red picks up the flower", 0.5);
                instance_destroy();
            }
            
            if (name == "hunter") {
                with (obj_house) {
                    if (hunter_in_bed) {
                        hunter_in_bed = false;
                        red_knows = true;
                        scr_text("Hunter tells Red the truth, Red feels guilt. But it's not your fault, says Hunter.", 0.5);
                        exit;
                    }
                }
            }
        }
}
