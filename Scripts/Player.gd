extends CharacterBody2D
class_name Player
var ghost: PackedScene = preload("res://Scenes/ghost.tscn")
var upgrade: Array[BaseUpgrades] = []
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ghosting_time: Timer = $"Ghosting time"

@export var speed := 200.0
@export var acceleration_time := 0.1
var direction: Vector2
var aim_position: Vector2 = Vector2(1,0)
var Is_dead: bool = false
var Is_hit: bool = false
func _ready() -> void:
	pass
func _physics_process(delta:float) -> void:
	if Is_dead: return
	if Input.is_action_just_pressed("dash"):
		dash()
	direction = Input.get_vector("left","right","up","down").normalized()
	velocity = velocity.move_toward(direction * speed, (1/acceleration_time) * delta * speed)
	if velocity.length() > 0 and !Is_hit:
		animation_player.play("walk")
	elif velocity.length() == 0 and !Is_hit:
		animation_player.play("idle")
	if velocity < Vector2.ZERO:
		animated_sprite.flip_h = true
	elif velocity > Vector2.ZERO:
		animated_sprite.flip_h = false
	move_and_slide()
func ghosts() -> void:
	var new_ghost := ghost.instantiate()
	new_ghost.properties(global_position, animated_sprite.scale)
	get_tree().root.add_child(new_ghost)
func dash() -> void:
	ghosting_time.start()
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + velocity * 2, 0.75)
	await tween.finished
	ghosting_time.stop()
func _on_ghosting_time_timeout() -> void:
	ghosts()
