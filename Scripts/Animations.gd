extends Node

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite: Sprite2D = %Sprite2D
@onready var skeleton: Skeleton = get_owner()

func _physics_process(delta: float) -> void:
	if skeleton.Is_dead:
		return
	if skeleton.Is_hit:
		animation_player.play("hit")
		return
		
	sprite.flip_h = skeleton.velocity.x < 0
	if skeleton.velocity > Vector2.ZERO:
		animation_player.play("walk")
