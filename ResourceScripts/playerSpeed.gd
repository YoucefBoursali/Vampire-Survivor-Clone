extends BaseUpgrades

class_name PlayerSpeedUpgrade

@export var speed_increase := 100.0

func apply_upgrade_to_player(player: Player) -> void:
	player.speed += speed_increase

