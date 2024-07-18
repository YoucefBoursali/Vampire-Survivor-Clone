extends EyeState

var timer: Timer


func enter() -> void:
	eye.Is_hit = true
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.4
	timer.timeout.connect(on_timeout)
	add_child(timer)

func on_timeout() -> void:
	Transition.emit(self, "EyeFellow")

func exit() -> void:
	eye.Is_hit = false
	timer.queue_free()
