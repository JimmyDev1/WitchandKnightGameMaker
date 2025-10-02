// PlayerState_Attack Script
function PlayerState_Attack() {
	

    switch (action_state) {
		
		
        case AttackState.ATTACK_UP_GROUND:
		
            sprite_index = spr_knight_attack_upair;
            image_speed = 0.35;
			
			if (!attack_started) {
                
                attack_started = true;
                image_index = 0; // force reset to frame 0
            }
			
			if (floor(image_index) == 0 && !hitbox_spawned) {
			   
			    hitbox_spawned = true;
			   
				var hitbox = instance_create_layer(x, y, "Hitboxes", obj_hitbox_attack_upair);
				
				hitbox.player = id;
			
		    }
			
            if (animation_done()) {
				
				hitbox_spawned = false;
				attack_started = false;
				
				if (instance_exists(obj_hitbox_attack_upair)) { with (obj_hitbox_attack_upair) instance_destroy();}
                
				if (grounded() && xspd == 0) { state = PlayerState.MOVE; action_state = MoveState.IDLE;} 
				else if (grounded() && xspd != 0) {  state = PlayerState.MOVE; action_state = MoveState.WALK;} 
				else if (yspd < 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_RISE;} 
				else if (yspd > 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_FALL;}
				
            }
			
            break;

          case AttackState.ATTACK_UP_AIR:
		  
            sprite_index = spr_knight_attack_upair;
            image_speed = 0.35;
			
			if (!attack_started) {
				
                attack_started = true;
                image_index = 0; // force reset to frame 0
				
            }
			
			if (floor(image_index) == 0 && !hitbox_spawned) {
			   
			   hitbox_spawned = true;
			   
				var hitbox = instance_create_layer(x, y, "Hitboxes", obj_hitbox_attack_upair);
				
				hitbox.player = id;
			
			}
			
            if (animation_done()) {
				
				hitbox_spawned = false;
				attack_started = false;
				
				if (instance_exists(obj_hitbox_attack_upair)) { with (obj_hitbox_attack_upair) instance_destroy();}
				
                if (grounded() && xspd == 0) { state = PlayerState.MOVE; action_state = MoveState.IDLE; } 
                else if (grounded() && xspd != 0) { state = PlayerState.MOVE; action_state = MoveState.WALK; } 
                else if (yspd < 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_RISE; } 
                else if (yspd > 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_FALL; }
            }
            break;

        case AttackState.ATTACK_NEUTRAL:
		
            sprite_index = spr_knight_attack_neutral;
            image_speed = 0.35;
			
			if (!attack_started) {
				
                attack_started = true;
                image_index = 0; // force reset to frame 0
            }
			
			
           if (floor(image_index) == 0 && !hitbox_spawned) {
			   
				hitbox_spawned = true;
			   
				var hitbox = instance_create_layer(x, y, "Hitboxes", obj_hitbox_attack_neutral);
				
				hitbox.player = id;
			
		   }
		   
            if (animation_done()) {
				
				hitbox_spawned = false;
				attack_started = false;
				
				if (instance_exists(obj_hitbox_attack_neutral)) { with (obj_hitbox_attack_neutral) instance_destroy();}
				
                if (grounded() && xspd == 0) { state = PlayerState.MOVE; action_state = MoveState.IDLE; } 
                else if (grounded() && xspd != 0) { state = PlayerState.MOVE; action_state = MoveState.WALK; } 
                else if (yspd < 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_RISE; } 
                else if (yspd > 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_FALL; }
				
				
            }
            break;

        case AttackState.ATTACK_NEUTRAL_AIR:
		
            sprite_index = spr_knight_attack_neutral;
            image_speed = 0.35;
			
			if (!attack_started) {
				
			    attack_started = true;
			    image_index = 0; // force reset to frame 0
			}
			
		
			if (floor(image_index) == 0 && !hitbox_spawned) {
				
				hitbox_spawned = true;
			   
				var hitbox = instance_create_layer(x, y, "Hitboxes", obj_hitbox_attack_neutral);
				
				hitbox.player = id;
			
			}
			
		
            if (animation_done()) {
				
				hitbox_spawned = false;
				attack_started = false;
				
				if (instance_exists(obj_hitbox_attack_neutral)) { with (obj_hitbox_attack_neutral) instance_destroy();}
				// i need it to dissapear by frame 3 of the attack not when the animation is done 
				
                if (grounded() && xspd == 0) { state = PlayerState.MOVE; action_state = MoveState.IDLE; } 
                else if (grounded() && xspd != 0) { state = PlayerState.MOVE; action_state = MoveState.WALK; } 
                else if (yspd < 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_RISE; } 
                else if (yspd > 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_FALL; }
            }
            break;



        case AttackState.ATTACK_DOWN_AIR:
		
            sprite_index = spr_knight_attack_downair;
            image_speed = 0.35;
			
			if (!attack_started) {
				
			    attack_started = true;
			    image_index = 0; // force reset to frame 0
			}
			
			
			if (floor(image_index) == 0 && !hitbox_spawned) {
				
				hitbox_spawned = true;
			   
				var hitbox = instance_create_layer(x, y, "Hitboxes", obj_hitbox_attack_downair);
				
				hitbox.player = id;
			
			}
			
            if (animation_done()) {
				
				hitbox_spawned = false;
				attack_started = false;
				
				if (instance_exists(obj_hitbox_attack_downair)) { with (obj_hitbox_attack_downair) instance_destroy();}
				
                if (grounded() && xspd == 0) { state = PlayerState.MOVE; action_state = MoveState.IDLE; } 
                else if (grounded() && xspd != 0) { state = PlayerState.MOVE; action_state = MoveState.WALK; } 
                else if (yspd < 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_RISE; } 
                else if (yspd > 0) { state = PlayerState.MOVE; action_state = MoveState.JUMP_FALL; }
            }
            break;
			
			
			
			//switch end
    }
	
	
	
	
	
	//attack function end
}
