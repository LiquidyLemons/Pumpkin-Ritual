extends CharacterBody2D 

@export var speedX = 300
@export var gravity = 30
@export var jump_force = 600

func _physics_process(_delta):
	if (!is_on_floor() && velocity.y < 500):
		velocity.y += gravity
	
	if (Input.is_action_just_pressed("jump") && is_on_floor()):
		velocity.y = -jump_force
	
	var dirX = Input.get_axis("move_left", "move_right")
	velocity.x = speedX * dirX
	move_and_slide()
	
	skew = 0.2 * -dirX # silly (delete)

	# send pumpky back (TEMP)
	if (position.y > 800):
		position.y = 100
		position.x = 300
