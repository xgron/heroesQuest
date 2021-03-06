extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target

var hearts = []


func reloadHearts():
	for heart in hearts:
		heart.queue_free()
	
	hearts = []
	
	target = get_parent()

	for x in range(target.current_health):
		var heart : Sprite = load("res://UI/Heart.tscn").instance()
		add_child(heart)
		heart.position.x += x * 15
		hearts += [heart]


# Called when the node enters the scene tree for the first time.
func _ready():
	reloadHearts()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reloadHearts()
	
