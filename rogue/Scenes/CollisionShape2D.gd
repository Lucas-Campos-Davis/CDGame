extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hitBox = get_parent().get_parent().get_node("player").get_node("hitBox")


# Called when the node enters the scene tree for the first time.
func _ready():
	if body_entered(hitBox):
		
