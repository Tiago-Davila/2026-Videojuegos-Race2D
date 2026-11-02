extends Node

@export var Aceleracion: Node

var marchas: Array[int] = [1, 2, 3, 4, 5, 6, 7, 8]
var marcha_actual: int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Input.is_action_just_pressed("subir_marcha"):
		marcha_actual+1
	elif Input.is_action_just_pressed("subir_marcha"):
		marcha_acual -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
