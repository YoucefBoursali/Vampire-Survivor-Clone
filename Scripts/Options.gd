extends Control


@onready var sfx_bus := AudioServer.get_bus_index("SFX")
@onready var music_bus := AudioServer.get_bus_index("Music")

func _on_back_pressed() -> void:
	Click.play()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus,linear_to_db(value))
	AudioServer.set_bus_mute(music_bus, value < 0.05)


func _on_sfx_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))
	AudioServer.set_bus_mute(sfx_bus, value < 0.05)
