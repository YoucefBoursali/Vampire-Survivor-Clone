extends State



@export var speed := 50
func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")


func state_physics(delta: float) -> void:
	if skeleton.Is_dead:
		return
	var direction := skeleton.global_position.direction_to(player.global_position)
	if skeleton:
		skeleton.velocity = direction * speed
	skeleton.move_and_slide()
