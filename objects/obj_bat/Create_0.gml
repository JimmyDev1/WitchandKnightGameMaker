HP = 50;
invuln_timer = 0;

//direction and scale

image_xscale = 2.;
image_yscale = 2.;

sprite_index = spr_enemy_bat;
image_speed = 0.4;



// 2. Movement & Physics
moveDir = 0;      // direction of movement
moveSpd = 7;      // horizontal speed
xspd = 0;         // x velocity
yspd = 0;         // y velocity

enum BatState {
    IDLE,
	PATROL,
	ALERT,
	FOLLOW,
	ATTACK,
	HURT,
	DEAD
}

instance_create_layer(x, y + 128, "Hitboxes", obj_bat_detection);
instance_create_layer(x, y + 128, "Hitboxes", obj_bat_detection_2);


enemyHit = function(damage) {

	
    if (invuln_timer <= 0) {
		
        invuln_timer = 25;
		
        HP -= damage;
        sprite_index = spr_enemy_bat_damage;
        image_index = 0;

        instance_create_layer(x, y - 100, "Effects", obj_effect_flinch);

        if (!instance_exists(obj_effect_slice)) {
            instance_create_layer(x, y, "Effects", obj_effect_slice);
        }
		
    }
	
	
if (HP <= 0) {
	
    instance_create_layer(x, y, "Effects", obj_enemy_death_effect);
	show_debug_message("Trying to destroy: " + string(id));
    instance_destroy();
	
	//health orbs
		var randballshealth = irandom_range(1, 4);
	
	for(var i = 0; i < randballshealth; i++){
		
		var rand = irandom_range(-16, 16); // random offset around the enemy
		
		instance_create_layer(x + rand, y, "Effects", obj_item_health_orb);
		
	}
	
	//magic orbs
	var randballsmagic = irandom_range(1, 4);
	
	for(var i = 0; i < randballsmagic; i++){
		
		var rand = irandom_range(-16, 16); // random offset around the enemy
		
		instance_create_layer(x + rand, y, "Effects", obj_item_magica_orb);
		
	}
	
	
	
	
}

	
};