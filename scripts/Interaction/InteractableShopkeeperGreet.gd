extends Node

class_name InteractableShopkeeperGreet

var scene = load("res://prefabs/Cutscenes/cutscene_shopkeeper_greet.tscn")
var sceneBrick = load("res://prefabs/Cutscenes/cutscene_shopkeeper_brick.tscn")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	if get_node_or_null("/root/Spatial/Brick/brick"):
		var scene_instance = scene.instance()
		scene_instance.set_name("scene")
		add_child(scene_instance)
	else:
		var scene_instance = sceneBrick.instance()
		scene_instance.set_name("scene")
		add_child(scene_instance)
