extends Entity

@export var ACCELERATION = 1000
@export var MAX_SPEED = 100
@export var FRICTION = 800

@onready var _body = $body
@onready var _head = $head
@onready var _attack = $attack

var bath = false

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()




	if Input.is_action_pressed("ui_right"):
		_body.play("right")
		_body.flip_h = false

	elif Input.is_action_pressed("ui_left"):
		_body.play("left")	
		_body.flip_h = true

	elif Input.is_action_pressed("ui_up"):
		_body.play("up")


	elif Input.is_action_pressed("ui_down"):
		_body.play("down")
	
	else:
		_body.stop()
		_body.frame = 0
		
	if Input.is_action_pressed("ui_text_caret_right"):
		_attack.play("right")
		_head.play("right")
		_head.flip_h = false

	elif Input.is_action_pressed("ui_text_caret_left"):
		_attack.play("left")
		_head.play("left")		
		_head.flip_h = true

	elif Input.is_action_pressed("ui_text_caret_up"):
		_attack.play("up")
		_head.play("up")


	elif Input.is_action_pressed("ui_text_caret_down"):
		_attack.play("down")
		_head.play("down")
	
	else:
		_head.play("down")		
		_head.stop()
		_attack.stop()
		_head.frame = 0
		_attack.frame = 0
	
	if Input.is_action_just_pressed("ui_accept"):
		launchProjectile(input_vector, 400, "res://scenes/Arrow.tscn")
	

		
#	look_at(get_global_mouse_position())

	move(delta, input_vector, ACCELERATION, MAX_SPEED, FRICTION)
	
	
	#for i in get_slide_count():
	#	var collision = get_slide_collision(i)
	#	collision.collider.damage(1)


