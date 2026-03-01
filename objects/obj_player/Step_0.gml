// INPUT
var move = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_up);

// HORIZONTAL
hsp = move * spd;

if (place_meeting(x + hsp, y, obj_ground)) {
    while (!place_meeting(x + sign(hsp), y, obj_ground)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// GRAVITY
vsp += grav;

// VERTICAL
if (place_meeting(x, y + vsp, obj_ground)) {
    while (!place_meeting(x, y + sign(vsp), obj_ground)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// JUMP
if (jump && place_meeting(x, y + 1, obj_ground)) {
    vsp = -jump_power;
}