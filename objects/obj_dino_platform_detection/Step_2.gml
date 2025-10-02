var dino = instance_nearest(x, y, obj_dino);

if (instance_exists(dino)) {
	
    x = dino.x;
    y = dino.y;
    image_xscale = 4 * dino.facing;
	
}
