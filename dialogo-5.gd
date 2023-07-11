extends NinePatchRect

onready var text := $Text 
var mostrar = false
var passarFala = true

var msg_queue: Array = ["Você chegou ao nivel 5!",]


func _ready():
	show_message()

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept") and passarFala: 
		show_message()
	
	
func show_message() -> void:
	if msg_queue.size() == 0:
		hide()
		get_parent().visible = false
		get_parent().get_parent().get_child(5).visible = true
		return	
			
	var _msg: String = msg_queue.pop_front()
	text.bbcode_text = _msg
