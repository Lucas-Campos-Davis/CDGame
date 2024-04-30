extends Node2D
@export var TYPE = "";
@onready var VARIANTS = get_children();
@onready var VARIANT_1 = find_child("variant_1");
@onready var VARIANT_2 = find_child("variant_2");
@onready var VARIANT_3 = find_child("variant_3");

func genMushrooms():
	setMushroomPosisitions(VARIANT_1);
	setMushroomPosisitions(VARIANT_2);
	setMushroomPosisitions(VARIANT_3);

func setMushroomPosisitions(variant:Sprite2D):
	var rng = RandomNumberGenerator.new()
	var random_placement = Vector2(rng.randi_range(-8.0, 8.0), rng.randi_range(-8.0, 8.0))
	var current_position = position;
	var new_position = position - random_placement;
	variant.set_global_position(new_position);
	
func _ready():
	if TYPE != "":
		genMushrooms();
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
