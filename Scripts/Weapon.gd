extends Node2D

var fireball: PackedScene = preload("res://Scenes/fireball.tscn")
@onready var marker: Marker2D = $Marker2D
@export var player: Player
var to_attack: bool = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and to_attack:
		$Timer.start()
		if sign(player.aim_position.x) != sign(marker.position.x):
			marker.position.x *= -1
		var direction := get_global_mouse_position() - marker.global_position
		var new_fireball := fireball.instantiate()
		new_fireball.global_position = marker.global_position
		new_fireball.rotation = direction.angle()
		get_tree().root.add_child(new_fireball)
		to_attack= false
	


func _on_timer_timeout() -> void:
	to_attack = true
