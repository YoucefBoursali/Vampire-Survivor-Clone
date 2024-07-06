extends BaseUpgrades
class_name SpeedUpgrade
@export var speed: float = 100.0
func apply_upgrade(fireball: FireBall) -> void:
	fireball.speed += speed
