extends Control

@export var click_stream: AudioStream
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("RESET")

func resume() -> void:
	get_tree().set_deferred("paused", false)
	animation_player.play_backwards("blur")

func pause() -> void:
	get_tree().paused = true
	animation_player.play("blur")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:

	resume()
func _on_restart_pressed() -> void:
	
	get_tree().reload_current_scene()
	resume()

func _unhandled_input(event: InputEvent)-> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()
