extends CharacterBody2D
class_name Skeleton
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@export var speed := 100.0
var direction: Vector2
var Is_dead: bool = false
var Is_hit: bool = false
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if Is_dead: return
	if Is_hit: return
	direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	if velocity != Vector2.ZERO:
		animation_player.play("walk")
	if velocity > Vector2.ZERO:
		sprite.flip_h = false
	elif velocity < Vector2.ZERO:
		sprite.flip_h = true
	move_and_slide()
