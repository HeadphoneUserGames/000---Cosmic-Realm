extends KinematicBody2D

#var max_speed = 400
var speed = 0
var acceleration = 1200

# Added
var deceleration = 1200
var zero_speed = 0

var move_direction # only for art animation
var moving = false
var destination = Vector2()
var movement = Vector2()

#----------------------------------------------

const MAX_SPEED = 20000
const ACCELERATION = 500
const NO_SPEED = 0
const FRICTION = 3000

var velocity = Vector2()



func _unhandled_input(event):
	
	if event.is_action_pressed("click"):
		moving = true
		destination = get_global_mouse_position()
#	elif event.is_action_released("click"):
#		moving = false
#		print("clicked is released")
	
	pass


func _physics_process(delta):
	
#	MovementLoop(delta)
	MovementLoop2(delta)
	
	pass


func MovementLoop(_delta):
	
#	if moving == false:
#		speed = 0
#	else:
#		speed += acceleration * delta
#		movement = movement.move_toward(movement * speed, acceleration * delta)
#	if speed > max_speed:
#		speed = max_speed
#	movement = position.direction_to(destination) * speed
#	if position.distance_to(destination) > 5:
#		movement = move_and_slide(movement)
#	else:
#		moving = false
	
	pass


func MovementLoop2(delta):
	
	
#	velocity = position.direction_to(destination) * MAX_SPEED
#	velocity += position.direction_to(destination) * ACCELERATION * delta
	
#	if position.distance_to(destination) > 5:
#		move_and_slide(velocity * delta)
	
	if position.distance_to(destination) > 20:
		velocity += position.direction_to(destination) * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
#		velocity = position.direction_to(destination) * NO_SPEED
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_slide(velocity)
	
	pass





