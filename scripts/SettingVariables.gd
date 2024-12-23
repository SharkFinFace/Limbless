extends Node

export var can_pause = false
export var is_paused = false
const settingsConfig = "user://limbless.sav"
var data = {}

var defaultSettings = {
	"sensitivity": 1.0,
}

func _ready():
	load_data()
	if data == null:
		print("Corrupted config. Defaulting all settings.")
		default_settings()
	if data["sensitivity"] == 0:
		print("Sensitivity found as 0. Defaulting. You can change it back to 0, but it will always default on startup.")
		data["sensitivity"] = defaultSettings["sensitivity"]
#	print(data["sensitivity"])

func save_data():
	var file = File.new()
	file.open(settingsConfig, file.WRITE)
	file.store_var(data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(settingsConfig):
		print("Config not found. Creating default settings.")
		data = defaultSettings
		save_data()
	file.open(settingsConfig, File.READ)
	data = file.get_var()
	file.close()
	print("Config loaded.")

func default_settings():
	var file = File.new()
	data = defaultSettings
	save_data()
	load_data()
