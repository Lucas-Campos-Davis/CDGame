extends Light2D

var wait = 400

func _process(delta):
	if wait == 0:
		visible = true
	else:
		wait -= 1
