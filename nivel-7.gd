extends Node2D
var garoto = preload("res://kid.tscn")
var kid = garoto.instance()

func _ready():
	kid.entrou = false
	add_child(kid)	
	kid.iniciarPosicao(466, 494)

func _on_ButtonLer_pressed():
	kid.montar = false
	kid.entrou = true
	kid.cadeira = $PositionCadeira
	kid.ler = true

func _on_ButtonMontar_pressed():
	kid.ler = false
	kid.entrou = true
	kid.cadeira = $PositionCadeira
	kid.montar = true
	


func _physics_process(delta):
	if kid.entrou:
		kid.andarMesa(delta)
	if(kid.reseta):
		kid.resetarPosicao(466, 494, delta)
		get_node("corpo").visible = false
		kid.reseta = false
	kid._set_animationNivel7()
		
	

func _on_nivelbuttom_pressed():
	get_tree().change_scene("res://nivel-8.tscn")

