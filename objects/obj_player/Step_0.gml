// =======================
// INPUT
// =======================

var move = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_up);

// =======================
// HORIZONTAL MOVEMENT
// =======================

var spd = 4;
x += move * spd;


// =======================
// GRAVITY
// =======================

var grav = 0.5;
var max_fall = 12;

vspeed += grav;
vspeed = clamp(vspeed, -100, max_fall);


// =======================
// VERTICAL MOVEMENT
// =======================

y += vspeed;


// =======================
// GROUND COLLISION
// =======================

if (place_meeting(x, y, obj_ground)) {

    // Move out of ground
    while (place_meeting(x, y, obj_ground)) {
        y -= sign(vspeed);
    }

    vspeed = 0;
}


// =======================
// JUMP (only if touching ground)
// =======================

if (jump && place_meeting(x, y + 1, obj_ground)) {
    vspeed = -10;
}