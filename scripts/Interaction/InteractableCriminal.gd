extends Node

#class_name Interactable

var scene = load("res://prefabs/Cutscenes/cutscene_criminal_theyjumpinme.tscn")
onready var playerNode = get_node("/root/Spatial/Player")

var isInteracted = false
var locked = false

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	if isInteracted and !locked:
		locked = true
		var scene_instance = scene.instance()
		scene_instance.set_name("scene")
		add_child(scene_instance)

func _process(delta):
	var limblessCol = get_node_or_null("/root/Spatial/NPC")
	if playerNode.translation.x <= 14 and limblessCol == null:
		playerNode.translation = Vector3(14,0,1)
		playerNode.target_yaw_pitch = Vector2(1.57,0)
		isInteracted = true
		interact()
	pass
