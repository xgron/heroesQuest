extends Entity

export var ACCELERATION = 1000
export var MAX_SPEED = 100
export var FRICTION = 800

onready var _body = $body
onready var _head = $head

var bath = false

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()




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
			remove_child($head)

		
		
#	look_at(get_global_mouse_position())

	move(delta, input_vector, ACCELERATION, MAX_SPEED, FRICTION)


