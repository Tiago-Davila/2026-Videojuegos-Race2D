extends PathFollow2D

class_name SueltaPowerUp

const POWER_UP = preload("res://escenas/power_up.tscn")

@export var sueltaPowerUp: Node
@export var velocidad: float = 200
@export var margen_caida: float = 100.5
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
	if !sueltaPowerUp: return
	var powerUp: PowerUp = POWER_UP.instantiate()
	sueltaPowerUp.add_child(powerUp)
	powerUp.global_position = Vector2(
		global_position.x + randf_range(-margen_caida, margen_caida),
		global_position.y + randf_range(-margen_caida, margen_caida)
	)
	arrancar_temporizador()

func _on_timer_timeout() -> void:
	soltar_aceite()
