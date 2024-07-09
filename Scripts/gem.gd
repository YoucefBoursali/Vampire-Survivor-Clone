extends Area2D

@onready var collect: AudioStreamPlayer2D = $Collect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var gem_resource: Gems
@onready var sprite: Sprite2D = $Sprite2D
var score: int:
	set(val):
		score = val
		SignalBus.Score_added.emit(score)
		print (val)

func _ready() -> void:
	sprite.texture = gem_resource.texture

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		score += gem_resource.score
		animation_player.play("Collected")
