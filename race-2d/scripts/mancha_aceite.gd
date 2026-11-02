extends Area2D

class_name ManchaAceite

@export var friccion_mancha = 2.5

func _ready() -> void:
	await get_tree().create_timer(
		randf_range(27.0, 32.0)
	).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.get_node("Movimiento").friccion_pasto = friccion_mancha

func _on_body_exited(body: Node2D) -> void:
	body.get_node("Movimiento").friccion_pasto = 0.0
