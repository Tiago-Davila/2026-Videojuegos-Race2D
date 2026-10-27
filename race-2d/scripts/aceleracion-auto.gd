extends Node

var valor_actual: float = 0.0

@export var friccion: float = 300
@export var limites_velocidad: Array[float] = [0.0, 600.0, 1200.0, 1800.0]
@export var lista_aceleraciones: Array[float] = [250.0, 200.0, 150.0, 100.0]


func obtener_valor(velocidad: float) -> float:
	for i in limites_velocidad.size():
		if velocidad >= limites_velocidad[i]:
			valor_actual = lista_aceleraciones[i]
	return valor_actual


func obtener_friccion() -> float:
	return friccion
