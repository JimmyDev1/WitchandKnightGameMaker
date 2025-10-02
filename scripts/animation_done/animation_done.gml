function animation_done(_sprite = sprite_index, _image = image_index, _speed = image_speed) {
    return _image + _speed >= sprite_get_number(_sprite);
}