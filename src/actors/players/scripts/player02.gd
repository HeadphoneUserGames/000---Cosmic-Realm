extends KinematicBody2D

const MAX_SPEED = 20000
const ACCELERATION = 5000
const FRICTION = 2000

var max_speed = 20000
var acceleration = 5000
var friction = 2000

var velocity = Vector2()
var destination = Vector2()

var moving = false
var not_moving = true

#--------------------------------------------------------

func _ready():
	
	print(max_speed)
	print(acceleration)
	print(friction)
	
	pass

func _unhandled_input(event):
	
	if event.is_action_pressed("click"):
		destination = get_global_mouse_position()
	
	# Testing how to add things lol not that important
	if event.is_action_pressed("ui_up"):
		max_speed = max_speed * 2
		acceleration = acceleration * 2
		friction = friction * 2
		
		print("add stats")
		print(max_speed)
		print(acceleration)
		print(friction)
		
		pass
	
	pass

func _process(delta):
	
	movementloop(delta)
	
	pass

func movementloop(delta):
	
	if position.distance_to(destination) > 30:
		velocity += position.direction_to(destination) * acceleration * delta
		velocity = velocity.clamped(max_speed * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide(velocity)
	
	pass






