extends Node

@export var initial_state: EyeState
var current_state: EyeState
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is EyeState:
			states[child.name.to_lower()] = child
			child.Transition.connect(on_transitioned)
	if initial_state:
		current_state = initial_state
		current_state.enter()

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.state_physics(delta)

func _process(delta: float) -> void:
	if current_state:
		current_state.state_process(delta)
		
func on_transitioned(state: EyeState, new_state_name: String) -> void:
	if state != current_state:
		return
	var new_state: EyeState = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
