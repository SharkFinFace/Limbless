extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 2.75
var speedTwo = 2.25
var speedThree = 1.75
var speedFour = 1.25
var speedFive = 0.75

var fight_rect_position = Vector2((OS.window_size.x-get_width_from_height(OS.window_size.y/2))/2,OS.window_size.y*3/5)
var fight_rect_size = Vector2(get_width_from_height(OS.window_size.y/2),OS.window_size.y/4)
onready var parent_rect_position = Vector2(OS.window_size.x/2-get_parent().rect_size.x/2,OS.window_size.y*3/5)
onready var parent_rect_size = Vector2(OS.window_size.y/4/2/2/2,OS.window_size.y/4)

var tween: Tween
onready var attackNode = self.get_parent()
onready var start_position_right = Vector2(fight_rect_position)
onready var end_position_right = Vector2(fight_rect_size.x+fight_rect_position.x-parent_rect_size.x,fight_rect_position.y)
onready var start_position_left = Vector2(fight_rect_size.x+fight_rect_position.x-parent_rect_size.x,fight_rect_position.y)
onready var end_position_left = Vector2(fight_rect_position)

# var midpoint = OS.window_size.x/2-attackNode.rect_size.x/2,OS.window_size.y*3/5+50

export var goingLeft = false

onready var scorekeeper = get_node("/root/Control")

# Called when the node enters the scene tree for the first time.
func _ready():
#	print(attackNode)
	
	tween = Tween.new()
	
	add_child(tween)
	tween.connect("tween_completed", self, "_on_tween_completed")
	start_tween_right()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_tween_right():
	goingLeft = true
	attackNode.rect_position = start_position_right
	tween.interpolate_property(attackNode, "rect_position", start_position_right, end_position_right, speed, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()
	print("R")
#	yield(get_tree().create_timer(2), "timeout")
#	start_tween_left()

func start_tween_left():
	goingLeft = false
	attackNode.rect_position = start_position_left
	tween.interpolate_property(attackNode, "rect_position", start_position_left, end_position_left, speed, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	print("L")
	tween.start()
#	yield(get_tree().create_timer(2), "timeout")
#	start_tween_right()

func _process(_delta):
	fight_rect_position = Vector2((OS.window_size.x-get_width_from_height(OS.window_size.y/2))/2,OS.window_size.y*3/5)
	fight_rect_size = Vector2(get_width_from_height(OS.window_size.y/2),OS.window_size.y/4)
	
	if !get_parent().zoneHitable:
		tween.stop_all()
		pass
	
	if scorekeeper.healthEnemy == 4:
		speed = speedTwo
	elif scorekeeper.healthEnemy == 3:
		speed = speedThree
	elif scorekeeper.healthEnemy == 2:
		speed = speedFour
	elif scorekeeper.healthEnemy == 1:
		speed = speedFive

func get_height_from_width(width: float) -> float:
	return width * 1.0 / 2.5

func get_width_from_height(height: float) -> float:
	return height * 2.5 / 1.0

func _on_tween_completed(obj, key):
	if goingLeft:
		start_tween_left()
	else:
		start_tween_right()
