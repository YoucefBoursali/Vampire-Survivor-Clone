extends CharacterBody2D

@export var tornado_damage := 2.0
@export var speed := 150.0

func _physics_process(delta: float) -> void:
	var direction := Vector2.UP.rotated(deg_to_rad(randf_range(0,360)))
	velocity = direction * speed
	move_and_slide()

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var attack := Attack.new()
		attack.tornado_attack = tornado_damage
		area.damage(attack)

func _on_timer_timeout() -> void:
	queue_free()
