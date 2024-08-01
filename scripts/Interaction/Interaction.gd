extends RayCast

var current_collider

onready var interaction_label = get_node("/root/Spatial/GUI/InteractionLabel")

func _ready():
	set_interaction_text("")

func _process(delta):
	var collider = get_collider()
	
	if is_colliding():
		if collider is Interactable or collider is InteractableLimblessFoundMe or collider is InteractableDoor or collider is InteractableSeat or collider is InteractableShopkeeperGreet or collider is InteractableValve or collider is InteractableLegOne or collider is InteractableJellrGreet or collider is InteractableEscalatorOne or collider is InteractableBrick or collider is InteractableTuberGreet or collider is InteractablePuter or collider is InteractableTuberWin or collider is InteractableArmTwo or collider is InteractableLimblessFinal:
			if current_collider != collider:
				set_interaction_text(collider.get_interaction_text())
				current_collider = collider
			
			if Input.is_action_just_pressed("Interact"):
				collider.interact()
				set_interaction_text(collider.get_interaction_text())
		elif current_collider:
			current_collider = null
			set_interaction_text("")
	elif current_collider:
		current_collider = null
		set_interaction_text("")

func set_interaction_text(text):
	if !text:
		interaction_label.set_text("")
		interaction_label.set_visible(false)
	else:
		var interact_key = OS.get_scancode_string(InputMap.get_action_list("Interact")[0].scancode)
		# OG code:
		#interaction_label.set_text("Press %s to %s" % [interact_key, text])
		# "Better" code:
		interaction_label.set_text("Press E to Interact")
		# Cus why?
		interaction_label.set_visible(true)
