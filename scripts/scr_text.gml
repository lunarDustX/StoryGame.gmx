///scr_text("Text",speed)
with (instance_find(obj_textbox,0)) {
    instance_destroy();
}
with (instance_create(border_left, border_bottom, obj_textbox)) {
    story_text = argument0;
    spd = argument1;
}
