extends Button

@export var cantidad: int = 1


func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		Juego.jugadores = cantidad
