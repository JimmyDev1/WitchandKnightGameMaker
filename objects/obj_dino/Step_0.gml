// ─────────────────────────────────────
// 3. X-Axis Collision and Movement
// ─────────────────────────────────────
var _subPixel = 0.5;

if (place_meeting(x + xspd, y, obj_ground)) {
    var _pixelCheck = _subPixel * sign(xspd);
    while (!place_meeting(x + _pixelCheck, y, obj_ground)) {
        x += _pixelCheck;
    }
    xspd = 0;
}

x += xspd;


// ─────────────────────────────────────
// 6. Y-Axis Collision and Movement
// ─────────────────────────────────────


yspd += grav;

if (yspd > termVel) {
    yspd = termVel;
}


_subPixel = 0.5;

if (place_meeting(x, y + yspd, obj_ground)) {
	
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, obj_ground)) {
		
        y += _pixelCheck;
		
    }
	
    yspd = 0;
	
}

y += yspd;

/**   **/



switch (state) {
	
	
    case DinoState.PATROL:
	
        State_Machine_Dino();
		
        break;
		
	case DinoState.CHARGE:
	
		State_Machine_Dino();
		
        break;
		
		
		
}