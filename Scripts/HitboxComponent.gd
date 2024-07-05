extends Area2D

class_name HitboxComponent

signal damaged(attack: Attack)

func damage(attack: Attack) -> void:
	damaged.emit(attack)
