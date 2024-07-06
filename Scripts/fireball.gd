extends CharacterBody2D
class_name FireBall

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed := 300.0
@export var damage: = 3.0
var direction: Vector2

func _physics_process(delta: float) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	animation_player.play("fireball")
	velocity = direction * speed
	var collision := move_and_collide(velocity*delta)
	if collision:
		queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var attack := Attack.new()
		attack.attack_damage = damage
		area.damage(attack)
		queue_free()
