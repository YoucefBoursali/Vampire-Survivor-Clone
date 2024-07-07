extends Node2D
var mobs: PackedScene = preload("res://Scenes/skeleton.tscn")
@onready var path_follow: PathFollow2D = $Player/Path2D/PathFollow2D

func spawn() -> void:
	var new_mobs := mobs.instantiate()
	path_follow.progress_ratio = randf()
	new_mobs.global_position = path_follow.global_position
	$Enemies.add_child(new_mobs)


func _on_spawn_timer_timeout() -> void:
	spawn()
