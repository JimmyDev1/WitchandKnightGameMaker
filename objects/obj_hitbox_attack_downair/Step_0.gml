with(obj_bat){

	if place_meeting(x, y, other){
		
		enemyHit(other.damage);
		
		//with (other) instance_destroy(); i dont want to destroy the hit box as soon as the enemy is hit
	
	}

}

with(obj_bat){

	if place_meeting(x, y, other){
		
		with(obj_player){ yspd = -11.15;}
	
	}

}