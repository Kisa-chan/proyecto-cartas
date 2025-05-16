extends Node2D

class_name Carta

# Variables
var nombre: String
var dorso: String
var boca_arriba: bool = true # Si la carta está boca arriba o boca abajo

# Nodos
@onready var sprite_frente = $Frente
@onready var sprite_dorso = $Dorso
@onready var area_2d: Area2D = $Area2D

# Escala base para cuando no hay texturas
@export var escala_base = Vector2(0.3, 0.3)

# Llamada a Diccionario que mapea tipos de cartas a las rutas de las texturas
var card_database_reference

func inicializar(nombre_,dorso_) -> Carta:
	nombre = nombre_
	dorso = dorso_
	return self

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.connect("mouse_entered", _on_mouse_entered)
	area_2d.connect("mouse_exited", _on_mouse_exited)
	area_2d.connect("input_event", _on_input_event)
	# Llamada a Diccionario que mapea tipos de cartas a las rutas de las texturas
	card_database_reference = preload("res://Scripts/TiposCartas.gd")
	# Cargar la textura inicial según el tipo
	actualizar_apariencia()

# Actualiza la apariencia de la carta basada en el tipo y si está boca arriba
func actualizar_apariencia():
	# Configurar la textura del frente según el tipo
	if nombre in card_database_reference.texturas_frente:
		var textura = load(card_database_reference.texturas_frente[nombre])
		if textura:
			sprite_frente.texture = textura
			sprite_frente.scale = escala_base
	
	# Configurar la textura del dorso
	if dorso in card_database_reference.textura_dorso:
		var textura_dorso = load(card_database_reference.textura_dorso[dorso])
		if textura_dorso:
			sprite_dorso.texture = textura_dorso
			sprite_dorso.scale = escala_base
	
	# Mostrar el lado correspondiente
	sprite_frente.visible = boca_arriba
	sprite_dorso.visible = !boca_arriba

# Método para voltear la carta
func voltear():
	boca_arriba = !boca_arriba
	actualizar_apariencia()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered():
	print("Mouse sobre la carta")

func _on_mouse_exited():
	print("Mouse salió de la carta")

func _on_input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		print("¡Click en la carta!")
		voltear()
