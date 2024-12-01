extends Node

class_name InteractableValve

var scene = load("res://prefabs/Cutscenes/cutscene_jellr_nonono.tscn")

onready var valve = get_node("/root/Spatial/valve")
onready var waste = get_node("/root/Spatial/Waste")
onready var drip = get_node("/root/Spatial/Drip")
onready var toxic = get_node("/root/Spatial/Toxic")
onready var freezeMouse = get_node("/root/Spatial/FreezeMouse")
onready var togglable = get_node("/root/Spatial/Temple/entity_46_func_group")
#onready var env = get_node("/root/WorldEnvironment")
onready var jellr = get_node("/root/Spatial/Jellr")
onready var jellrInteract

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = 7
onready var playerJSpeed = 8

export var damageEnabled = false

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
	
	setup()
	
	jellr.visible = false
	valve.play = true
	get_node("AudioValve").playing = true
	get_node("AudioValve2").playing = true
	yield(get_tree().create_timer(4), "timeout")
	toxic.visible = true
	yield(get_tree().create_timer(0.05), "timeout")
	waste.translation = Vector3(0,4.125,0)
	waste.visible = true
	drip.visible = true
	toxic.get_node("AnimationPlayer").play("POW")
	get_node("AudioSploosh").playing = true
	togglable.queue_free()
	yield(get_tree().create_timer(1.05), "timeout")
	toxic.visible = false
	
	
	yield(get_tree().create_timer(0.5), "timeout")
	var scene_instance = scene.instance()
	scene_instance.set_name("scene")
	add_child(scene_instance)
	
	yield(get_tree().create_timer(7.044), "timeout")
	yield(get_tree().create_timer(1), "timeout")
	
	
	playerNode.target_yaw_pitch = Vector2(-2.355,0)
	yield(get_tree().create_timer(0.5), "timeout")
	get_node("/root/Spatial/AnimationPlayer").play("parkour")
	
	unSetup()

func setup():
	jellrInteract = get_node_or_null("/root/Spatial/NPC")
	if jellrInteract != null:
		jellrInteract.queue_free()
	
	freezeMouse.visible = true
	InteractRaycast.enabled = false
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"
	
	playerNode.target_yaw_pitch = Vector2(0.834, -0.0733)
	playerNode.translation = Vector3(-31,1,30.5)
	
	SettingVariables.can_pause = false

func unSetup():
	freezeMouse.visible = false
	InteractRaycast.enabled = true
	playerNode.max_speed = 7
	playerNode.jump_speed = 8
	playerNode.jump_action = "player_jump"
	
	damageEnabled = true
	self.collision_layer = 0
	
	SettingVariables.can_pause = true
