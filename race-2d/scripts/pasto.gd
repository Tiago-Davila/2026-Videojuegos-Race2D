extends Area2D

@export var friccion: float = 3.5


func _on_body_entered(body: Node2D) -> void:
	body.get_node("Movimiento").friccion_pasto = friccion


func _on_body_exited(body: Node2D) -> void:
	body.get_node("Movimiento").friccion_pasto = 0.0
