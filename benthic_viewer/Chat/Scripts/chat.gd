extends Control
@onready var metaverse_session = get_tree().root.get_node("MetaverseSession") 
@onready var chat_bubble_scene= load("res://Chat/ChatBubble.tscn")
@onready var chat = $VBoxContainer/MarginContainer/HBoxContainer/ChatBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	metaverse_session.connect("chat_from_simulator", _on_chat_from_simulator)

func _on_chat_from_simulator(user, message, chat_from_self) -> void:
	var chat_ui = $VBoxContainer/ScrollContainer/ChatContainer
	var chat_bubble = chat_bubble_scene.instantiate()
	chat_bubble.set_message(user, message, chat_from_self)
	
	chat_ui.add_child(chat_bubble)
	# wait a frame so the label is present
	await get_tree().process_frame 
	$VBoxContainer/ScrollContainer.scroll_vertical = $VBoxContainer/ScrollContainer.get_v_scroll_bar().max_value

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ENTER:
			send_message()


func send_message():
	if chat.text.strip_edges() != "" :
		metaverse_session.send_chat(chat.text)
	await get_tree().process_frame
	chat.text = ""
