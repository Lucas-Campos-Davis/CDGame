extends Button

func _process(delta):
	if pressed:
		get_tree().change_scene("res://Scenes/testingGround.tscn")
