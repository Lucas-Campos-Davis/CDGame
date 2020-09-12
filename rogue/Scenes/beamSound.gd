extends AudioStreamPlayer2D


var volume = 1;
var wait = 400

func _process(delta):
	if wait == 0:
		volume_db -= 0.15
	else:
		wait -= 1

