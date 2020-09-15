extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var textureEmpty = load("res://Textures/healthEmpty.png")
var textureFull = load("res://Textures/healthFull.png")
onready var player = get_parent().get_parent().get_node("YSort").get_node("player")
onready var health1 = get_node("health1")
onready var health2 = get_node("health2")
onready var health3 = get_node("health3")
onready var health4 = get_node("health4")
onready var health5 = get_node("health5")

var wait = 0




func _process(delta):
		if player.health == 4:
			health5.texture = textureEmpty
			health4.texture = textureFull
			health3.texture = textureFull
			health2.texture = textureFull
			health1.texture = textureFull
		if player.health == 3:
			health5.texture = textureEmpty
			health4.texture = textureEmpty
			health3.texture = textureFull
			health2.texture = textureFull
			health1.texture = textureFull
		if player.health == 2:
			health5.texture = textureEmpty
			health4.texture = textureEmpty
			health3.texture = textureEmpty
			health2.texture = textureFull
			health1.texture = textureFull
		if player.health == 1:
			health5.texture = textureEmpty
			health4.texture = textureEmpty
			health3.texture = textureEmpty
			health2.texture = textureEmpty
			health1.texture = textureFull
		if player.health <=0:
			health5.texture = textureEmpty
			health4.texture = textureEmpty
			health3.texture = textureEmpty
			health2.texture = textureEmpty
			health1.texture = textureEmpty
	
