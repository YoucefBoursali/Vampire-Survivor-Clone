extends Control


func _ready() -> void:
	%Play.grab_focus()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	click()
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
	click()
func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_play_mouse_entered() -> void:
	hover()


func _on_options_mouse_entered() -> void:
	hover()

func _on_quit_mouse_entered() -> void:
	hover()

func click() -> void:
	AudioSfxManager.play("res://Assets/Audio/GUI/click.wav")

func hover() -> void:
	AudioSfxManager.play("res://Assets/Audio/GUI/hover.wav")


