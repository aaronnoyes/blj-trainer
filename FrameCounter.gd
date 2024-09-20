extends Node

var frame_count = 0
var is_counting = false
var frames_pressed = []
var was_pressed_last_frame = false
var total_time = 0.0
var total_presses = 0
var bpm = 0.0
var time_since_last_press = 0.0

func _ready():
	reset_counter()

func reset_counter():
	frame_count = 0
	is_counting = false
	frames_pressed.clear()
	was_pressed_last_frame = false
	total_time = 0.0
	total_presses = 0
	bpm = 0.0
	time_since_last_press = 0.0

func start_counting():
	if not is_counting:
		is_counting = true
		frame_count = 1
		frames_pressed.clear()
		total_time = 0.0
		total_presses = 0
		bpm = 0.0
		time_since_last_press = 0.0

func stop_counting():
	if is_counting:
		is_counting = false

func update(delta):
	var is_pressed = Input.is_anything_pressed()

	if is_counting:
		total_time += delta
		time_since_last_press += delta

		if is_pressed and not was_pressed_last_frame:
			frames_pressed.append(frame_count)
			total_presses += 1
			time_since_last_press = 0.0

		if total_time > 0:
			bpm = (total_presses / total_time) * 60.0

		frame_count += 1

		if time_since_last_press > 1.0:
			stop_counting()

	was_pressed_last_frame = is_pressed
