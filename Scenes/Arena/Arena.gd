extends Node2D


@onready var slots_jugador: Node2D = $AreaJugador/SlotsJugador
@onready var area_deck_jugador: Node2D = $AreaJugador/AreaDeckJugador
@onready var slots_enemigo: Node2D = $AreaEnemigo/SlotsEnemigo
@onready var area_deck_enemigo: Node2D = $AreaEnemigo/AreaDeckEnemigo

var centro_area_jugador: Vector2
var centro_area_enemigo: Vector2
var posicion_deck_jugador: Vector2
var posicion_deck_enemigo: Vector2


var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	centro_area_jugador = Vector2(screen_size.x/2,(screen_size.y/4)*3)
	centro_area_enemigo = Vector2(screen_size.x/2,(screen_size.y/4))
	posicion_deck_jugador = Vector2(0,(screen_size.y/4)*3)
	posicion_deck_enemigo = Vector2(0,(screen_size.y/4))
	slots_jugador.position = centro_area_jugador
	slots_enemigo.position = centro_area_enemigo
	area_deck_jugador.position = posicion_deck_jugador
	area_deck_enemigo.position = posicion_deck_enemigo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func agregar_cartas(tipo_:String, cantidad_: int,cartas_: Array[Carta]) -> void:
	var posicion
	if tipo_ == "jugador":
		posicion = centro_area_jugador
		posicionar(slots_jugador,cartas_)
	else: if tipo_ == "enemigo":
		posicion = centro_area_enemigo
		posicionar(slots_enemigo,cartas_)
	
		
func posicionar(centro_,cartas_: Array[Carta]) -> void:
	pass
	#for carta in cartas_:
		#centro_.posicion = posicion
