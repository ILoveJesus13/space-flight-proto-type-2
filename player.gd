extends CharacterBody2D

const maxspeed = 100
const accel = 150
const friction = 75
var input = Vector2(0, 0)

func movement(delta):
	input.x = int(Input.is_action_just_pressed("ui_right"))
	input.x = input.x - int(Input.is_action_just_pressed("ui_left"))
	
	input.y = int(Input.is_action_just_pressed("ui_left"))
	input.y = input.x - int(Input.is_action_just_pressed("ui_right"))
	
	input = input.normalized()
	if (input.length() == 0):
		if (velocity.length() > friction * delta):
			velocity = velocity - (velocity.normalized())
		else:
			velocity = Vector2.ZERO 
	else:
		velocity = velocity + (input + accel * delta)
		velocity = velocity.limit_length(maxspeed)
	pass


func _physics_process(delta):
	movement(delta)
	move_and_slide()
