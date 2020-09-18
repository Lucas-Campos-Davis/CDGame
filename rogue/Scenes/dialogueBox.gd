extends ColorRect


onready var dialogues = get_tree().get_nodes_in_group("dialogue")
onready var player = get_parent().get_parent().get_node("YSort").get_node("player")
onready var keyPrompt = get_parent().get_node("keyPrompt")
var closestDialogue 
var text
var emptyFlag = true
var chatLevel = 0

func getClosest():
	var closest
	for i in dialogues:
		var distanceToPlayer = player.get_global_position().distance_to(i.get_global_position())
		if distanceToPlayer < 50:
			closest = i
			text = closest.text
			emptyFlag = false
		if distanceToPlayer >= 50:
			emptyFlag = true

func _process(delta):
	closestDialogue = getClosest()
	if emptyFlag == false:
		if visible == false:
			keyPrompt.visible = true
		if Input.is_action_just_pressed("interact") && chatLevel < text.size():
			print(text.size())
			get_node("text").text = text[chatLevel]
			keyPrompt.visible = false
			player.canMove = false
			visible = true
			chatLevel += 1
			get_node("continuePrompt").visible = true
			
		if Input.is_action_just_pressed("interact") && chatLevel >= text.size():
			chatLevel = 0
			keyPrompt.visible = true
			player.canMove = true
			visible = false
			get_node("continuePrompt").visible = false
	else:
		keyPrompt.visible = false
		visible = false
