extends CanvasLayer

@export var movimiento: Node
@export var marchas: Node
@export var marcha: Sprite2D
@export var velocidad: Label
@export var llegada: Label
@export var tiempo: Label
@export var aviso: Label
@export var temporizador: Timer


func mostrar_aviso() -> void:
	aviso.show()
	temporizador.start()


func mostrar_llegada(lugar: int, segundos: float) -> void:
	llegada.text = "¡Saliste %s! ¡Felicidades!" % ["primero", "segundo", "tercero", "cuarto"][lugar - 1]
	tiempo.text = "Tiempo: %02d:%05.2f" % [floori(segundos / 60.0), fmod(segundos, 60.0)]
	llegada.show()


func _process(_delta: float) -> void:
	marcha.frame = marchas.obtener_marcha() + 1
	#primero lo tengo que pasar a int para no mostrar decimales y despues a string para verlo en el hud
	velocidad.text = str(int(movimiento.obtener_velocidad() / 10))
