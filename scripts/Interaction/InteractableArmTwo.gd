extends Node

class_name InteractableArmTwo

onready var brick = get_node("/root/Spatial/Brick/brick")
#onready var legInteract = get_node("/root/Spatial/LegInteract")

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
#onready var exitTrain = get_node("/root/Spatial/ExitTrain")

onready var shopkeeperCol = get_node("/root/Spatial/NPC/StaticBody")

onready var train = get_node("/root/Spatial/ExitTrain")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	
#	InteractRaycast.enabled = false
#	leg.queue_free()
	get_parent().get_node("AudioStreamPlayer").play()
#	exitTrain.visible = true
#	exitTrain.rotation_degrees.x = 0
	self.collision_layer = 0
#	shopkeeperCol.collision_layer = 2
	get_parent().get_parent().get_node("brick").queue_free()
	
	
	train.get_node("Door/StaticBody").collision_layer = 2
	
	yield(get_tree().create_timer(0.05), "timeout")
#	yield(get_tree().create_timer(0.5), "timeout")
#	InteractRaycast.enabled = true
#	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
