extends Node

var acelerador: float = 0.0
var velocidad: float = 0.0
var volante: float = 0.0

@export var cuerpo: CharacterBody2D
@export var aceleracion: Node
@export var nitro: Node

@export var velocidad_max: float = 2500
@export var fuerza_volante: float = 6.0
@export var min_fuerza_volante: float = 0.3

@export var friccion: float = 300

@export var respuesta_acelerador: float = 2.0
@export var soltar_acelerador: float = 4.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	volante = Input.get_axis("izquierda", "derecha")
	acelerador= Input.is_action_pressed("acelerar")
	

func _physics_process(delta: float) -> void:
	volante = Input.get_axis("izquierda", "derecha")
	acelerador = Input.get_action_strength("acelerar")
	nitro.actualizar(delta, velocidad)
	aplicar_aceleracion(delta)
	rotar_volante(delta)
	cuerpo.velocity = cuerpo.transform.x * velocidad
	cuerpo.move_and_slide()


func aplicar_aceleracion(delta: float) -> void:
	var limite: float = velocidad_max + nitro.obtener_velocidad_extra()
	if acelerador > 0.0:
		var aceleracion_final: float = aceleracion.obtener_valor(velocidad) + nitro.obtener_aceleracion()
		velocidad += aceleracion_final * acelerador * delta
	else:
		velocidad -= aceleracion.obtener_friccion() * delta
	velocidad = clampf(velocidad, 0.0, limite)



	
#sirve para ajustar la velocidad con respecto a la velocidad y
#ajustar la fuerza de giro del volante cuando aumente la velocidad
func get_obtener_fuerza() -> float:
	return clampf(1.0 - pow(velocidad / velocidad_max, 2.0), min_fuerza_volante, 1.0) * fuerza_volante


func rotar_volante(delta: float) -> void:
	if velocidad > 0.0:
		cuerpo.rotate(get_obtener_fuerza() * delta * volante)
