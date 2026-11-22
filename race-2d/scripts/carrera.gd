extends Node2D

@export var controles: int = 4

var tiempo: float = 0.0
var llegadas: int = 0


func _ready() -> void:
	## para sacar los autos que sobran
	for auto in get_tree().get_nodes_in_group("autos").slice(Juego.jugadores):
		auto.queue_free()

	## con 1 jugador no se usa el divisor de pantalla, asi que le ponemos
	## una camara al auto para que lo siga 
	if Juego.jugadores == 1:
		var camara := Camera2D.new()
		camara.zoom = Vector2(0.4, 0.4)
		$auto.add_child(camara)
		camara.make_current()


func _process(delta: float) -> void:
	tiempo += delta


func llegar(auto: Node) -> void:
	llegadas += 1
	auto.get_node("HUD").mostrar_llegada(llegadas, tiempo)


func _on_control_body_entered(body: Node2D, numero: int) -> void:
	body.get_node("Movimiento").pasar_control(numero)


func _on_lineafinstart_body_entered(body: Node2D) -> void:
	body.get_node("Movimiento").vuelta_completada(controles)
