extends CanvasLayer

@onready var progress_bar: TextureProgressBar = $TextureProgressBar

func _ready() -> void:
	SignalBus.Score_added.connect(on_score_changed)
	
func on_score_changed(score: int) -> void:
	progress_bar.value += score
	if progress_bar.value >= progress_bar.max_value:
		progress_bar.value = 0
		progress_bar.max_value *= 2
