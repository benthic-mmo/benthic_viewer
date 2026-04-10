extends Control
@onready var metaverse_session = get_tree().root.get_node("MetaverseSession") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	metaverse_session.connect("login_response", _on_login_response)

func _on_login_response(success, message):
	var loading = get_tree().root.find_child("Loading", true, false)
	loading.hide()
	if success == "Success":
		metaverse_session.switch_to_scene("res://metaverse_world.tscn")
	else:
		var error = get_tree().root.find_child("Error", true, false)
		error.text = message
		error.show()
