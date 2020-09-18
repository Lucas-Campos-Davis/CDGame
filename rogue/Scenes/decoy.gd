extends StaticBody2D

onready var player = get_parent().get_node("player")
onready var dialogueBox = get_parent().get_parent().get_node("playerGUI").get_node("dialogueBox")
onready var keyPrompt = get_parent().get_parent().get_node("playerGUI").get_node("keyPrompt")
onready var alertBox = get_node("alertBox")

var text = ["Hey buddy, go fuck yourself","please fuck off", "0"]

func _ready():
	pass





