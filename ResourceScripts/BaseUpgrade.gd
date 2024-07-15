extends Resource
class_name BaseUpgrades

@export var texture: Texture2D
@export var score: int = 0
func apply_upgrade(fireball: FireBall) -> void:
	pass
func apply_upgrade_to_player(player: Player) -> void:
	pass
