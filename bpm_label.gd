extends Label

func _ready():
	text = "BPM: 0.0"

func _process(delta):
	if FrameCounter.is_counting:
		text = "BPM: %.2f" % FrameCounter.bpm
