extends PathFollow2D

class_name SueltaAceite

const MANCHA_ACEITE = preload("res://escenas/ManchaAceite.tscn")

@export var sueltaAceite: Node
@export var velocidad: float = 120
@export var margen_caida: float = 20.0
@export var tiempo_caida: Vector2 = Vector2(6, 8)

@onready var temporizador: Timer = $Temporizador
@onready var sprite_2d: Sprite2D = $Sprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrancar_temporizador()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * velocidad

func arrancar_temporizador() -> void:
	temporizador.wait_time = randf_range(
		tiempo_caida.x, tiempo_caida.y
	)
	temporizador.start()

func soltar_aceite() -> void:
	if !sueltaAceite: return
	var manchaAceite: ManchaAceite = MANCHA_ACEITE.instantiate()
	sueltaAceite.add_child(manchaAceite)
	manchaAceite.global_position = Vector2(
		global_position.x + randf_range(-margen_caida, margen_caida),
		global_position.y + randf_range(-margen_caida, margen_caida)
	)
	arrancar_temporizador()

func _on_timer_timeout() -> void:
	soltar_aceite()
