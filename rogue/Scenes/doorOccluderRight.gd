extends LightOccluder2D


# Declare member variables here. Examples:
# var a = 2
var wait = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wait > 450:
		if position.x < 264:
			position.x += 0.03
		
	else:
		wait += 1
