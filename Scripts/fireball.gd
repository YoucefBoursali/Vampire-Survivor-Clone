extends CharacterBody2D
class_name FireBall

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
var direction: Vector2
@export var speed := 300.0
@export var damage: = randi_range(1,10)
@export var max_pierce := 1
var pierces := 0
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
		pierces += 1
		if pierces >= max_pierce:
			queue_free()


func _on_timer_timeout() -> void:
	queue_free()



