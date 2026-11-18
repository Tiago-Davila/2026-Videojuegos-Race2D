extends CanvasLayer

@export var menu: PackedScene


func _unhandled_input(event: InputEvent) -> void:# que no sea la misma escena que en el menu 
	if event.is_action_pressed("ui_cancel") and get_tree().current_scene.scene_file_path != menu.resource_path:
		visible = not visible


func _on_visibility_changed() -> void:
	get_tree().paused = visible


func _on_reiniciar_pressed() -> void:
	hide()
	get_tree().reload_current_scene()


func _on_salir_pressed() -> void:
	hide()
	get_tree().change_scene_to_packed(menu)
