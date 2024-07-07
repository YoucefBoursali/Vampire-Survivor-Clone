extends BaseUpgrades
class_name PierceUpgrade

@export var max_pierce := 1

func apply_upgrade(fireball: FireBall) -> void:
	fireball.max_pierce += max_pierce
