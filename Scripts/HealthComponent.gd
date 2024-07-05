extends Node2D

class_name HealthComponent
signal health_depleted
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@export var hitbox_component: HitboxComponent
@export var max_health := 5.0
var health := max_health

func _ready() -> void:
	if hitbox_component:
		hitbox_component.damaged.connect(on_damaged)
	
func on_damaged(attack: Attack) -> void:
	animation_player.play("hit")
	health -= attack.attack_damage
	if health <= 0:
		health_depleted.emit()
		health = 0
		animation_player.play("death")
		
