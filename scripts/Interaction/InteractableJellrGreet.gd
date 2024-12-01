extends Node

class_name InteractableJellrGreet

var scene = load("res://prefabs/Cutscenes/cutscene_jellr_greet.tscn")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	SettingVariables.can_pause = false
	var scene_instance = scene.instance()
	scene_instance.set_name("scene")
	add_child(scene_instance)
