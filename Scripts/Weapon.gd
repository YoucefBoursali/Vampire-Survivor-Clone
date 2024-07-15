extends Node2D

var fireball: PackedScene = preload("res://Scenes/fireball.tscn")
@onready var marker: Marker2D = $Marker2D
@export var player: Player
var to_attack: bool = true
var max_bullets := 1
func _physics_process(delta: float) -> void:
	for i in max_bullets:
		if Input.is_action_pressed("shoot") and to_attack:
			$FiringCooldown.start()
			if sign(player.aim_position.x) != sign(marker.position.x):
				marker.position.x *= -1
			var direction := get_global_mouse_position() - marker.global_position
			var new_fireball := fireball.instantiate()
			new_fireball.global_position = marker.global_position
			new_fireball.rotation = direction.angle()
			get_tree().root.add_child(new_fireball)
			to_attack= false

			for upgrades in player.upgrade:
				upgrades.apply_upgrade(new_fireball)

func _on_timer_timeout() -> void:
	to_attack = true


