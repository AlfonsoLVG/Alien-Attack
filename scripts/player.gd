extends CharacterBody2D

var speed = 200

func _physics_process(delta):
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	
	# limit player movement with ifs
	#if global_position.x < 0:
		#global_position.x = 0
	#if global_position.y < 0:
		#global_position.y = 0
	#if global_position.x > screen_size.x:
		#global_position.x = screen_size.x
	#if global_position.y > screen_size.y:
		#global_position.y = screen_size.y
	
	# limit player movements with clampf
	#global_position.x = clampf(global_position.x, 0, screen_size.x)
	#global_position.y = clampf(global_position.y, 0, screen_size.y)
	
	# limit player movement with Vector2 clamp
	global_position = global_position.clamp(Vector2(0,0), screen_size)
