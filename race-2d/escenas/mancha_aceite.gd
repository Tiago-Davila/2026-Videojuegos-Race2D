extends Area2D

class_name ManchaAceite


func _ready() -> void:
	await get_tree().create_timer(
		randf_range(27.0, 32.0)
	).timeout
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	print("Entro")
