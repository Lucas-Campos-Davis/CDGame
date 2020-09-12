extends YSort


var transparency = 1
var wait = 400
var amount = 0.005

onready var lightBeamBase = get_node("lightBeam/lightBeamBase")
onready var lightBeam = get_node("lightBeam/lightBeam")
onready var light = get_node("lightBeam/Light")
onready var beamSound = get_node("lightBeam/beamSound")
onready var outsideLight = get_node("outsideLight")
onready var player = get_node("player")
onready var playerShadow = get_node("player/playerShadow")

onready var doorOccluderRight = get_node("doorOccluderRight")
onready var doorOccluderLeft = get_node("doorOccluderLeft")

func _process(delta):
	if wait <= 0:
		transparency -= amount
		lightBeamBase.set_modulate(Color(1,1,1,transparency))
		lightBeam.set_modulate(Color(1,1,1,transparency))
		
		beamSound.volume_db -= 0.15
		
		outsideLight.visible = true
		
		if player.position.y < 64 && player.canMove == false:
			player.position.y += 0.25
		else:
			player.canMove = true
			playerShadow.visible = true
			
		
		
		if light.energy >= 0:
			light.energy -= amount
			
		if wait > -50:
			wait -= 1
		if wait < -50:
			if doorOccluderLeft.position.x > 40:
				doorOccluderLeft.position.x -= 0.03
			if doorOccluderRight.position.x < 264:
				doorOccluderRight.position.x += 0.03
		if player.position.y > 200:
			get_tree().change_scene("res://Scenes/stage_1.tscn")

	wait -= 1

