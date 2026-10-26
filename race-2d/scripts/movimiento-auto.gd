extends Area2D

var acelerador: float= 0.0
var velocidad: float=0.0
var volante: float=0.0

@export var velocidad_max: float = 380
@export var friccion: float = 300
@export var fuerza_volante: float = 6.0
@export var min_fuerza_volante: float = 6.0

@export var aceleracion: float = 150


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	volante = Input.get_axis("izquierda", "derecha")
	acelerador= Input.is_action_pressed("acelerar")

func _physics_process(delta: float) -> void:
	aplicar_aceleracion(delta)
	rotar_volante(delta)
	position += transform.x * velocidad * acelerador * delta
	
	
func aplicar_aceleracion(delta: float) -> void:
	if acelerador > 0.0:
		velocidad += aceleracion + delta
	else: 
		velocidad -= friccion * delta
	velocidad = clampf(velocidad, 0.0, velocidad_max)
	
#sirve para ajustar la velocidad con respecto a la velocidad y
#ajustar la fuerza de giro del volante cuando aumente la velocidad 
func get_obtener_fuerza() -> float:
	return clampf(1.0- pow(velocidad/velocidad_max, 2.0), min_fuerza_volante, 1.0) * fuerza_volante 
	

func rotar_volante(delta: float) -> void:
	rotate(fuerza_volante * delta * volante)
	
