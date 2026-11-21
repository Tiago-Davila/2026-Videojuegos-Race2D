extends Node

class_name PowerUpAuto

@export var animacion :AnimatedSprite2D;
@export var areaEfecto :Area2D;
@export var friccion_area = 6.7
@export var duracion: float = 10.0


func _ready() -> void:
	areaEfecto.hide()
	_actualizar_estado_area()

func _process(delta: float) -> void:
	pass

func activar() -> void:
	areaEfecto.show()
	await get_tree().create_timer(duracion).timeout
	areaEfecto.hide()

func _actualizar_estado_area() -> void:
	var esta_visible: bool = areaEfecto.is_visible_in_tree()
	areaEfecto.set_deferred("monitoring", esta_visible)
	if esta_visible:
		animacion.play("default")
	else:
		animacion.stop()

func _activar() -> void:
	areaEfecto.show()
	await get_tree().create_timer(duracion).timeout
	areaEfecto.hide()

func _on_efecto_body_entered(body: Node2D) -> void:
	if body == get_parent():
		return
	body.get_node("Movimiento").friccion_pasto = friccion_area

func _on_efecto_body_exited(body: Node2D) -> void:
	if body == get_parent():
		return
	body.get_node("Movimiento").friccion_pasto = 0.0

func _on_efecto_visibility_changed() -> void:
	_actualizar_estado_area()
