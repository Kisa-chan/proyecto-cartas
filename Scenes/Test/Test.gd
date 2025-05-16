extends Node2D

const RUTA_CARTA = "res://Scenes/Carta/Carta.tscn"
const RUTA_CARTA_PERSONAJE = "res://Scenes/Carta/Personaje/CartaPersonaje.tscn"
const RUTA_CARTA_ACCION = "res://Scenes/Carta/Accion/CartaAccion.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Crear una instancia de la carta sin necesidad de texturas aún
	var wanderer = preload(RUTA_CARTA_PERSONAJE).instantiate().inicializar("wanderer","anemo") # as Carta
	
	# Añadir a la escena
	add_child(wanderer)

	wanderer.position = Vector2(300, 300)
	
	var library = preload(RUTA_CARTA_ACCION).instantiate().inicializar("library","default") # as Carta
	
	# Añadir a la escena
	add_child(library)

	library.position = Vector2(600, 300)
