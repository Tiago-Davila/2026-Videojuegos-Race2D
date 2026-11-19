extends Node

@export var aceleracion: Node
@export var tiempo_minimo: float = 1.0

var marcha_actual: int = 0
var tiempo_acelerando: float = 0.0


func actualizar(delta: float, acelerador: float, subir: bool, bajar: bool) -> void:
	if acelerador > 0.0:
		tiempo_acelerando += delta
	else:
		tiempo_acelerando = 0.0
	if subir and tiempo_acelerando >= tiempo_minimo and marcha_actual < aceleracion.limites_velocidad.size() - 1:
		marcha_actual += 1
		tiempo_acelerando = 0.0
	elif bajar and marcha_actual > 0:
		marcha_actual -= 1


func obtener_marcha() -> int:
	return marcha_actual
