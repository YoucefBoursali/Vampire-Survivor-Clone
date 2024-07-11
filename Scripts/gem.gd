extends Area2D

@onready var collect: AudioStreamPlayer2D = $Collect
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
		visible = false
		collect.play()
		$CollisionShape2D.set_deferred("disabled", true)
		


func _on_collect_finished() -> void:
	queue_free()
