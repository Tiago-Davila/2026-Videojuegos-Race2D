extends Node2D

@export var controles: int = 4


func _on_control_body_entered(body: Node2D, numero: int) -> void:
	body.get_node("Movimiento").pasar_control(numero)


func _on_lineafinstart_body_entered(body: Node2D) -> void:
	body.get_node("Movimiento").vuelta_completada(controles)
