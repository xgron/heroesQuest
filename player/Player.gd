extends Entity

export var ACCELERATION = 1000
export var MAX_SPEED = 100
export var FRICTION = 800

var sickIsaac = preload("res://player/sickIsaac.png")
var isaac = preload("res://player/character_001_isaac.png")

onready var spriteBody = $SpriteBody
onready var spriteHead = $SpriteHead
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var sick = false

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if !sick:
			spriteBody.set_texture(sickIsaac)
			spriteHead.set_texture(sickIsaac)
			sick = true
		else:
			spriteBody.set_texture(isaac)
			spriteHead.set_texture(isaac)
			sick = false
		#launchProjectile(input_vector, 400, "res://Entity/Arrow.tscn")

	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	
	velocity = move_and_slide(velocity)
	#for i in get_slide_count():
	#	var collision = get_slide_collision(i)
	#	collision.collider.damage(1)


