extends CharacterBody2D

var player;
var playerBody
var companionDirection;
var companionDirectionCoords;
var travelCoords;


func _ready():
	velocity = Vector2.ZERO
	player = get_parent().find_child("player_animations");
	playerBody = get_parent().find_child("player");
	
func go_to_position(coords: Vector2):
	velocity = Vector2.ZERO;
	velocity += (global_position.direction_to(coords)) * (40);
	if playerBody.get_velocity() != Vector2.ZERO:
		velocity += (global_position.direction_to(coords)) * (20);
	
func _physics_process(delta):
	velocity = Vector2.ZERO;
	
	companionDirection = player.companionDirection;
	#these are assigned counter-intuitivley,
	#but it's so the companion will not be n front of the player and 'block' their view
	if companionDirection == "LEFT": 
		companionDirectionCoords = get_parent().find_child("friend_spot_right").global_position;
	if companionDirection == "RIGHT":
		companionDirectionCoords = get_parent().find_child("friend_spot_left").global_position;
		
	travelCoords = companionDirectionCoords;
	
	if global_position.distance_to(travelCoords) < 1:
			velocity = Vector2.ZERO;
	else:
		go_to_position(travelCoords);
			
	move_and_slide();
	

	
	
