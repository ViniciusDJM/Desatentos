extends KinematicBody2D

export (int) var speed = 200
var entrou = false
var sentou = false
var reseta = false
var contador = 0
var velocity = Vector2()
var cadeira = Vector2()
func _ready():
	entrou = false
	contador = 0

func _physics_process(delta):
	if entrou == true:
		andarMesa(delta)
	if(reseta):
		resetarPosicao(delta)
		get_parent().get_child(9).visible = false
		reseta = false
	_set_animation()
		
func andarMesa(delta):
	if self.position.y > 453: 
		self.position.y -= 1;
		
	if self.position.x < 650:
		self.position.x += 1;
	
	if self.position.x == 650 && self.position.y == 453:
		sentou = true
		entrou = false
		get_parent().get_child(9).visible = true
		get_parent().get_child(8).get_child(0).passarFala = true	

func resetarPosicao(delta):
	self.position.x = 466;
	self.position.y = 494;
	entrou = false	
	sentou = false
	contador = contador +1
	
	
func _set_animation():
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
		print("animando correndo")
	if sentou:
		if(contador == 0):
			$animacao.flip_h = false
			$animacao.play("sentado")
		if(contador == 1): 
			$animacao.flip_h = false
			$animacao.play("lendo-desatento") 
		if(contador == 2):
			$animacao.flip_h = false
			$animacao.play("lendo-agitado")

