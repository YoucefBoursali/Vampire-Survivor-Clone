extends Node

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@export var player: Player
@export var max_health := 30.0
var health := max_health


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		player.Is_hit = true
		animation_player.play("hit")
		await animation_player.animation_finished
		player.Is_hit = false
		health = clamp(health, 0, max_health)
		print(health)
		var hurtbox: Hurtbox = area
		health -= hurtbox.damage
		if health <= 0:
			player.Is_dead = true
			animation_player.play("death")
			await animation_player.animation_finished
			call_deferred("end")

func end() -> void:
	get_tree().reload_current_scene()

