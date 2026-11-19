extends Area2D

class_name PowerUp


func _ready() -> void:
	await get_tree().create_timer(
		randf_range(27.0, 32.0)
	).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.get_node("Efecto").show()
	queue_free()
	await get_tree().create_timer(
		10
	).timeout
	body.get_node("Efecto").hide()
