
image_xscale =  0.5;
image_yscale =  0.5;
image_speed = 0.2;

instance_create_layer(x, y,"Effects", obj_effect_magica_orb_sparkle);



//Moving
moveDir = 0;    // direction of movement
moveSpd = random_range(.5, 1);    // how fast player moves left and right

xspd = 0;        // x coordinate
yspd = 0;        // y coordinate

//Jumping
grav = .010;    // consant downward force .330
gfriction = .003; // slows down balls left and right movement

termVel = 1;   // maximum fall speed
maxSpeed = 2; // maximum left right speed


bounce = -0.04  // initial bounce height 10.15

upwardBlast = random_range(-1.5, -.5);


once = true;
oneTime = true;

lifetime = room_speed * 15;

a = 1.4;
b = 0.7;

nextFrame  = 0;

ballhitwall = 0;



justBounced = false;