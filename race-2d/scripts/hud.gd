extends CanvasLayer

@export var movimiento: Node
@export var marchas: Node
@export var marcha: Sprite2D
@export var velocidad: Label


func _process(_delta: float) -> void:
	marcha.frame = marchas.obtener_marcha() + 1
	#primero lo tengo que pasar a int para no mostrar decimales y despues a string para verlo en el hud
	velocidad.text = str(int(movimiento.obtener_velocidad() / 10))
