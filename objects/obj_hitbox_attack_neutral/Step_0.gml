// check if hitbox is touching enemy


var _list = ds_list_create();
var _num = instance_place_list(x, y, obj_bat, _list, false);

if (_num > 0)
{
    for (var i = 0; i < _num; i++)
    {
		
       _list[| i].enemyHit(damage); // <- clean and simple
     
	 
    }
}


ds_list_destroy(_list); // Clean up the list after use



/**
with(obj_bat){

	if place_meeting(x, y, other){
		
		enemyHit(other.damage);
		
		//with (other) instance_destroy(); i dont want to destroy the hit box as soon as the enemy is hit
	}

}  **/


//var hitList = collision_rectangle_list(x, y, x + sprite_width, y + sprite_height, obj_bat, false, true, false, false);