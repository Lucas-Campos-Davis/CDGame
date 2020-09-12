extends Sprite

var transparency = 1;
var wait = 400

func _process(delta):
	if wait == 0:
		transparency -= 0.005
		set_modulate(Color(1,1,1,transparency))
	else:
		wait -= 1
