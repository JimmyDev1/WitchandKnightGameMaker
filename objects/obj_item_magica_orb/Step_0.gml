
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


// y collision ^|↓
	
if place_meeting( x, y + yspd, obj_ground){
	
	var _pixelCheck = _subPixel *sign(yspd);
		
	while !place_meeting(x, y + _pixelCheck, obj_ground){
	
		y+= _pixelCheck;

	}
		
	yspd = 0;	
}
	
y += yspd;







