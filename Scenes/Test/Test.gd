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
	var lisa = preload(RUTA_CARTA_PERSONAJE).instantiate().inicializar("lisa","electro")
	var yaoyao = preload(RUTA_CARTA_PERSONAJE).instantiate().inicializar("yaoyao","geo")
	
	#Creamos la mano del jugador
	var mano_jugador: Array[Carta] = [wanderer,lisa,yaoyao]
	arena.agregar_cartas("jugador",3,mano_jugador)

	var library = preload(RUTA_CARTA_ACCION).instantiate().inicializar("library","default") # as Carta

	var mano_enemigo: Array[Carta] = [library]
	arena.agregar_cartas("enemigo",1,mano_enemigo)

	#arena.slots_enemigo.add_child(library)
	#arena.agregar_cartas("enemigo",1,Array[library])
	# Añadir a la escena
	# add_child(library)
	#library.position = Vector2(600, 300)
