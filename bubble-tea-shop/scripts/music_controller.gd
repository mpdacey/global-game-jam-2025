extends Node

var _interactive_music: AudioStreamPlayback
@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var percussion_animator = $PercussionPlayer/PercussionAnimator

func _ready():
	_interactive_music = music_player.get_stream_playback()

func _input(event):
	if not OS.is_debug_build():
		return
	
	if Input.is_key_pressed(KEY_1):
		_set_day_music(0)
	elif Input.is_key_pressed(KEY_3):
		_set_day_music(2)
	elif Input.is_key_pressed(KEY_5):
		_set_day_music(4)

func _set_day_music(day_index: int):
	if day_index % 2 == 1 || day_index == 0:
		return
	
	var key = &"Early"
	match (day_index):
		2, 3:
			key = &"Mid"
		4:
			key = &"Late"
	
	_interactive_music.switch_to_clip_by_name(key)

func _set_music_volume(value: float):
	AudioServer.set_bus_volume_db(0,remap((log(value)+2)*0.5, 0, 1, -80, 0))

func _enter_prep_station():
	percussion_animator.play("fade_in")

func _exit_prep_station():
	percussion_animator.play_backwards("fade_in")
