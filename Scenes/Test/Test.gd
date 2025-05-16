extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Crear una instancia de la carta sin necesidad de texturas aún
	var carta = preload("res://Scenes/Carta/Carta.tscn").instantiate()
	
	#var carta = Carta
	# Configurar el tamaño desde el principio
	#carta.ancho = 120.0
	#carta.alto = 180.0

	# Añadir a la escena
	add_child(carta)

	# Más tarde puedes cambiar el tipo, lo que cargará las texturas
	# pero mantendrá el tamaño establecido
	carta.cambiar_tipo("yaoyao")
	carta.position = Vector2(100, 300)
