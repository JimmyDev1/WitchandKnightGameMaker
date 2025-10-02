
if (instance_exists(parentDino)) {
    x = parentDino.x;
    y = parentDino.y;
    image_xscale = 4 * parentDino.facing;
}

if place_meeting(x, y, obj_player){
	
		if (instance_exists(parentDino)) {
			
        parentDino.state = DinoState.CHARGE; // tell the parent to charge
		
    }
	
}


//with (other) instance_destroy(); i dont want to destroy the hit box as soon as the enemy is hit
	
	


