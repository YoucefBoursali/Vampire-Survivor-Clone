extends Area2D

class_name HitboxComponent
signal damaged(attack: Attack)
signal hurting()
func damage(attack: Attack) -> void:
	damaged.emit(attack)
	hurting.emit()
	
