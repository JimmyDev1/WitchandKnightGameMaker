function enemyDit(damage){

	if (invuln_timer <=0){
		
		invuln_timer = 25;

	        HP -= damage;
	        sprite_index = spr_enemy_bat_damage;
	        image_index = 0;
			
			
			
			instance_create_layer(x, y - 100, "Effects", obj_effect_flinch);
			
	if(!instance_exists(obj_effect_slice)){
			
			instance_create_layer(x, y, "Effects", obj_effect_slice);
		}
		
		

	}

}




