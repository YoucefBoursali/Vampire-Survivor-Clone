extends BaseUpgrades
class_name SpeedUpgrade

@export var speed_increase := 100.0

func apply_upgrade(fireball: FireBall) -> void:
	fireball.speed += speed_increase
