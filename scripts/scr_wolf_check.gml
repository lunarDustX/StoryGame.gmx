///scr_wolf_kill
with (obj_wolf) {
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
        
        // how to interact with object
        if (inst != noone) {
            // can't destroy
            with (inst) {
                if (name == "stone") {
                    exit;
                }
                if (name == "grandma") {
                    if (!wolf_can_visit) {
                        scr_text("Grandma doesn't open the door.", 0.5);
                        exit;
                    }
                }
                if (name == "home") {
                    scr_text("wolf cannot open the door.",0.5);
                    exit;
                }
            }
            
            // destroy or kill
            if (object_is_ancestor(inst.object_index, obj_moving)) {
                number_of_characters--;
                with (inst) {
                    scr_text("The wolf kills the " + name + ".", 0.5);
                }
            } else { // static 
                with (inst) {
                    scr_text("The wolf destroys the " + name + ".", 0.5);
                }
            }
            
            with (inst) {
                instance_destroy();
            }
        }
}
