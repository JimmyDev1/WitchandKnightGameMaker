draw_text(10, 10, "Gamepad connected: " + string(gamepad_is_connected(0)));
draw_text(10, 30, "Left Stick X: " + string(gamepad_axis_value(0, gp_axislh)));
draw_text(10, 50, "Left Stick Y: " + string(gamepad_axis_value(0, gp_axislv)));


if (instance_exists(obj_bat)) {
    draw_text(600, 10, "Invunerability: " + string(obj_bat.invuln_timer));
}