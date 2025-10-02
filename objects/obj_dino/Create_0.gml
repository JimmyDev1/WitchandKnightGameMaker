forwardDetect = instance_create_layer(x, y, "Hitboxes", obj_dino_forward_detection);
forwardDetect.parentDino = id;

instance_create_layer(x, y, "Hitboxes", obj_dino_platform_detection);

//direction and scale
image_xscale = 4;
image_yscale = 4;
image_speed = 0.2;
facing      = 1; // 1 = right, -1 = left


// 2. Movement & Physics
moveDir = 0;      // direction of movement
moveSpd = 3;      // horizontal speed
xspd = 0;         // x velocity
yspd = 0;         // y velocity

// Jump & Gravity
grav     = 0.330;   // gravity strength
termVel  = 12;      // terminal fall velocity
jspd     = -10.15;  // jump speed
dspd     = 2;       // down key adds speed when falling


state = DinoState.PATROL;

enum DinoState {
	
	PATROL,
	CHARGE,
	HURT,
	DEAD
}

getNewRandValue = true;
once = true;
stay = true;
stop = false;
con = false;