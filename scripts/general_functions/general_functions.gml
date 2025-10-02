function controlsSetup(){

jumpBufferTime = 5;

jumpKeyBuffered = 0;
jumpKeyBufferTimer = 0;


// double tap attack button necessary logic
onetap = false;
framecount = 0;

}


function getControls(){
	
leftKey = keyboard_check(ord("A")) || gamepad_axis_value(0, gp_axislh) < -0.5;
rightKey = keyboard_check(ord("D")) || gamepad_axis_value(0, gp_axislh) > 0.5;
downKey  = keyboard_check(ord("S")) || gamepad_axis_value(0, gp_axislh) >  0.5;
downKeyPressed =  keyboard_check_pressed(ord("S"))
upKey    = keyboard_check(ord("W")) || gamepad_axis_value(0, gp_axislh) < -0.5;

//Jump input
jumpKeyPressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
jumpKey = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);

// Attack input
attackKeyPressed = keyboard_check_pressed(ord("L")) || gamepad_button_check_pressed(0, gp_face3);
attackKey        = keyboard_check(ord("L")) || gamepad_button_check(0, gp_face3);



// buffer logic
	if (jumpKeyPressed){

	jumpKeyBufferTimer = jumpBufferTime;

	}
	if (jumpKeyBufferTimer > 0) {

		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;

	}
	else{
		
		jumpKeyBuffered = 0;
		
		}
		
		
	
		
	//double tap attack button logic 
	if(attackKeyPressed || onetap){
		
		onetap = true
		framecount++
	
		if (framecount < 25 && framecount > 1){

			if(attackKeyPressed){
			
				doubleAttackKeyPressed = 1;
				onetap = false
				framecount = 0
				
			}
		
		}
		
		if(framecount > 25){ 
		
			onetap = false
			framecount = 0
		
		}
		
	}
	else{doubleAttackKeyPressed = 0;}
		
	

}



