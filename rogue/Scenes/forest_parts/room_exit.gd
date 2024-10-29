extends Area2D
@export var go_to_room = "";
@export var new_player_pos: Vector2;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_overlapping_bodies():
		PlayerVariables.player_position = new_player_pos;
		get_tree().change_scene_to_file(go_to_room);

#func _on_body_entered(body):
	#get_tree().change_scene_to_file(go_to_room);
