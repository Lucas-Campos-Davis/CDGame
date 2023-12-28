extends CharacterBody2D

var player = preload("res://player.tscn");

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	move_and_slide(player.getposisition);
	move_and_slide(player.getposisition);
