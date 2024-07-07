@tool
extends Area2D
@export var sprite: Sprite2D
@onready var player := get_tree().get_first_node_in_group("Player")
@export var base_upgrade: BaseUpgrades:
	set(val):
		base_upgrade = val
		needs_update = true

var needs_update: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	sprite.texture = base_upgrade.texture
	base_upgrade.apply_upgrade_to_player(player)

func _process(delta: float) -> void:
	# This is run only when we're editing the scene
	# It updates the texture of the sprite when we replace the upgrade strategy
	if Engine.is_editor_hint():
		if needs_update:
			sprite.texture = base_upgrade.texture
			needs_update = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		var player: Player = body
		body.upgrade.append(base_upgrade)
		queue_free()
