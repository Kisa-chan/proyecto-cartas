extends Node2D

class_name Carta

# Variables exportadas para configurar desde el editor
@export var personaje: String = "lisa" # Tipo de carta (normal, fuego, agua, etc.)
@export var boca_arriba: bool = true # Si la carta está boca arriba o boca abajo

# Nodos
@onready var sprite_frente = $Frente
@onready var sprite_dorso = $Dorso

# Escala base para cuando no hay texturas
var escala_base = Vector2(0.2, 0.2)

# Llamada a Diccionario que mapea tipos de cartas a las rutas de las texturas
var card_database_reference

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Llamada a Diccionario que mapea tipos de cartas a las rutas de las texturas
	card_database_reference = preload("res://Scripts/TiposCartas.gd")
	# Cargar la textura inicial según el tipo
	actualizar_apariencia()

# Actualiza la apariencia de la carta basada en el tipo y si está boca arriba
func actualizar_apariencia():
	# Configurar la textura del frente según el tipo
	if personaje in card_database_reference.texturas_frente:
		var textura = load(card_database_reference.texturas_frente[personaje])
		if textura:
			sprite_frente.texture = textura
			sprite_frente.scale = escala_base
	
	#Obtengo el tipo dependiendo del personaje  
	var tipo = card_database_reference.personajes[personaje]
	# Configurar la textura del dorso
	if tipo in card_database_reference.textura_dorso:
		var textura_dorso = load(card_database_reference.textura_dorso[tipo])
		if textura_dorso:
			sprite_dorso.texture = textura_dorso
			sprite_dorso.scale = escala_base
	
	# Mostrar el lado correspondiente
	sprite_frente.visible = boca_arriba
	sprite_dorso.visible = !boca_arriba

# Método para establecer el tipo de carta
func establecer_tipo(nuevo_personaje: String):
	personaje = nuevo_personaje

# Método para cambiar el tipo de carta
func cambiar_tipo(nuevo_personaje: String):
	personaje = nuevo_personaje
	actualizar_apariencia()

# Método para voltear la carta
func voltear():
	boca_arriba = !boca_arriba
	actualizar_apariencia()
	
# Método para forzar a mostrar un lado específico
func mostrar_frente(mostrar: bool = true):
	boca_arriba = mostrar
	actualizar_apariencia()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
