function PlayerState_Move() {
	
    // --- Switch based on action_state ---
	

    switch (action_state) {
		
        case MoveState.IDLE:
		
            sprite_index = spr_knight_idle;
            image_index = 0;
            image_speed = 0;

            if (attackKeyPressed) {
			
                state = PlayerState.ATTACK;
				
				
                if(upKey && attackKeyPressed && grounded()) action_state = AttackState.ATTACK_UP_GROUND; 
				if(!upKey && attackKeyPressed && grounded()) action_state = AttackState.ATTACK_NEUTRAL;
				
				
				PlayerState_Attack();
				
                return;
				
            }

            if (xspd != 0) action_state = MoveState.WALK;
            else if (yspd < 0) action_state = MoveState.JUMP_RISE;
            else if (!grounded()) action_state = MoveState.JUMP_PEAK;
			
            break;



        case MoveState.WALK:
		
            sprite_index = spr_knight_walk;
            image_speed = 0.2;
			

            if (attackKeyPressed) {
			
                state = PlayerState.ATTACK;
				
				
                if(upKey && attackKeyPressed && grounded()) action_state = AttackState.ATTACK_UP_GROUND; 
				if(!upKey && attackKeyPressed && grounded()) action_state = AttackState.ATTACK_NEUTRAL;
				
				PlayerState_Attack();
				
                return;
				
            }

            if (xspd == 0 && grounded()) action_state = MoveState.IDLE;
            else if (yspd < 0) action_state = MoveState.JUMP_RISE;
            else if (!grounded()) action_state = MoveState.JUMP_PEAK;
			
            break;

       
		 case MoveState.JUMP_RISE:
		
            sprite_index = spr_knight_rise;
            image_speed = 0.2;

            if (attackKeyPressed) {
				
                state = PlayerState.ATTACK;
				
				if(!upKey && !downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_NEUTRAL_AIR; // NEUTRAL AIR
                if(upKey && !downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_UP_AIR; // UP AIR
                if(!upKey && downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_DOWN_AIR; // DOWN AIR
				
				
				PlayerState_Attack();
				
			
                return;
				
            }

			if(yspd > 0) action_state = MoveState.JUMP_PEAK; // right before falling
			
            break;
		
		case MoveState.JUMP_PEAK: 
			
            sprite_index = spr_knight_peak;
            image_speed = 0.2;
			
			
			if (attackKeyPressed) {
				
                state = PlayerState.ATTACK;
				
				if(!upKey && !downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_NEUTRAL_AIR; // NEUTRAL AIR
                if(upKey && !downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_UP_AIR; // UP AIR
                if(!upKey && downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_DOWN_AIR; // DOWN AIR
				
				PlayerState_Attack();
			
                return;
				
            }

            if(grounded() && xspd == 0 ) action_state = MoveState.IDLE; 
            else if(grounded() && xspd != 0 ) action_state = MoveState.WALK; // walking
            else if(animation_done() && yspd > 0) action_state = MoveState.JUMP_FALL; // falling
			 
			
            break;
		
		case MoveState.JUMP_FALL:
		
            sprite_index = spr_knight_fall;
            image_speed = 0.2;

            if (attackKeyPressed) {
				
                state = PlayerState.ATTACK;
				
				if(!upKey && !downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_NEUTRAL_AIR; // NEUTRAL AIR
                if(upKey && !downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_UP_AIR; // UP AIR
                if(!upKey && downKey && attackKeyPressed && !grounded()) action_state = AttackState.ATTACK_DOWN_AIR; // DOWN AIR
				
				PlayerState_Attack();
				
                return;
				
            }

             if(grounded() && xspd == 0 ) action_state = MoveState.IDLE; //idle
             else if(grounded() && xspd != 0 ) action_state = MoveState.WALK; // walking
			
            break;
		
    }
	
	
	
}


