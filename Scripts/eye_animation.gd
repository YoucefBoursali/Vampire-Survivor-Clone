extends Node

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite: Sprite2D = %Sprite2D
@onready var eye: Eye = get_owner()

func _physics_process(delta: float) -> void:
	if eye.Is_dead:
		return
	if eye.Is_hit:
		animation_player.play("hit")
		return
		
	sprite.flip_h = eye.velocity.x < 0
	if eye.velocity > Vector2.ZERO:
		animation_player.play("walk")
