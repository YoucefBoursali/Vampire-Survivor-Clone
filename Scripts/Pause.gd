extends Control
@export var main: Main
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("RESET")
	main.pausing.connect(on_paused)
func resume() -> void:
	animation_player.play_backwards("blur")
	hide()

func pause() -> void:
	animation_player.play("blur")
	show()
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	resume()
	main.is_paused = false
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	resume()

func on_paused(paused: bool) -> void:
	if paused:
		pause()
	else:
		resume()
