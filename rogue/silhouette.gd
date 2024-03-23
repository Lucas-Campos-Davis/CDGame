extends AnimatedSprite2D

@export var companionDirection = "LEFT";

func get_input():
	if Input.is_action_pressed('up'):
		play("walk_up")
		
	if Input.is_action_pressed('down'):
		play("walk_down")
		
	if Input.is_action_pressed('right') && !Input.is_action_pressed('up') && !Input.is_action_pressed('down'):
		play("walk_right")
		companionDirection = "RIGHT";
		
	if Input.is_action_pressed('left') && !Input.is_action_pressed('up') && !Input.is_action_pressed('down'):
		play("walk_left")
		companionDirection = "LEFT";
		
	if !Input.is_action_pressed('right') && !Input.is_action_pressed('left') && !Input.is_action_pressed('down') && !Input.is_action_pressed('up'): 
		stop()
		frame = 0

func _physics_process(delta):
	get_input()
