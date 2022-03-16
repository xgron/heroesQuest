extends Entity

const ACCELERATION = 800
const MAX_SPEED = 40
const FRICTION = 800


onready var player = get_parent().get_node("Player")

onready var _body = $body
onready var _head = $head


func _physics_process(delta):
	velocity = Vector2.ZERO
	var dist = player.global_position - self.global_position

	if self.global_position.distance_to(player.global_position) < 80:
		velocity = (player.global_position - global_position).normalized()
		_head.play("down")
	else:
		velocity = Vector2.ZERO
		_head.play("close_eyes")
		
	if velocity.x > 0.5:
		_body.play("side")
		_body.flip_h = false

	elif velocity.x < -0.5:
		_body.play("side")
		_body.flip_h = true

	elif velocity.y < -0.5:
		_body.play("up")

	elif velocity.y > 0.5:
		_body.play("down")
		
	else:
		_body.stop()
		_body.frame = 0
		
	if dist.normalized().x > 0.5:
		_head.play("side")
		_head.flip_h = false

	elif dist.normalized().x < -0.5:
		_head.play("side")		
		_head.flip_h = true

	elif dist.normalized().y < -0.5:
		_head.play("up")

	elif dist.normalized().y > 0.5:
		_head.play("down")
		
	move_and_slide(velocity * MAX_SPEED)

