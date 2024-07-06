extends CharacterBody2D
class_name Player
var upgrade: Array[BaseUpgrades] = []
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var speed := 200.0
var direction: Vector2
var aim_position: Vector2 = Vector2(1,0)
func _ready() -> void:
	pass

func _physics_process(delta:float) -> void:
	direction = Input.get_vector("left","right","up","down").normalized()
	velocity = direction * speed

	if velocity != Vector2.ZERO:
		animation_player.play("walk")
	elif velocity == Vector2.ZERO:
		animation_player.play("idle")

	if velocity < Vector2.ZERO:
		animated_sprite.flip_h = true
	elif velocity > Vector2.ZERO:
		animated_sprite.flip_h = false
	move_and_slide()


