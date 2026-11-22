extends Button

@export var escena: String 

func _pressed() -> void:
	Juego.escena = escena
	get_tree().change_scene_to_file("res://escenas/divisor_de_pantalla.tscn")
