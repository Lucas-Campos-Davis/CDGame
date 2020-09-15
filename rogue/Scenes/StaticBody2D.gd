extends StaticBody2D



var Bullet = preload("res://Scenes/Bullet.tscn")
var wait = 0;
onready var Muzzle = get_node("Muzzle")

func shoot():
	var b = Bullet.instance()
	b.start(Muzzle.position, 3)
	get_parent().add_child(b)

func _process(delta):
	if wait == 0:
		shoot()
		wait = 30
	else:
		wait -= 1
