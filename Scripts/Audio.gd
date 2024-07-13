extends TabBar


func _ready() -> void:
	%Music.value = Persistence.config.get_value("Audio", '1')
	AudioServer.set_bus_volume_db(1,linear_to_db(%Music.value))
 
	%SFX.value = Persistence.config.get_value("Audio", '2')
	AudioServer.set_bus_volume_db(2,linear_to_db(%SFX.value))

func _on_sfx_value_changed(value: float) -> void:
	set_volume(2, value)


func _on_music_value_changed(value: float) -> void:
	set_volume(1, value)


func set_volume(idx: int, value: float) -> void:
	AudioServer.set_bus_volume_db(idx, linear_to_db(value))
	Persistence.config.set_value("Audio", str(idx), value)
	Persistence.save_data()
