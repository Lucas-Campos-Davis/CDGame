extends AnimatedSprite2D

@export var companionDirection = "LEFT";

func get_input():
	var player = get_parent().get_parent();
	if Input.is_action_pressed('up'):
		play("walk_up")
		stop_animation_on_stopped(player.get_real_velocity());
		
	if Input.is_action_pressed('down'):
		play("walk_down")
		stop_animation_on_stopped(player.get_real_velocity());
		
	if Input.is_action_pressed('right') && !Input.is_action_pressed('up') && !Input.is_action_pressed('down'):
		play("walk_right")
		companionDirection = "RIGHT";
		stop_animation_on_stopped(player.get_real_velocity());
		
	if Input.is_action_pressed('left') && !Input.is_action_pressed('up') && !Input.is_action_pressed('down'):
		play("walk_left")
		companionDirection = "LEFT";
		stop_animation_on_stopped(player.get_real_velocity());
		
	if !Input.is_action_pressed('right') && !Input.is_action_pressed('left') && !Input.is_action_pressed('down') && !Input.is_action_pressed('up'): 
		if frame == 0 || frame == 4:
			stop()
		
func stop_animation_on_stopped(player_velocity):
	if (player_velocity.y == 0 && player_velocity.x == 0) || (player_velocity.x == 0 && player_velocity.y == 0):
		if frame == 0 || frame == 4:
			stop()

func _physics_process(delta):
	get_input()
