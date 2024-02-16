extends CharacterBody2D

class_name Entity

@export var max_health : int = 6
var current_health : int

# This is a super class for all Entity Scripts.
# It contains character specific behaviours, such as kill() or turn(var direction) etc.
# It is supposed to cover any graphical event.
# It is supposed to 


# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func knockback(direction, strength):
	velocity += direction.normalize() * strength

# Zero direction will break
func move(delta, direction : Vector2, acceleration, max_speed, friction):
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction.normalized() * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	set_velocity(velocity)
	move_and_slide()
	velocity = velocity


func launchProjectile(direction, speed, resName):
	direction = direction.normalized()
	var projectile : Entity = load(resName).instantiate()
	get_parent().add_child(projectile)
	projectile.position = position + direction * 20
	projectile.velocity = direction * speed
	projectile.rotate(acos(direction.x) if direction.y >= 0 else 2 * PI - acos(direction.x))



func damage(damage):
	current_health = max(current_health - damage, 0)
	if current_health == 0:
		kill()
		
func heal(heal):
	current_health = min(current_health + heal, max_health)

	
func kill():
	queue_free()

