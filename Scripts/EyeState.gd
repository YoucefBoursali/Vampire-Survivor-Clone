
extends Node
class_name EyeState
signal Transition(states: EyeState, new_state_name: String)

@onready var player: Player
@onready var eye: Eye = get_owner()

func _ready() -> void:
	eye.hurt.connect(on_hurt)
func enter() -> void:
	pass

func exit() -> void:
	pass

func state_process(delta: float) -> void:
	pass

func state_physics(delta: float) -> void:
	pass

func on_hurt() -> void:
	Transition.emit(self,"EyeHurt")
	
