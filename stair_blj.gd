extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not FrameCounter.is_counting and Input.is_anything_pressed():
		FrameCounter.start_counting()
	FrameCounter.update(delta)
