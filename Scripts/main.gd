extends Node2D
@export var array_of_mobs : Array[Resource] =[]
@onready var path_follow: PathFollow2D = $Player/Path2D/PathFollow2D


func spawn() -> void:
	var mobs:PackedScene = array_of_mobs.pick_random()
	var new_mobs := mobs.instantiate()
	path_follow.progress_ratio = randf()
	new_mobs.global_position = path_follow.global_position
	$Enemies.add_child(new_mobs)
	

func _on_spawn_timer_timeout() -> void:
	spawn()

