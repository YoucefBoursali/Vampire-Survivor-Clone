extends Area2D


@export var array_gems: Array[Resource] = []
@onready var sprite: Sprite2D = $Sprite2D
var rng := RandomNumberGenerator.new()
var resource: Resource
var random: Resource
var score: int:
	set(val):
		score = val
		SignalBus.Score_added.emit(score)
		print (val)

func _ready() -> void:
	rng.randomize()
	var chances := rng.randi_range(0, 1000)
	if chances <=800:
		random = array_gems[0]
	elif chances >=800 and chances <= 950:
		random = array_gems[1]
	elif chances >= 950 and chances <= 1000:
		random = array_gems[2]
	resource = random
	sprite.texture = resource.texture
func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		score += resource.score
		visible = false
		AudioSfxManager.play("res://Assets/Audio/SoundEffect/collectgem.mp3")
		$CollisionShape2D.set_deferred("disabled", true)
		

func _on_collect_finished() -> void:
	queue_free()
