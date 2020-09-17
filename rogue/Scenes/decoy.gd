extends StaticBody2D

onready var player = get_parent().get_node("player")
onready var dialogueBox = get_parent().get_parent().get_node("playerGUI").get_node("dialogueBox")
onready var keyPrompt = get_parent().get_parent().get_node("playerGUI").get_node("keyPrompt")
onready var alertBox = get_node("alertBox")
var text = "Hey buddy, go fuck yourself"

var isInteracting = false

func interact(var string, var interacting):
	if interacting == true:
		keyPrompt.visible = false
		alertBox.visible = false
		dialogueBox.visible = true
		dialogueBox.get_node("text").text(text)
		

func _ready():
	pass




func _process(delta):
	var distanceToPlayer = player.get_global_position().distance_to(get_global_position())
	if distanceToPlayer < 50:
		keyPrompt.visible = true
		if Input.is_action_just_pressed("interact"):
			isInteracting = true
			keyPrompt.visible = false
			alertBox.visible = false
			dialogueBox.visible = true
			dialogueBox.get_node("text").text(text)
	else:
		isInteracting = false
		keyPrompt.visible = false
		dialogueBox.visible = false;
		interact(text, isInteracting)
		
	if isInteracting == true:
		keyPrompt.visible = false
