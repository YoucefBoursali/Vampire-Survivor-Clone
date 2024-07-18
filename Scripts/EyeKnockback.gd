extends EyeState

var timer: Timer

func enter() -> void:
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 1
	timer.timeout.connect(on_timeout)
	add_child(timer)


func on_timeout() -> void:
	Transition.emit(self, "EyeFellow")
	

func exit() -> void:
	timer.queue_free()

