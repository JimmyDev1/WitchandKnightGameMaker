function State_Machine_Dino(){


 switch (state) {
		
        case DinoState.PATROL:

			if(getNewRandValue == true){
			
				stopGEarly = irandom_range(30, 150);
				stopWEarly = irandom_range(4, 100);
			}
			getNewRandValue = false;
			
			var ground_check_x = x + facing * stopGEarly;
			var ground_check_y = y + 5;
			
			if(position_meeting(ground_check_x, ground_check_y, obj_ground) && position_meeting(x + facing * 30, ground_check_y, obj_ground)){
			
				var ground_ahead = true;
			
			}
			else{ var ground_ahead = false; }
			
			if(place_meeting(x + facing * stopWEarly, y, obj_ground) || place_meeting(x + facing * 4, y, obj_ground)){
			
				var wall_ahead = true;
			
			}
			else{ var wall_ahead = false; }
			
			
			
			
			if (!wall_ahead && ground_ahead) {
			
				xspd = facing * moveSpd;	
				sprite_index = spr_enemy_dino_walk;
				image_speed = 0.2;
				
			
			}
			else{ 
				
				if (alarm[0] <= 0){
					
					var randtime = irandom_range(2, 6);
					alarm[0] = room_speed * randtime;
					
				}
					
				xspd = 0;
				sprite_index = spr_enemy_dino_idle;
				
			}
			
			
			
			
			break;
			
			
			
		case DinoState.CHARGE:
			
			var ground_check_x = x + facing * 30;
            var ground_check_y = y + 5;
            
            var ground_ahead = position_meeting(ground_check_x, ground_check_y, obj_ground);
            var wall_ahead = place_meeting(x + facing * 1, y, obj_ground);
            
            
            
            if (!wall_ahead && ground_ahead && !stop) {
            
				moveSpd = 5;
                xspd = facing * moveSpd;
				
                sprite_index = spr_enemy_dino_charge;
                image_speed = 0.5;
            
            }
			else{ 
				
				if(!ground_ahead && !stop ){
					
					if (alarm[1] <= 0){
					
					var randtime = irandom_range(2, 6);
					alarm[1] = room_speed * randtime;
					
					}
					
					xspd = 0;
					sprite_index = spr_enemy_dino_idle;
					image_speed = 0.2;
	
				}
				
				if(wall_ahead || con){
					
					if (once){
					
						yspd = -3;
						xspd = facing * -abs((moveSpd / 2)); 
						
						con = true;
						once = false;
						stop = true;
					
					}
					// Smooth horizontal deceleration
					 xspd *= 0.85;
					if (abs(xspd) < 0.1) xspd = 0;

					
					sprite_index = spr_enemy_dino_damage;
					image_speed = 0.2;
					
					if (alarm[2] <= 0){
					
					var randtime = irandom_range(2, 6);
					alarm[2] = room_speed * randtime;
					
					}
					

				
				}
				
				
			}
			
			
			
			break;
		
 }



}