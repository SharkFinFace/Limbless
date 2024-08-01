extends Node

class_name InteractableDoor

export (String) var sceneName

var scene = load("res://prefabs/Cutscenes/cutscene_door.tscn")

var fadingOut = false

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	var scene_instance = scene.instance()
	scene_instance.set_name("scene")
	add_child(scene_instance)
	
#	print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
	fadingOut = true
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://scenes/" + sceneName + ".tscn")

func _process(_delta):
	if fadingOut:
		if AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) > -80:
			yield(get_tree().create_timer(0.05), "timeout")
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) - 0.15)
			print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	pass
