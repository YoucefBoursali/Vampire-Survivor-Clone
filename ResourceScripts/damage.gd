extends BaseUpgrades
class_name DamageUpgrade
@export var damage_increase := 5.0
func apply_upgrade(fireball: FireBall) -> void:
	fireball.damage += damage_increase
