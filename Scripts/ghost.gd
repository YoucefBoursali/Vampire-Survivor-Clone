extends Sprite2D
func _ready() -> void:
	ghosting()
func properties(pos: Vector2, scal: Vector2) -> void:
	global_position = pos
	scale = scal
func ghosting() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", Color(1, 1, 1, 0), 0.75)
	await tween.finished
	queue_free()
