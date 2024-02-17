extends Entity


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

@export var ACCELERATION = 100000
@export var MAX_SPEED = 300
@export var FRICTION = 0
@export var DAMAGE = 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move(delta, velocity, ACCELERATION, MAX_SPEED, FRICTION)


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Entity:
		body.damage(1)
		damage(1)
	else:
		kill()
