extends Camera2D

#@onready var camera = %gameCamera;
#@onready var player = %player;
#@onready var points = %points_of_interest.get_children();
#@onready var cameraTarget = player;
var isCloseToPoint = false;
var newTarget = false;
var t = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#for n in range(points.size()):
	#	if player.global_position.distance_to(points[n].global_position) < points[n].range:
	#		isCloseToPoint = true;
	#		camera.global_position = points[n].global_position;
	#		camera.align();
	#	else:
	#		isCloseToPoint = false;
	#if isCloseToPoint == false:
	#	camera.global_position = player.global_position;
	#	camera.align();
	



