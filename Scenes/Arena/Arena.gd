extends Node2D

@onready var area_jugador: Node2D = $AreaJugador
@onready var area_enemigo: Node2D = $AreaEnemigo

var screen_size: Vector2
var limite_areas_y
var margen_slots


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	limite_areas_y = screen_size.y/2
	margen_slots = screen_size.x/4
	inicializar_arena()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func inicializar_arena() -> void:
	area_jugador.position = Vector2(screen_size.x/2,(screen_size.y/4)*3)
	area_enemigo.position = Vector2(screen_size.x/2,(screen_size.y/4))
	var offset_x = (screen_size.x / 2) * 0.75
	var offset_y = (screen_size.y / 2) * 0.33
	
	var slots_jugador: Node2D = area_jugador.get_node("SlotsJugador")
	#slots_jugador.position = Vector2(0, -offset_y)
	
	var slots_enemigo: Node2D = area_enemigo.get_node("SlotsEnemigo")
	#slots_enemigo.position = Vector2(0, offset_y)
	
	var deck_jugador: Node2D = area_jugador.get_node("DeckJugador")
	var accion_jugador: Node2D = area_jugador.get_node("CartasAccionJugador")
	deck_jugador.position = Vector2(-offset_x, offset_y)
	accion_jugador.position = Vector2(offset_x, offset_y)
	
	var deck_enemigo: Node2D = area_enemigo.get_node("DeckEnemigo")
	var accion_enemigo: Node2D = area_enemigo.get_node("CartasAccionEnemigo")
	deck_enemigo.position = Vector2(offset_x, -offset_y)
	accion_enemigo.position = Vector2(-offset_x, -offset_y)
	

func posicionar_decks(deck_jugador,deck_enemigo) -> void:
	deck_jugador.position = area_jugador.get_node("DeckJugador").position
	deck_enemigo.position = area_enemigo.get_node("DeckEnemigo").position

func agregar_cartas(tipo_:String, cantidad_: int,cartas_: Array[Carta]) -> void:
	var pos = 1
	var slots: Node2D
	if tipo_ == "jugador":
		slots = area_jugador.get_node("SlotsJugador")
	else: if tipo_ == "enemigo":
		slots = area_enemigo.get_node("SlotsEnemigo")
	
	# Ancho útil: pantalla menos márgenes a los lados
	var ancho_util = screen_size.x - (2 * margen_slots)
	print(ancho_util)
	# Si solo hay uno, se centra. Si hay más, calculamos separación uniforme
	var separacion = 0.0
	var centro_carta = 0.0
	if cantidad_ > 1:
		separacion = ancho_util / (cantidad_)
		centro_carta = separacion / 2
	
	for carta in cartas_:
		slots.add_child(carta)
		var offset_x = (-separacion + centro_carta) * pos
		carta.position = Vector2(offset_x,0)
		pos+= 1
		centro_carta+= separacion
		print(carta.position)
	
