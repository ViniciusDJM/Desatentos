extends Node2D
var garoto = preload("res://kid.tscn")
var kid = garoto.instance()

func _ready():
	kid.entrou = false
	add_child(kid)	
	kid.iniciarPosicao(466, 494)

func _on_Button_pressed():
	kid.entrou = true
	kid.cadeira = $PositionCadeira
	kid.ler = true

func _physics_process(delta):
	if kid.entrou:
		kid.andarMesa(delta)
	if(kid.reseta):
		kid.resetarPosicao(466, 494, delta)
		get_node("corpo").visible = false
		kid.reseta = false
	kid._set_animationNivel3()
		
	

func _on_nivel3buttom_pressed():
	get_tree().change_scene("res://nivel-4.tscn")
