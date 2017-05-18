///scr_wolf_kill
with (obj_house) {
    if (wolf_in_bed) {
        exit;
    }
}

with (obj_wolf) {
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
        
        // how to interact with object
        if (inst != noone) {
            // can't destroy
            with (inst) {
                if (name == "stone") {
                    exit;
                }
                if (name == "grandma") {
                    if (!wolf_can_visit) {
                        scr_text("Grandma doesn't open the door.");
                    } else {
                        grandma_alive = false;
                        wolf_in_bed = true;
                        image_index = 1;
                        depth = -1;
                        scr_character_die(obj_wolf);
                        /*
                        with (obj_wolf) {
                            stable = true;
                            off = true;
                            x = gx;
                            y = gy;
                        }
                        */
                        scr_text("Wolf eats Grandma, waiting for Red's coming.");
                    }
                    exit;
                }
                if (name == "home") {
                    scr_text("wolf cannot open the door.");
                    exit;
                }
            }
            
            // destroy or kill
            if (object_is_ancestor(inst.object_index, obj_moving)) {
                scr_character_die(inst);
            } else { // static 
                with (inst) {
                    instance_destroy();
                    scr_text("The wolf destroys the " + name + ".");
                }
            }
        }
}
