extends Label

func _ready():
	text = "Frame: 1"

func _process(delta):
	if FrameCounter.is_counting:
		text = "Frame: %d" % FrameCounter.frame_count
