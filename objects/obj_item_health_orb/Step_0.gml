
// x collision <------------x------------->

var _subPixel =.5;

if (place_meeting(x + xspd, y, obj_ground)) {
	
    var _pixelCheck = _subPixel * sign(xspd);
	
    while (!place_meeting(x + _pixelCheck, y, obj_ground)) {
		
        x += _pixelCheck;
		
    }
	
    xspd = -xspd * 0.8; // bounce once, then stop trying
}


x += xspd; 


//Apply gravity
yspd += grav; // gravity always on


if (xspd != 0) {
	xspd -= sign(xspd) * gfriction;
	
	// Clamp to 0 so it doesn't jitter back and forth
	if (abs(xspd) < gfriction) {
		xspd = 0;
	}
}


if yspd > termVel { yspd = termVel;} // falling speed wont pass terminal velocity


//uneeded max speed
/*if (abs(xspd) > maxSpeed) {
	xspd = sign(xspd) * maxSpeed;
} */


// y collision ^|↓
	
if place_meeting( x, y + yspd, obj_ground){
	
	var _pixelCheck = _subPixel *sign(yspd);
		
	while !place_meeting(x, y + _pixelCheck, obj_ground){
	
		y+= _pixelCheck;

	}
		
	yspd = 0;	
}
	
y += yspd;


//initial upward shot
if (oneTime == true){

yspd = upwardBlast;

oneTime = false;

}

//ground bouncel

if (yspd > 0){ bounce -= 0.12 } // i want it to pick up momentum if it roll off a ledge and falls from somewhere high 0.03

if place_meeting(x, y + 1, obj_ground){

	yspd += bounce;
	
	bounce /= 1.6; //1.5
	
	if bounce > -4 { bounce = -4;}

}

//random move direction
if (once == true) {
	
	moveDir = choose(-1, 1);
	xspd = moveDir * moveSpd;
	
	once = false;
	
}

lifetime -= 1;
if (lifetime < 300){
	
	if (sprite_index != spr_item_health_orb_disappear) {
		
		sprite_index = spr_item_health_orb_disappear;
		image_speed = 0.2;
	}
	
	if (lifetime <= 0) {
	    instance_destroy();
		
		
	}
	
}



if (grounded()) {
    if (sprite_index != spr_item_health_orb_bounce) {
        sprite_index = spr_item_health_orb_bounce;
        image_speed = 0.7;
        image_index = 0;
        justBounced = true;
    }
}

if (!grounded() && justBounced && animation_done()) {
    sprite_index = spr_item_health_orb;
    justBounced = false;
}