extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var hit = "null"
export var zoneHitable = true

onready var scorekeeper = get_node("/root/Control")

var hasBeenThreeSecondsToPreventInitialFailure = false

onready var VPlayerExp = get_node("/root/Control/explosion")
onready var VPlayerExpWorse = get_node("/root/Control/explosionWorse")


# Called when the node enters the scene tree for the first time.
func _ready():
	rect_position = Vector2(OS.window_size.x/2-rect_size.x/2,OS.window_size.y*3/5)
	yield(get_tree().create_timer(3), "timeout")
	hasBeenThreeSecondsToPreventInitialFailure = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Your norm GS
	rect_size = Vector2(OS.window_size.y/4/2/2/2,OS.window_size.y/4)
#	print(rect_size)
	
	# Zone detection
#	var hit_zone = get_parent().get_node("HitZone")
#	if hit_zone and is_overlapping(hit_zone):
#		print("Overlapping with HitZone!")
#	else:
#		print("Not overlapping with HitZone.")
#	pass

func get_height_from_width(width: float) -> float:
	return width * 1.0 / 2.5

func get_width_from_height(height: float) -> float:
	return height * 2.5 / 1.0

func is_overlapping(other_rect):
	var this_rect = Rect2(rect_global_position, rect_size)
	var other_rect_global = Rect2(other_rect.rect_global_position, other_rect.rect_size)
	return this_rect.intersects(other_rect_global)

func handle_input():
	if Input.is_action_pressed("ui_accept") and hasBeenThreeSecondsToPreventInitialFailure:
		var hit_zone = get_parent().get_node("HitZone")
		if zoneHitable and hit_zone and is_overlapping(hit_zone):
			print("Overlapping with HitZone!")
			hit = "true"
			zoneHitable = false
		elif zoneHitable:
			print("Not overlapping with HitZone.")
			hit = "false"
			zoneHitable = false
		pass

func _physics_process(_delta):
	handle_input()
	pass

func resume():
	if scorekeeper.healthEnemy > 0 and scorekeeper.healthPlayer > 0:
		zoneHitable = true
		get_node("Node")._ready()
	elif scorekeeper.healthPlayer < 1:
		print("lose")
#		yield(get_tree().create_timer(1.5), "timeout")
		VPlayerExpWorse.paused = false
		yield(get_tree().create_timer(0.25), "timeout")
		VPlayerExpWorse.visible = true
		yield(get_tree().create_timer(0.4), "timeout")
		get_tree().quit()
		pass
	elif scorekeeper.healthEnemy < 1:
		print("win")
#		yield(get_tree().create_timer(1.5), "timeout")
		VPlayerExp.paused = false
		yield(get_tree().create_timer(0.25), "timeout")
		VPlayerExp.visible = true
		yield(get_tree().create_timer(0.75), "timeout")
		get_tree().change_scene("res://scenes/village_postfight.tscn")
		pass
	pass
