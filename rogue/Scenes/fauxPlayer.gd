extends Sprite


var change = 16;

func _process(delta):
	if change == 70:
		visible = false
	else:
		change += 0.25
		position.y = change

