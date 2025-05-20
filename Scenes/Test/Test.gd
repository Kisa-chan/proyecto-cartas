extends Node2D

const RUTA_CARTA = "res://Scenes/Carta/Carta.tscn"
const RUTA_CARTA_PERSONAJE = "res://Scenes/Carta/Personaje/CartaPersonaje.tscn"
const RUTA_CARTA_ACCION = "res://Scenes/Carta/Accion/CartaAccion.tscn"
const RUTA_ARENA = "res://Scenes/Arena/Arena.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Creamos la arena de juego
	var arena = preload(RUTA_ARENA).instantiate()
	add_child(arena)
	# Crear una instancia de la carta sin necesidad de texturas aún
	var wanderer = preload(RUTA_CARTA_PERSONAJE).instantiate().inicializar("wanderer","anemo") # as Carta
	
	#Agregamos el wanderer a la arena
	arena.slots_jugador.add_child(wanderer)
	var mano_jugador: Array[Carta] = [wanderer]
	arena.agregar_cartas("jugador",1,mano_jugador)
	# Añadir a la escena
	#add_child(wanderer)

	#wanderer.position = Vector2(300, 300)
	
	var library = preload(RUTA_CARTA_ACCION).instantiate().inicializar("library","default") # as Carta
	
	
	arena.slots_enemigo.add_child(library)
	#arena.agregar_cartas("enemigo",1,Array[library])
	# Añadir a la escena
	# add_child(library)

	#library.position = Vector2(600, 300)
