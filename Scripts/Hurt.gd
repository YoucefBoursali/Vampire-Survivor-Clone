extends State

var timer: Timer

func enter() -> void:
	skeleton.Is_hit = true
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.3
	timer.timeout.connect(on_timeout)
	add_child(timer)


func on_timeout() -> void:
	Transitioned.emit(self, "Fellow")

func exit() -> void:
	skeleton.Is_hit = false
	timer.queue_free()
