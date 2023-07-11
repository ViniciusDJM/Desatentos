extends KinematicBody2D

export (int) var speed = 200
var entrou = false
var sentou = false
var reseta = false
var ler = false
var montar = false
var nivelUm = false
var nivelDois = false
var nivelTres = false
var nivelQuatro = false
var nivelCinco = false
var nivelSeis = false
var nivelSete = false
var nivelOito = false
var nivelNove = false
var nivelDez = false
var contador = 0
var velocity = Vector2()
var cadeira = Vector2()
func _ready():
	contador = 0
	self.z_index = -1

func iniciarPosicao(x, y):
	self.position = Vector2(x,y)
	
	
func andarMesa(delta):
	if self.position.y > 444: 
		self.position.y -= 1;
		
	if self.position.x < 650:
		self.position.x += 1;
	
	if self.position.x == 650 && self.position.y == 444:
		sentou = true
		self.z_index = +1
		entrou = false
		get_parent().get_node("corpo").visible = true
		if nivelUm:
			get_parent().get_child(7).passarFala = true	

		
func resetarPosicao(x, y, delta):
	self.position.x = x;
	self.position.y = y;
	self.z_index = -1
	entrou = false	
	sentou = false
	contador = contador +1
	
	
func _set_animation():
	nivelUm = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
		if(contador == 0):
			$animacao.flip_h = false
			$animacao.play("sentado")
		if(contador == 1): 
			$animacao.flip_h = false
			self.scale = Vector2(1.1, 1.1)
			$animacao.play("lendo-desatento") 
			self.position.y = 440
			self.position.x = 657
		if(contador == 2):
			$animacao.flip_h = false
			self.scale = Vector2(1.75, 1.85)
			self.position.y = 468
			self.position.x = 616 
			$animacao.play("lendo-agitado")

func _set_animationNivel2():
	nivelUm = false
	nivelDois = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
		if(contador == 0):
			$animacao.flip_h = false
			$animacao.play("sentado")
			
func _set_animationNivel3():
	nivelDois = false
	nivelTres = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
		if(contador == 0):
			$animacao.flip_h = false
			$animacao.play("lendo-desatento")

func _set_animationNivel4():
	nivelTres = false
	nivelQuatro = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
		if(contador == 0):
			$animacao.flip_h = false
			self.scale = Vector2(1.85, 1.85)
			self.position.x = 616 
			$animacao.play("lendo-agitado")
			
func _set_animationNivel5():
	nivelQuatro = false
	nivelCinco = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
			$animacao.flip_h = false
			$animacao.play("sentado")
			self.scale = Vector2(1, 1)
	if sentou && montar:
			$animacao.flip_h = false
			$animacao.play("quebra-norma")
			self.scale = Vector2(1.85, 1.85)
			
func _set_animationNivel6():
	nivelCinco = false
	nivelSeis = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
			$animacao.flip_h = false
			$animacao.play("lendo-desatento")
			self.scale = Vector2(1, 1)
	if sentou && montar:
			$animacao.flip_h = false
			$animacao.play("quebra-desatento")
			self.scale = Vector2(1.80, 1.80)
			
func _set_animationNivel7():
	nivelSeis = false
	nivelSete = true
	if !entrou && !sentou:
		$animacao.play("parado")
	if entrou: 
		$animacao.play("andando")
		$animacao.flip_h = true
	if sentou && ler:
			$animacao.flip_h = false
			$animacao.play("lendo-agitado")
			self.scale = Vector2(1, 1)
	if sentou && montar:
			$animacao.flip_h = false
			$animacao.play("quebra-hiperativo")
			self.scale = Vector2(1.70, 1.70)
			
