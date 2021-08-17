extends KinematicBody2D

const MAX_SPEED = 1000
const ACCELERATION = 50
const FRICTION = 10

var velocity = Vector2()
var destination = Vector2()

#----------------------------------------

func _unhandled_input(event):
	
	if event.is_action_pressed("click"):
		destination = get_global_mouse_position()
	
	pass

func _process(delta):
	
	movementloop(delta)
	
	pass

func movementloop(delta):
	
	velocity = position.direction_to(destination) * MAX_SPEED
	
	move_and_slide(velocity)
	
	pass






