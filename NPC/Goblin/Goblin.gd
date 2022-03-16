extends Entity

export var ACCELERATION = 1000
export var MAX_SPEED = 40
export var FRICTION = 800


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector = $"../Player".position - position
	input_vector = input_vector.normalized()

	move(delta, input_vector, ACCELERATION, MAX_SPEED, FRICTION)


