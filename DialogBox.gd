extends NinePatchRect

onready var text := $Text 
var mostrar = false
var primeiraFala = false
var segundaFala = false
var terceiraFala = false
var passarFala = true

var msg_queue: Array = ["Olá seja bem vindo ao desatentos!" , 
"Esse é um jogo com o próposito de aprendermos sobre o TDAH" ,
"O jogo funciona da seguinte maneira, você irá apertar em uma das ações escritas nos botões",
"Vai analisar a ação que o personagem irá fazer e assim tentar entender",
"Qual seria o melhor diagnóstico", 
"Vamos fazer isso algumas vezes ok?", 
"Aperte no botão onde está escrito 'ler um livro'",
"Observe bem, essa é uma ação de uma criança sem TDAH", 
"Neste jogo vamos mostrar as diferenças entre uma criança sem TDAH" , "para uma criança com o TDAH do tipo Desatento e do tipo Hiperativo",
"Vamos resetar o boneco e tentar novamente, aperte no botão 'ler um livro'",
"Essa é uma ação do tipo Desatenta, o sintoma mais comum desse tipo de TDAH é a perca de foco em fazer atividades que demandam concetração",
"Por fim temos o tipo Hiperativo, ele é caracterizado por bastante agitação por parte da criança", 
"Além da agitação é comum a criança apresentar impaciencia e irritação.",
]


func _ready():
	show_message()

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept") and passarFala: 
		show_message()
	
	
func show_message() -> void:
	if msg_queue.size() == 0:
		hide()
		get_parent().visible = false
		get_parent().get_parent().get_child(6).visible = true
		return
		 
	if primeiraFala == false:
		if msg_queue.size() == 5:
			hide()
			get_parent().visible = false
			primeiraFala = true;
			segundaFala = true;
			passarFala = false
			return 
	if segundaFala == true && passarFala:
		show()
		get_parent().visible = true
		if msg_queue.size() == 4:
			get_parent().get_parent().get_child(1).reseta = true	
		if msg_queue.size() == 2:
			hide()
			get_parent().visible = false
			segundaFala = false;
			terceiraFala = true;
			return 
	if terceiraFala == true && passarFala:
		show()
		get_parent().visible = true
		if msg_queue.size() == 1:
			get_parent().get_parent().get_child(1).reseta = true
	
			
	var _msg: String = msg_queue.pop_front()
	text.bbcode_text = _msg
	print(msg_queue)
