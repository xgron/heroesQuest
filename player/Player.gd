extends KinematicBody2D

const ACCELERATION = 800
const MAX_SPEED = 100
const FRICTION = 800

var velocity = Vector2.ZERO
onready var _body = $body
onready var _head = $head


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()


	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)


	if Input.is_action_pressed("ui_right"):
		_body.play("side")
		_head.play("side")
		_head.stop()
		_body.flip_h = false
		_head.flip_h = false

	elif Input.is_action_pressed("ui_left"):
		_body.play("side")
		_head.play("side")		
		_head.stop()		
		_body.flip_h = true
		_head.flip_h = true

	elif Input.is_action_pressed("ui_up"):
		_body.play("forward")
		_head.play("up")
		_head.stop()

	elif Input.is_action_pressed("ui_down"):
		_body.play("forward")
		_head.play("down")
		_head.stop()
	
	else:
		_body.stop()
		_body.frame = 0
	
	if Input.is_action_pressed("ui_accept"):
		_head.play("down")
		
#	look_at(get_global_mouse_position())

	velocity = move_and_slide(velocity)


