extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_login_pressed() -> void:
	var firstname = $MarginContainer/VBoxContainer/firstname.text
	var lastname = $MarginContainer/VBoxContainer/lastname.text
	var password = $MarginContainer/VBoxContainer/Password.text
	var grid = $MarginContainer/VBoxContainer/Grid.text
	$MarginContainer/VBoxContainer/Login.send_login(firstname, lastname, grid, password)
	
