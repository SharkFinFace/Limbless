extends Node

class_name InteractableTuberGreet

var scene = preload("res://prefabs/Cutscenes/cutscene_tuber_greet.tscn")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	SettingVariables.can_pause = false
	var scene_instance = scene.instance()
	scene_instance.set_name("scene")
	add_child(scene_instance)
