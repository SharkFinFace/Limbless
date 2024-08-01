extends Node

#class_name Interactable

onready var playerNode = get_node("/root/Spatial/Player")
onready var toxic = get_node("/root/Spatial/Toxic")
onready var valveInteract = get_node("/root/Spatial/valveInteract/StaticBody")

func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)

func _process(delta):
	if valveInteract.damageEnabled:
		if playerNode.translation.y < 0.5:
			
			toxic.visible = true
			toxic.get_node("AnimationPlayer").play("POW")
			if !get_node("AudioStreamPlayer").playing:
				get_node("AudioStreamPlayer").playing = true
			
			yield(get_tree().create_timer(0.05), "timeout")
			
			playerNode.target_yaw_pitch = Vector2(-2.355, 0)
			playerNode.yaw_pitch = Vector2(-2.355, 0)
			playerNode.translation = Vector3(-31,1,30.5)
			
			yield(get_tree().create_timer(1.05), "timeout")
			toxic.visible = false
			interact()
	
	if !get_node_or_null("/root/Spatial/LegInteract"):
		if playerNode.translation.y < 15:
			
			toxic.visible = true
			toxic.get_node("AnimationPlayer").play("POW")
			if !get_node("AudioStreamPlayer").playing:
				get_node("AudioStreamPlayer").playing = true
			
			yield(get_tree().create_timer(0.05), "timeout")
			
			playerNode.target_yaw_pitch = Vector2(0, 0)
			playerNode.yaw_pitch = Vector2(0, 0)
			playerNode.translation = Vector3(0,16,41)
			
			yield(get_tree().create_timer(1.05), "timeout")
			toxic.visible = false
			interact()
	pass
