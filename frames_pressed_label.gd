extends Label

func _ready():
	text = ""

func _process(delta):
	if FrameCounter.is_counting:
		text = " ".join(FrameCounter.frames_pressed)
