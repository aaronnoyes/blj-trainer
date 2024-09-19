extends Node

var frame_count = 0
var is_counting = false
var frames_pressed = []
var was_pressed_last_frame = false

func _ready():
	frame_count = 0
	is_counting = false
	frames_pressed.clear()
	was_pressed_last_frame = false

func start_counting():
	if not is_counting:
		is_counting = true
		frame_count = 1
		frames_pressed.clear()

func stop_counting():
	if is_counting:
		is_counting = false

func update(delta):
	var is_pressed = Input.is_anything_pressed()
	
	if is_counting:
		if is_pressed and not was_pressed_last_frame:
			frames_pressed.append(frame_count)
		
		frame_count += 1
		
		if frame_count > 30:
			frame_count = 1
			stop_counting()
		
		was_pressed_last_frame = is_pressed
