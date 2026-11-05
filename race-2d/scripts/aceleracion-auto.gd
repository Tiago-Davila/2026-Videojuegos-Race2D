extends Node

@export var friccion: float = 300
@export var limites_velocidad: Array[float] = [600.0, 1100.0, 1600.0, 2100.0, 2500.0]
@export var lista_aceleraciones: Array[float] = [300.0, 250.0, 200.0, 150.0, 100.0]


func obtener_valor(marcha: int) -> float:
	return lista_aceleraciones[marcha]


func obtener_tope(marcha: int) -> float:
	return limites_velocidad[marcha]


func obtener_friccion() -> float:
	return friccion
