extends EyeState

@export var speed := 100
func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")

func state_physics(delta: float) -> void:
	if eye.Is_dead:
		return
	var direction := eye.global_position.direction_to(player.global_position)
	if eye:
		eye.velocity = direction * speed 
	eye.move_and_slide()
