extends Node2D


func _ready():
	pass	

func _on_Button_pressed():
	$kid.entrou = true
	$kid.cadeira = $PositionCadeira



func _on_Button2_pressed():
	get_tree().change_scene("res://nivel-2.tscn")
