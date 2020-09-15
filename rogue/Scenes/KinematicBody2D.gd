extends KinematicBody2D

var speed = 50
var velocity = Vector2()

func start(pos, dir):
	position = pos
	velocity = Vector2(speed, 0).rotated(dir)
	get_node("bulletTexture").rotation = dir

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		get_parent().get_node(collision.collider.name).hurt(1)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
