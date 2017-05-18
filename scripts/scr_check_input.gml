/// scr_check_input

    if (keyboard_check(vk_left)) {
         //moving = true;
         moving_dir = LEFT;
    }
    
    if (keyboard_check(vk_right)) {
         //moving = true;
         moving_dir = RIGHT;
    }
    
        if (keyboard_check(vk_up)) {
         //moving = true;
         moving_dir = UP;
    }
    
        if (keyboard_check(vk_down)) {
         //moving = true;
         moving_dir = DOWN;
    }
    
    pre_dir = moving_dir;
