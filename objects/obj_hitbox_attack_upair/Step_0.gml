with(obj_bat){

	if place_meeting(x, y, other){
		
		enemyHit(other.damage);
		other.hit = true;
		//with (other) instance_destroy(); // i dont want to destroy the hit box as soon as the enemy is hit
		
	}
	
}

with(obj_player){
			
			if(doubleAttackKeyPressed && other.hit){
				
				yspd = -11.15;
				instance_create_layer(x, y, "Effects", obj_effect_wind);
				other.hit = false;
			}
		
			
		} //MAKE IT SO THAT ON THE SECOND TAP THE HITBOX DOESNT ALSO NEED TO BE TOUCHING THE BAT
		
		
with(obj_dash_gem){

	if place_meeting(x, y, other){
		
		with(obj_player){ yspd = -11.15;}
		instance_create_layer(x, y, "Effects", obj_effect_wind);
		//with (other) instance_destroy(); // i dont want to destroy the hit box as soon as the enemy is hit
		
		sprite_index = spr_item_dash_gem_activate
		image_speed = 0.3
	}
	
	
	
}		
