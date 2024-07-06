extends Node2D

class_name HealthComponent

signal health_changed(value: float, max_value: float)

@export var animation_player: AnimationPlayer
@export var hitbox_component: HitboxComponent
@export var max_health := 10.0
@export var skeleton: Skeleton
var health := max_health

func _ready() -> void:
	if hitbox_component:
		hitbox_component.damaged.connect(on_damaged)
	
func on_damaged(attack: Attack) -> void:
	animation_player.play("hit")
	skeleton.Is_hit = true
	await animation_player.animation_finished
	skeleton.Is_hit = false
	health -= attack.attack_damage
	health_changed.emit(health, max_health)
	if health <= 0:
		skeleton.Is_dead = true
		health = 0
		if animation_player:
			animation_player.play("death")
	print(health)
