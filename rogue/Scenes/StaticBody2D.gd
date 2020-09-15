extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Bullet = preload("res://Scenes/Bullet.tscn")
var wait = 0;
onready var Muzzle = get_node("Muzzle")
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if wait == 0:
		shoot()
		wait = 30
	else:
		wait -= 1
func shoot():
	# "Muzzle" is a Position2D placed at the barrel of the gun.
	var b = Bullet.instance()
	b.start(Muzzle.position, 90)
	print("made bullet")
	get_parent().add_child(b)
