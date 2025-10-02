//Moving
moveDir = 0;	// direction of movement
moveSpd = random_range(1.5, 2);	// how fast player moves left and right

xspd = 0;		// x coordinate
yspd = 0;		// y coordinate

//Jumping
grav = .370;	// consant downward force .330
gfriction = .003; // slows down balls left and right movement

termVel = 12;   // maximum fall speed
maxSpeed = 2; // maximum left right speed


bounce = -6.00  // initial bounce height 10.15

upwardBlast = irandom_range(-8, -5);


once = true;
oneTime = true;

lifetime = room_speed * 15;

a = 1.4;
b = 0.7;

nextFrame  = 0;

ballhitwall = 0;



justBounced = false;
