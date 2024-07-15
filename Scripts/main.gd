extends Node2D
class_name Main
signal pausing(paused: bool)
@export var array_of_mobs : Array[Resource] =[]
@onready var path_follow: PathFollow2D = $Player/Path2D/PathFollow2D
@onready var canvas_layer: CanvasLayer = $CanvasLayer
var is_paused: bool = false:
	get:
		return is_paused
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		pausing.emit(is_paused)
func _ready() -> void:
	SignalBus.Score_added.connect(canvas_layer.on_score_changed)
	AudioMusicManager.play("res://Assets/Audio/Music/battleThemeA.mp3")
func spawn() -> void:
	var mobs:PackedScene = array_of_mobs.pick_random()
	var new_mobs := mobs.instantiate()
	path_follow.progress_ratio = randf()
	new_mobs.global_position = path_follow.global_position
	add_child(new_mobs)
	

func _on_spawn_timer_timeout() -> void:
	spawn()

func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("pause"):
		is_paused = !is_paused
