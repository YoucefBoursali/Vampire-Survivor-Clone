extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	AudioSfxManager.play("res://Assets/Audio/GUI/click.wav")
