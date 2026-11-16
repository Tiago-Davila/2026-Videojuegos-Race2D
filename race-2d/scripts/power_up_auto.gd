extends Node

@onready var area :Area2D;

func _ready() -> void:
	area = get_node("Area2D").get_child("Efecto").set

func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.get_node("Movimiento").friccion_pasto = body.get_node("Movimiento").friccion_pasto/3
