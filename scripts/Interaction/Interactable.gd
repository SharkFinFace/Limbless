extends Node

class_name Interactable

var scene = load("res://prefabs/Cutscenes/cutscene_tmpman.tscn")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	var scene_instance = scene.instance()
	scene_instance.set_name("scene")
	add_child(scene_instance)
