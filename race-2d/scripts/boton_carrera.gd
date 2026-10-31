extends Button

@export var escena: String 

func _pressed() -> void:
	get_tree().change_scene_to_file(escena)
