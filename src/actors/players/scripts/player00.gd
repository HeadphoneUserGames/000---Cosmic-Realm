extends KinematicBody2D

var max_speed = 400
var speed = 0
var acceleration = 1200

# Added
var deceleration = 1200
var zero_speed = 0

var move_direction # only for art animation
var moving = false
var destination = Vector2()
var movement = Vector2()

func _unhandled_input(event):
	# Function that will take any unhandled input. 

	# You can remove the if event.is_action_pressed("Click") for it is not needed
	if event.is_action_pressed("click"):
		moving = true
		destination = get_global_mouse_position()


func _physics_process(delta):
	MovementLoop(delta)

# around 4:11 of the video
func MovementLoop(delta):
#	if moving == false:
#		#speed = 0
#
#		# Added
#		speed -= deceleration * delta
##		if speed < zero_speed:
##			speed = zero_speed
#	else:
#		speed += acceleration * delta
#		if speed > max_speed:
#			speed = max_speed
	
	if moving == true:
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
	movement = position.direction_to(destination) * speed
	if position.distance_to(destination) > 200:
		movement = move_and_slide(movement)
	else:
#		moving = false
#		speed -= deceleration * delta
		position = position.move_toward(speed, delta * zero_speed)
