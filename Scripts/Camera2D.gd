extends Camera2D

var camera_tween: Tween


func _ready() -> void:
	camera_tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	camera_tween.tween_property(self, "zoom",Vector2(1,1), 1.5)
