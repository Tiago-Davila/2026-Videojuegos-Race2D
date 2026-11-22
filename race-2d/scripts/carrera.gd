extends Node2D

@export var controles: int = 8

var tiempo: float = 0.0
var llegadas: int = 0


func _ready() -> void:
	## para sacar los autos que sobran
	for auto in get_tree().get_nodes_in_group("autos").slice(Juego.jugadores):
		auto.queue_free()


func _process(delta: float) -> void:
	tiempo += delta


func llegar(auto: Node) -> void:
	llegadas += 1
	auto.get_node("HUD").mostrar_llegada(llegadas, tiempo)


func _on_control_body_entered(body: Node2D, numero: int) -> void:
	body.get_node("Movimiento").pasar_control(numero)


func _on_lineafinstart_body_entered(body: Node2D) -> void:
	body.get_node("Movimiento").vuelta_completada(controles)
