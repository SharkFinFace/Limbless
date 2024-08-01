extends Node

class_name InteractableSeat

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

onready var DoorCol = get_node("/root/Spatial/Door/StaticBody")

onready var bmasPrepare = get_parent().get_node("bmas_prepare")
onready var bmasApproach = get_parent().get_node("bmas_approach")
onready var bmasGetOut = get_node("/root/Spatial/bmas_getout")
onready var rumble = get_parent().get_node("rumble")
onready var screech = get_parent().get_node("screech")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	setup()
#	yield(get_tree().create_timer(2), "timeout")
	self.get_node("AnimationPlayer").play("sit")
	yield(get_tree().create_timer(2.1), "timeout")
	
	self.get_node("AnimationPlayer").play("rumble")
	
#	bmasPrepare.playing = true
	yield(get_tree().create_timer(1), "timeout")
	rumble.playing = true
	yield(get_tree().create_timer(10), "timeout")
	bmasApproach.playing = true
	yield(get_tree().create_timer(7), "timeout")
	screech.playing = true
	yield(get_tree().create_timer(7), "timeout")
	bmasGetOut.playing = true
	
	self.get_node("AnimationPlayer").play("unSit")
	yield(get_tree().create_timer(1), "timeout")
	playerNode.get_node("Camera").current = true
	yield(get_tree().create_timer(1.1), "timeout")
	get_node("/root/Spatial/Seats").queue_free()
	unSetup()
	DoorCol.collision_layer = 2

#func _process(_delta):
#	pass

func setup():
	playerSpeed = playerNode.max_speed
	InteractRaycast.enabled = false
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
	InteractRaycast.enabled = true
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
