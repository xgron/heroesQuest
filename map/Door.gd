extends Node

@export var scene : String
@export var destinationNode : String # Node2D prefarably
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func swap_level():
	var world = get_tree().current_scene
	var player = world.get_node("Player")
	var level = load(scene).instantiate()
	world.add_child(level)
	if destinationNode != null or destinationNode != '':
		world.get_node("Player").position = level.get_node(destinationNode).position



func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		call_deferred("swap_level")
		get_tree().current_scene.get_child(1).queue_free()
		
