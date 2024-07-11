extends Control



func _on_play_pressed() -> void:
	Click.play()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
	Click.play()

func _on_quit_pressed() -> void:
	Click.play()
	get_tree().quit()
