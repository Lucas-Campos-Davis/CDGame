extends StaticBody2D



onready var doorLeft = get_node("doorLeft")
onready var doorRight = get_node("doorRight")
onready var doorMain = get_node("doorMain")
onready var doorDark = get_node("doorDark")

var amount = 0.5

func _process(delta):
	if doorLeft.position.x < -56:
		doorLeft.position.x += amount
	if doorRight.position.x > -40:
		doorRight.position.x -= amount
	else:
		doorLeft.visible = false
		doorRight.visible = false
		doorDark.visible = false
		doorMain.visible = true
