extends Node2D

@export var stage_length = 0.1;
@export var max_random_length = 0.15
@export var ripe_length = 4;
@export var ripe_frame = 1;
@export var die_after_harvest = false;

@onready var canvas_modulate = $"../../CanvasModulate"
@onready var time_since_last_growth = 0;
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize();
	position.x = position.x + randf_range(-2, 2);
	position.y = position.y + randf_range(-2, 2);
	$AnimatedSprite2D.flip_h = random.randi_range(0,1);
	time_since_last_growth = canvas_modulate.time;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	if $AnimatedSprite2D.frame == ripe_frame:
		if time_since_last_growth < canvas_modulate.time - ((stage_length + randf_range(0.1, max_random_length))*ripe_length):
			$AnimatedSprite2D.frame += 1;
			time_since_last_growth = canvas_modulate.time;
	else:
		if time_since_last_growth < canvas_modulate.time - (stage_length + randf_range(0.1, max_random_length)):
			$AnimatedSprite2D.frame += 1;
			time_since_last_growth = canvas_modulate.time;
