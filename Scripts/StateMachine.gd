extends Node

@export var initial_state: State
var current_state: State
var state: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			state[child.name.to_lower()] = child
			child.Transitioned.connect(on_transitioned)
	if initial_state:
		initial_state.enter()
		initial_state = current_state

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.state_physics(delta)

func _process(delta: float) -> void:
	if current_state:
		current_state.state_process(delta)
		
func on_transitioned(states: State, new_state_name: String) -> void:
	if states != current_state:
		return
	var new_state: State = state.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
