extends KinematicBody2D

const ACCELERATION = 800
const MAX_SPEED = 100
const FRICTION = 800

var velocity = Vector2.ZERO
onready var _animated_sprite = $AnimatedSprite


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
		_animated_sprite.play("right")

	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("left")

	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("up")

	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("down")

	else:
		_animated_sprite.stop()
		_animated_sprite.frame = 0


	velocity = move_and_slide(velocity)
