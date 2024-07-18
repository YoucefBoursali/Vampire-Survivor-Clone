extends Node2D

class_name HealthComponent

signal health_changed(value: float, max_value: float)
@export var eye: Eye
@export var skeleton: Skeleton
@export var animation_player: AnimationPlayer
@export var hitbox_component: HitboxComponent

@export var max_health := 10.0
@onready var health := max_health

func _ready() -> void:
	if hitbox_component:
		hitbox_component.damaged.connect(on_damaged)
	
func on_damaged(attack: Attack) -> void:
	health -= attack.attack_damage
	print(attack.attack_damage)
	health_changed.emit(health, max_health)
	if health <= 0:
		if skeleton:
			skeleton.Is_dead = true
			skeleton.drop_gem()
		if eye:
			eye.Is_dead = true
			eye.drop_gem()
		health = 0
		if animation_player:
			animation_player.play("death")
	print(health)
