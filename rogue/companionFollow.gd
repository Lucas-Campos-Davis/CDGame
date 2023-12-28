extends CharacterBody2D

var player;
var companionDirection;
var travelCoords;

func _ready():
	velocity = Vector2.ZERO
	
func go_to_position(coords: Vector2):
	velocity = Vector2.ZERO
	velocity += (global_position.direction_to(coords))*40;
	
	
func _physics_process(delta):
	if Input.is_action_just_released("click"):
		go_to_position(get_global_mouse_position());
		
	else:
		player = get_parent().find_child("player_animations");
		companionDirection = player.companionDirection;
		if companionDirection == "LEFT":
			travelCoords = get_parent().find_child("friend_spot_right").global_position;
		if companionDirection == "RIGHT":
			travelCoords = get_parent().find_child("friend_spot_left").global_position;
			
		

		if global_position.distance_to(travelCoords) < 1:
			velocity = Vector2.ZERO;
		else:
			go_to_position(travelCoords);
			
	move_and_slide();
	

	
	
