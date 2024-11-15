extends CharacterBody2D

@export var speed = 200
@onready var ray = $RayCast2D

var gravity = 1
const GRAVITY = 800
const MOVE_SPEED = 200
const JUMP_FORCE = -400
var jumps = 0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = Input.get_vector("left", "right", "up", "down") * speed
	velocity.y += gravity * speed
	

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1

	velocity.y += GRAVITY * delta

	if ray.is_colliding():
		jumps = 2
	
	velocity.x = input_vector.x * MOVE_SPEED
	

	if is_on_floor and Input.is_action_just_pressed("jump"):
		if jump > 0:
                        velocity.y = JUMP_FORCE
                        jump -= 1
	move_and_slide()
	#if Input.is_action_pressed("left")
	



	
