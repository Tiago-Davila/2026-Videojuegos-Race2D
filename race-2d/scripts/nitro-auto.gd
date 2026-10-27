extends Node

var aceleracion_extra: bool = false
var tiempo_activo: float = 0.0
var tiempo_recarga: float = 10.0

@export var cantidad_extra: float = 300
@export var velocidad_extra: float = 600
@export var velocidad_min: float = 300
@export var duracion: float = 2.0
@export var recarga: float = 5.0


func actualizar(delta: float, velocidad: float) -> void:
	tiempo_activo = maxf(tiempo_activo - delta, 0.0)
	tiempo_recarga = maxf(tiempo_recarga - delta, 0.0)
	if Input.is_action_just_pressed("nitro") and tiempo_recarga == 0.0 and velocidad > velocidad_min:
		tiempo_activo = duracion
		tiempo_recarga = duracion + recarga
	aceleracion_extra = tiempo_activo > 0.0


func obtener_aceleracion() -> float:
	if aceleracion_extra:
		return cantidad_extra
	return 0.0


func obtener_velocidad_extra() -> float:
	if aceleracion_extra:
		return velocidad_extra
	return 0.0
