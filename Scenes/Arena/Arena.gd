extends Node2D
@onready var area_jugador: Node2D = $AreaJugador
@onready var area_enemigo: Node2D = $AreaEnemigo

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	area_jugador.position = Vector2(screen_size.x/2,(screen_size.y/4)*3)
	area_enemigo.position = Vector2(screen_size.x/2,(screen_size.y/4))
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
