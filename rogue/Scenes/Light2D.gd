extends Light2D

var wait = 400

func _process(delta):
	if wait == 0:
		if energy >= 0:
			energy -= 0.005
	else:
		wait -= 1

