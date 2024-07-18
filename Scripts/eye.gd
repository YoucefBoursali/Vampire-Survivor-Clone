extends CharacterBody2D
class_name Eye
var Is_dead: bool = false
var Is_hit: bool = false
var knockback: Vector2 = Vector2.ZERO
var gems: PackedScene= preload("res://Scenes/gem.tscn")

signal hurt()

func drop_gem() -> void:
	var new_gems := gems.instantiate()
	new_gems.global_position = global_position
	get_tree().root.call_deferred("add_child", new_gems)


func _on_hitbox_component_hurting() -> void:
	hurt.emit()
