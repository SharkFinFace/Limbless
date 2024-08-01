extends Node

class_name InteractableTuberWin

var scene = preload("res://prefabs/Cutscenes/cutscene_tuber_win.tscn")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	var scene_instance = scene.instance()
	scene_instance.set_name("scene")
	add_child(scene_instance)